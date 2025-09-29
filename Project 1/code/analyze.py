import os
import re
import argparse
import numpy as np
import pandas as pd
import matplotlib
# Use non-interactive backend so PNGs can be produced in headless environments
matplotlib.use('Agg')
import matplotlib.pyplot as plt


def find_csv_files(exp_dir):
    files = [f for f in os.listdir(exp_dir) if f.endswith('.csv')]
    return files


def load_all(exp_dir, variants=('scalar', 'simd')):
    # Load CSVs for the listed variants. Return dict variant->DataFrame
    data = {}
    for v in variants:
        pattern = re.compile(rf'^{re.escape(v)}_.*_([^_.]+)\.csv$')
        matched = [f for f in os.listdir(exp_dir) if pattern.match(f)]
        if not matched:
            data[v] = None
            continue
        dfs = []
        for fname in matched:
            path = os.path.join(exp_dir, fname)
            df = pd.read_csv(path)
            # normalize columns
            if 'elapsed_sec' in df.columns:
                df['elapsed_sec'] = pd.to_numeric(df['elapsed_sec'], errors='coerce').replace([np.inf, -np.inf], 0).fillna(0)
            if 'gflops' in df.columns:
                df['gflops'] = pd.to_numeric(df['gflops'], errors='coerce').replace([np.inf, -np.inf], 0).fillna(0)
            df['array_size'] = pd.to_numeric(df['array_size'], errors='coerce')
            dfs.append(df)
        if dfs:
            data[v] = pd.concat(dfs, ignore_index=True)
        else:
            data[v] = None
    return data


def summarize_by_size(df, kernel, min_run=5):
    if df is None:
        return pd.DataFrame()
    kdf = df[(df['kernel'] == kernel) & (df['run'] >= min_run) & (df['elapsed_sec'] > 0)]
    if kdf.empty:
        return pd.DataFrame()
    grp = kdf.groupby('array_size')
    # return mean GFLOP/s and mean elapsed for compatibility with existing plots
    summary = grp.agg({'gflops': 'mean', 'elapsed_sec': 'mean'}).reset_index()
    return summary.sort_values('array_size')


def plot_exp1(exp_dir='exp1', out_png='exp1_baseline_vs_auto.png'):
    variants = ('scalar', 'simd')
    data = load_all(exp_dir, variants)

    # determine kernels present (from any variant) - coerce to str and drop nulls
    kernels = set()
    for df in data.values():
        if 'kernel' in df.columns:
            vals = df['kernel'].dropna().unique().tolist()
            kernels.update([str(v) for v in vals])
    if not kernels:
        print('No data found in', exp_dir)
        return
    kernels = sorted(kernels)

    # cache sizes (bytes) - adjust if you know your machine specifics
    cache_bytes = {'L1': 32*1024, 'L2': 512*1024, 'L3': 8*1024*1024, "DRAM": 1 << 30}

    # one subplot per kernel: GFLOPS and speedup (two rows)
    n = len(kernels)
    fig, axes = plt.subplots(nrows=n, ncols=2, figsize=(12, 4*n), squeeze=False)

    for i, kernel in enumerate(kernels):
        sums = {v: summarize_by_size(data[v], kernel) for v in variants}
        # union of sizes (iterate DataFrame objects directly)
        sizes = sorted({int(s) for df in sums.values() for s in (df['array_size'].tolist() if not df.empty else [])})
        if not sizes:
            axes[i][0].text(0.5, 0.5, 'no valid data', ha='center')
            axes[i][1].text(0.5, 0.5, 'no valid data', ha='center')
            continue

        # GFLOPS plot
        ax_g = axes[i][0]
        for v in variants:
            dfv = sums[v]
            if dfv.empty:
                continue
        ax_g.plot(dfv['array_size'], dfv['gflops'], marker='o', label=v)
        ax_g.set_xscale('log')
        ax_g.set_xlabel('array_size (elements)')
        ax_g.set_ylabel('GFLOP/s')
        ax_g.set_title(f'{kernel} GFLOP/s across working set sizes')
        ax_g.legend()
        ax_g.grid(True, which='both', ls='--')

        # annotate cache boundaries (convert bytes -> elements, f32=4 bytes)
        for name, b in cache_bytes.items():
            elem = b // 4
            ax_g.axvline(elem, color='k', linestyle=':', linewidth=1)
            # place label near top; protect if ylim not set yet
            try:
                ytext = ax_g.get_ylim()[1] * 0.9
            except Exception:
                ytext = 0
            ax_g.text(elem, ytext, name, rotation=90, va='top', ha='right')

        # Speedup plot (scalar / auto and scalar / simd)
        ax_s = axes[i][1]
        # build arrays aligned to sizes list
        scalar_map = {int(r['array_size']): r['gflops'] for _, r in sums['scalar'].iterrows()} if not sums['scalar'].empty else {}
        simd_map = {int(r['array_size']): r['gflops'] for _, r in sums['simd'].iterrows()} if not sums['simd'].empty else {}

        spd_simd = []
        for s in sizes:
            sg = scalar_map.get(s, 0)
            mg = simd_map.get(s, 0)
            # Speedup = vector_gflops / scalar_gflops
            if sg > 0 and mg > 0:
                spd_simd.append(mg / sg)
            else:
                spd_simd.append(np.nan)

        ax_s.plot(sizes, spd_simd, marker='o', label='scalar/simd')
        ax_s.set_xscale('log')
        ax_s.set_xlabel('array_size (elements)')
        ax_s.set_ylabel('Speedup')
        ax_s.set_title(f'{kernel} Speedup (scalar / vectorized)')
        ax_s.grid(True, which='both', ls='--')
        ax_s.legend()
        for name, b in cache_bytes.items():
            elem = b // 4
            ax_s.axvline(elem, color='k', linestyle=':', linewidth=1)

    plt.tight_layout()
    fig.savefig(out_png)
    print('Saved chart to', out_png)


def plot_exp2(exp_dir='exp2', out_png='exp2_sweep.png', variants=('scalar','simd'), cpu_ghz=3.0):
    """Analyze sweep runs: produce GFLOP/s (and GiB/s) and CPE, annotate cache transitions."""
    data = load_all(exp_dir, variants)

    # determine kernels present
    kernels = set()
    for df in data.values():
        if df is None:
            continue
        kernels.update(df['kernel'].unique())
    if not kernels:
        print('No data found in', exp_dir)
        return
    kernels = sorted(kernels)

    # cache sizes in bytes
    cache_bytes = {'L1': 32*1024, 'L2': 512*1024, 'L3': 8*1024*1024}

    # bytes accessed per element for each kernel (approx)
    bytes_per_elem = {
        'SAXPY': 3 * 4,   # read x,y write y
        'DOT': 2 * 4,     # read x,y
        'MUL': 3 * 4,     # read x,y write z
        'STENCIL': 4 * 4, # read x-1,x,x+1 write y
    }

    n = len(kernels)
    fig, axes = plt.subplots(nrows=n, ncols=2, figsize=(14, 4*n), squeeze=False)

    for i, kernel in enumerate(kernels):
        sums = {v: summarize_by_size(data[v], kernel) for v in variants}
        # union sizes
        sizes = sorted({int(s) for df in sums.values() for s in (df['array_size'].tolist() if not df.empty else [])})
        if not sizes:
            axes[i][0].text(0.5, 0.5, 'no valid data', ha='center')
            axes[i][1].text(0.5, 0.5, 'no valid data', ha='center')
            continue

        # GFLOPS plot (left) and Bandwidth (GiB/s) as secondary axis
        ax_g = axes[i][0]
        ax_bw = ax_g.twinx()
        for v in variants:
            dfv = sums[v]
            if dfv.empty:
                continue
            ax_g.plot(dfv['array_size'], dfv['gflops'], marker='o', label=f'{v} GFLOP/s')
            # compute bandwidth per size
            bw_vals = []
            for _, row in dfv.iterrows():
                N = int(row['array_size'])
                elapsed = float(row['elapsed_sec'])
                bpe = bytes_per_elem.get(kernel, 3*4)
                bw = (bpe * N) / elapsed / (1024**3) if elapsed > 0 else 0
                bw_vals.append(bw)
            ax_bw.plot(dfv['array_size'], bw_vals, marker='x', linestyle='--', label=f'{v} GiB/s')

        # show combined legend for GFLOPS and GiB/s
        h1, l1 = ax_g.get_legend_handles_labels()
        h2, l2 = ax_bw.get_legend_handles_labels()
        if h1 or h2:
            ax_g.legend(h1 + h2, l1 + l2, loc='best')

        ax_g.set_xscale('log')
        ax_g.set_xlabel('array_size (elements)')
        ax_g.set_ylabel('GFLOP/s')
        ax_bw.set_ylabel('GiB/s')
        ax_g.set_title(f'{kernel} GFLOP/s and Bandwidth')
        ax_g.grid(True, which='both', ls='--')

        # annotate cache boundaries
        for name, b in cache_bytes.items():
            elem = b // 4
            ax_g.axvline(elem, color='k', linestyle=':', linewidth=1)
            try:
                ytext = ax_g.get_ylim()[1] * 0.9
            except Exception:
                ytext = 0
            ax_g.text(elem, ytext, name, rotation=90, va='top', ha='right')

        # CPE plot
        ax_c = axes[i][1]
        for v in variants:
            dfv = sums[v]
            if dfv.empty:
                continue
            cpe = []
            for _, row in dfv.iterrows():
                N = int(row['array_size'])
                elapsed = float(row['elapsed_sec'])
                cycles = elapsed * (cpu_ghz * 1e9)
                cpe.append(cycles / N if N > 0 else np.nan)
            ax_c.plot(dfv['array_size'], cpe, marker='o', label=f'{v} CPE')
        ax_c.set_xscale('log')
        ax_c.set_xlabel('array_size (elements)')
        ax_c.set_ylabel('Cycles per element (CPE)')
        ax_c.set_title(f'{kernel} CPE across working set sizes')
        ax_c.grid(True, which='both', ls='--')
        ax_c.legend()

    plt.tight_layout()
    fig.savefig(out_png)
    print('Saved exp2 chart to', out_png)


def main():
    p = argparse.ArgumentParser(description='Analyze experiments and produce charts')
    p.add_argument('--exp', default='exp1', help='experiment folder (exp1..exp5) or "roofline"')
    p.add_argument('--out', default='exp1_baseline_vs_auto.png', help='output PNG filename')
    p.add_argument('--peak', type=float, default=25.22, help='peak GFLOP/s for compute roof (default 25.22)')
    p.add_argument('--memmhz', type=float, default=3200.0, help='memory DRAM data rate in MT/s (e.g. 3200) to estimate bandwidth')
    args = p.parse_args()
    if args.exp == 'exp1':
        plot_exp1(args.exp, args.out)
    elif args.exp == 'exp2':
        plot_exp2(args.exp, args.out)
    elif args.exp == 'exp3':
        plot_exp3(args.exp, args.out)
    elif args.exp == 'exp4':
        plot_exp4(args.exp, args.out)
    elif args.exp == 'exp5':
        plot_exp5(args.exp, args.out)
    elif args.exp == 'roofline':
        plot_roofline(args.out, peak_gflops=args.peak, mem_mhz=args.memmhz)
    # elif args.exp == 'roofline_data_type':
    #     # simple roofline using provided peak GFLOP/s and memory rate (MT/s)
    #     plot_roofline_data_type(args.out, peak_gflops=args.peak, mem_mhz=args.memmhz)
    # elif args.exp == 'roofline_memory':
    #     # simple roofline using provided peak GFLOP/s and memory rate (MT/s)
    #     plot_roofline_memory(args.out, peak_gflops=args.peak, mem_mhz=args.memmhz)
    else:
        print('exp option not implemented; supported: exp1, exp2, exp3, exp4, exp5, roofline_data_type, roofline_memory')
    

def plot_exp3(exp_dir='exp3', out_png='exp3_alignment_tail.png', variants=('scalar','simd')):
    """Analyze alignment and tail handling: compare aligned vs misaligned and tail/no-tail."""
    data = load_all(exp_dir, variants)

    # determine kernels present
    kernels = set()
    for df in data.values():
        if df is None:
            continue
        kernels.update(df['kernel'].unique())
    if not kernels:
        print('No data found in', exp_dir)
        return
    kernels = sorted(kernels)

    # We'll create one plot per kernel showing grouped bars for (aligned/misaligned) x (tail/no-tail)
    n = len(kernels)
    fig, axes = plt.subplots(nrows=n, ncols=1, figsize=(8, 3*n), squeeze=False)

    for i, kernel in enumerate(kernels):
        ax = axes[i][0]
        # Build a small dataframe combining variants
        rows = []
        for v in variants:
            dfv = data[v]
            if dfv is None:
                continue
            kdf = dfv[(dfv['kernel'] == kernel) & (dfv['run'] >= 5) & (dfv['elapsed_sec'] > 0)]
            if kdf.empty:
                continue
            # group by aligned and tail
            g = kdf.groupby(['aligned','tail']).agg({'gflops':'mean','array_size':'count'}).reset_index()
            for _, r in g.iterrows():
                rows.append({'variant': v, 'aligned': int(r['aligned']), 'tail': int(r['tail']), 'gflops': r['gflops']})

        if not rows:
            ax.text(0.5, 0.5, 'no valid data', ha='center')
            continue

        summary = pd.DataFrame(rows)
        # pivot to have columns per variant+flags
        # create a label for the group
        summary['group'] = summary['aligned'].map({1:'aligned',0:'misaligned'}) + '\n' + summary['tail'].map({1:'tail',0:'no-tail'})

        groups = summary['group'].unique()
        x = np.arange(len(groups))
        width = 0.35

        # for each variant, get gflops per group
        for j, v in enumerate(variants):
            vals = []
            for gname in groups:
                row = summary[(summary['variant']==v) & (summary['group']==gname)]
                vals.append(row['gflops'].values[0] if not row.empty else 0)
            ax.bar(x + j*width, vals, width, label=v)

        ax.set_xticks(x + width*(len(variants)-1)/2)
        ax.set_xticklabels(groups)
        ax.set_ylabel('GFLOP/s')
        ax.set_title(f'{kernel}: alignment and tail effect')
        ax.legend()
        ax.grid(axis='y', ls='--')

    plt.tight_layout()
    fig.savefig(out_png)
    print('Saved exp3 chart to', out_png)


def parse_access_label(access_str):
    # normalize access description into bucket: unit, stride=N, gather=N
    if pd.isna(access_str):
        return 'unknown'
    s = str(access_str)
    s = s.strip()
    # unit stride variants
    if 'unit-stride' in s or 'unit_stride' in s or 'unit stride' in s:
        return 'unit'
    # stride=K
    m = re.search(r'stride\s*=\s*(\d+)', s)
    if m:
        return f'stride={m.group(1)}'
    # gather=K or gather-K
    m = re.search(r'gather\s*[=\-]?\s*(\d+)', s)
    if m:
        return f'gather-{m.group(1)}'
    return access_str


def plot_exp4(exp_dir='exp4', out_png='exp4_stride_gather.png', variants=('scalar','simd')):
    """Analyze stride/gather effects: compare unit-stride vs stride/gather patterns."""
    data = load_all(exp_dir, variants)
    # determine kernels present
    kernels = set()
    for df in data.values():
        if df is None:
            continue
        kernels.update(df['kernel'].unique())
    if not kernels:
        print('No data found in', exp_dir)
        return
    kernels = sorted(kernels)

    # For each kernel, create separate bars labeled like 'scalar stride=2' or 'simd gather=4'
    n = len(kernels)
    fig, axes = plt.subplots(nrows=n, ncols=1, figsize=(12, 4*n), squeeze=False)

    for i, kernel in enumerate(kernels):
        ax = axes[i][0]

        # requested canonical patterns
        pattern_order = ['unit', 'stride=2', 'stride=4', 'stride=8', 'gather-2', 'gather-4', 'gather-8']

        # collect mean gflops per (variant, pattern)
        vals = {v: {p: 0.0 for p in pattern_order} for v in variants}
        found = False
        for v in variants:
            dfv = data[v]
            if dfv is None:
                continue
            kdf = dfv[(dfv['kernel'] == kernel) & (dfv['run'] >= 5) & (dfv['elapsed_sec'] > 0)]
            if kdf.empty:
                continue
            kdf = kdf.copy()
            # prefer explicit access/stride parsing: look at access column and stride column
            kdf['access_bucket'] = kdf['access'].apply(parse_access_label)

            # map patterns: unit when access indicates unit-stride OR stride==1
            for _, r in kdf.iterrows():
                acc = r['access_bucket']
                # try to get numeric stride from the stride column if present
                stride = None
                try:
                    if not pd.isna(r['stride']):
                        stride = int(r['stride'])
                except Exception:
                    stride = None

                pattern = None
                a = str(acc).lower()
                # unit detection
                if a in ('unit', 'unit-stride', 'unit_stride', 'unit stride') or stride == 1:
                    pattern = 'unit'
                # stride detection: prefer numeric in access, else use stride column
                elif 'stride' in a:
                    m = re.search(r'(\d+)', a)
                    if m:
                        pattern = f'stride={m.group(1)}'
                    elif stride is not None:
                        pattern = f'stride={stride}'
                # gather detection: prefer numeric in access, else use stride column
                elif 'gather' in a:
                    m = re.search(r'(\d+)', a)
                    if m:
                        pattern = f'gather-{m.group(1)}'
                    elif stride is not None:
                        pattern = f'gather-{stride}'
                else:
                    # fallback: if stride column indicates a non-unit stride
                    if stride is not None and stride > 1:
                        pattern = f'stride={stride}'

                if pattern and pattern in vals[v]:
                    # accumulate into list: we'll average after
                    if isinstance(vals[v][pattern], float) and vals[v][pattern] == 0.0:
                        vals[v][pattern] = [float(r['gflops'])]
                    elif isinstance(vals[v][pattern], list):
                        vals[v][pattern].append(float(r['gflops']))
                    else:
                        vals[v][pattern] = [float(r['gflops'])]
                    found = True

        if not found:
            ax.text(0.5, 0.5, 'no valid data', ha='center')
            continue

        # compute means and prepare plotting arrays
        types = pattern_order
        x = np.arange(len(types))
        width = 0.35
        for j, v in enumerate(variants):
            bar_vals = []
            for p in types:
                pv = vals[v].get(p, 0.0)
                if isinstance(pv, list):
                    bar_vals.append(float(np.mean(pv)))
                else:
                    # pv may be 0.0 indicating missing
                    bar_vals.append(float(pv) if pv else 0.0)
            ax.bar(x + j*width, bar_vals, width, label=v)
            # annotate
            for xi, val in enumerate(bar_vals):
                if val > 0:
                    ax.text(x[xi] + j*width, val, f"{val:.2f}", ha='center', va='bottom', fontsize=8)

        ax.set_xticks(x + width*(len(variants)-1)/2)
        ax.set_xticklabels([p.replace('gather-', 'gather=') for p in types], rotation=45, ha='right')
        ax.set_ylabel('GFLOP/s')
        ax.set_title(f'{kernel}: mean GFLOP/s by canonical access patterns')
        ax.legend()
        ax.grid(axis='y', ls='--')

    plt.tight_layout()
    fig.savefig(out_png)
    print('Saved exp4 chart to', out_png)


def plot_exp5(exp_dir='exp5', out_png='exp5_types.png', variants=('scalar','simd'), vector_bytes=32):
    """Compare types (f32, f64, optionally i32): grouped bar charts of mean GFLOP/s per type and variant.
    Also compute arithmetic intensity (FLOP/byte) from measured GFLOP/s and elapsed time and print a textual summary
    showing lanes (vector width / bytes per element) and simd/scalar speedups.

    Notes/assumptions:
      - base_bytes_per_elem mapping below assumes f32 (4 bytes) in its values; we scale for other types.
      - FLOPs are taken from measured GFLOP/s * elapsed_sec.
      - lanes = vector_bytes / bytes_per_type.
    """
    data = load_all(exp_dir, variants)

    # determine kernels present
    kernels = set()
    for df in data.values():
        if df is None:
            continue
        kernels.update(df['kernel'].unique())
    if not kernels:
        print('No data found in', exp_dir)
        return
    kernels = sorted(kernels)

    # bytes per element by type
    bytes_per_type = {'f32': 4, 'f64': 8, 'i32': 4}

    # base bytes accessed per element for each kernel (assumes f32). Adjust if you know the kernels differ.
    base_bytes_per_elem = {
        'SAXPY': 3 * 4,   # read x,y write y
        'DOT': 2 * 4,     # read x,y
        'MUL': 3 * 4,     # read x,y write z
        'STENCIL': 4 * 4, # read neighborhood, write
    }

    rows = []
    for kernel in kernels:
        for v in variants:
            dfv = data[v]
            if dfv is None:
                continue
            # relevant rows for this kernel
            kdf = dfv[(dfv['kernel'] == kernel) & (dfv['run'] >= 5) & (dfv['elapsed_sec'] > 0)]
            if kdf.empty:
                continue
            # ensure numeric
            kdf = kdf.copy()
            kdf['array_size'] = pd.to_numeric(kdf['array_size'], errors='coerce').fillna(0).astype(int)
            kdf['elapsed_sec'] = pd.to_numeric(kdf['elapsed_sec'], errors='coerce').fillna(0.0)
            kdf['gflops'] = pd.to_numeric(kdf['gflops'], errors='coerce').fillna(0.0)

            for t in kdf['type'].unique():
                sub = kdf[kdf['type'] == t]
                if sub.empty:
                    continue
                # per-row FLOPs = gflops * 1e9 * elapsed
                flops = (sub['gflops'] * 1e9 * sub['elapsed_sec']).astype(float)
                # bytes accessed = base_bytes_per_elem[kernel] scaled by type size / 4, times N
                base_bpe = base_bytes_per_elem.get(kernel, 3 * 4)
                bpe = base_bpe * (bytes_per_type.get(t, 4) / 4.0)
                bytes_accessed = (sub['array_size'] * bpe).astype(float)
                # avoid divide-by-zero
                ai_per_row = flops / bytes_accessed.replace({0: np.nan})
                mean_ai = float(ai_per_row.replace([np.inf, -np.inf], np.nan).dropna().mean() or 0.0)
                mean_gflops = float(sub['gflops'].mean())
                lanes = int(max(1, vector_bytes // bytes_per_type.get(t, 4)))
                rows.append({'kernel': kernel, 'variant': v, 'type': t, 'mean_gflops': mean_gflops, 'mean_ai': mean_ai, 'lanes': lanes})

    if not rows:
        print('No valid exp5 data found')
        return

    res = pd.DataFrame(rows)

    # Plot: one grouped bar chart per kernel (types on x, bars per variant)
    n = len(kernels)
    fig, axes = plt.subplots(nrows=n, ncols=1, figsize=(9, 4*n), squeeze=False)

    for i, kernel in enumerate(kernels):
        ax = axes[i][0]
        kres = res[res['kernel'] == kernel]
        types = sorted(kres['type'].unique())
        x = np.arange(len(types))
        width = 0.35
        for j, v in enumerate(variants):
            vals = []
            for t in types:
                row = kres[(kres['variant'] == v) & (kres['type'] == t)]
                vals.append(float(row['mean_gflops'].values[0]) if not row.empty else 0.0)
            ax.bar(x + j*width, vals, width, label=v)
            # annotate values
            for xi, val in enumerate(vals):
                if val > 0:
                    ax.text(x[xi] + j*width, val, f"{val:.2f}", ha='center', va='bottom', fontsize=8)

        ax.set_xticks(x + width*(len(variants)-1)/2)
        ax.set_xticklabels(types)
        ax.set_ylabel('GFLOP/s')
        ax.set_title(f'{kernel}: mean GFLOP/s by type and variant')
        ax.legend()
        ax.grid(axis='y', ls='--')

        # print textual summary for this kernel
        print(f"\nSummary for kernel: {kernel}")
        kertab = kres[['variant','type','mean_gflops','mean_ai','lanes']].copy()
        kertab['mean_gflops'] = kertab['mean_gflops'].map(lambda x: f"{x:.3f}")
        kertab['mean_ai'] = kertab['mean_ai'].map(lambda x: f"{x:.3f}")
        print(kertab.to_string(index=False))

        # print simd/scalar speedups per type when both present
        print('\nSpeedup (simd / scalar) by type:')
        for t in types:
            s_row = kres[(kres['variant'] == 'scalar') & (kres['type'] == t)]
            v_row = kres[(kres['variant'] == 'simd') & (kres['type'] == t)]
            if not s_row.empty and not v_row.empty:
                s = float(s_row['mean_gflops'].values[0])
                v = float(v_row['mean_gflops'].values[0])
                if s > 0:
                    print(f"  {t:6s} : {v/s:6.3f}x (simd {v:.3f} / scalar {s:.3f})")
                else:
                    print(f"  {t:6s} : n/a (scalar zero)")

    plt.tight_layout()
    fig.savefig(out_png)
    print('\nSaved exp5 chart to', out_png)

def plot_roofline(out_png='roofline.png', peak_gflops=25.22, mem_mhz=3200.0, 
                  data_dir="roofline"):
    """
    Combined roofline plot on log-log axes showing the characteristic knee.
    
    Args:
        out_png: Output filename for the plot
        peak_gflops: Peak compute performance in GFLOP/s
        mem_mhz: Memory clock speed in MHz
        data_dir: Directory to scan for CSV files (defaults to current directory)
    """
    import os
    import numpy as np
    import pandas as pd
    import matplotlib.pyplot as plt
    
    # Estimate bandwidth
    bw_gib = 25.0
    bw_bytes_per_s = bw_gib * (1024**3)

    # Data type sizes and bytes per element for different kernels
    bytes_per_type = {'f32': 4, 'f64': 8, 'i32': 4}
    base_bytes_per_elem = {'SAXPY': 3*4, 'DOT': 2*4, 'MUL': 3*4, 'STENCIL': 4*4}

    # Determine which directory to scan
    if data_dir is None:
        data_dir = '.'
    
    # Scan for CSV files
    files_to_scan = []
    if os.path.isdir(data_dir):
        for root, _, files in os.walk(data_dir):
            for f in files:
                if f.endswith('.csv'):
                    files_to_scan.append(os.path.join(root, f))
    
    # Fallback: scan exp* directories
    if not files_to_scan:
        for entry in sorted(os.listdir('.')):
            if not entry.startswith('exp'):
                continue
            for root, _, files in os.walk(entry):
                for f in files:
                    if f.endswith('.csv'):
                        files_to_scan.append(os.path.join(root, f))

    print(f"Scanning {len(files_to_scan)} CSV files...")

    # Process CSV files and extract measurement points
    pts = []
    for path in files_to_scan:
        try:
            df = pd.read_csv(path)
        except Exception:
            continue
        
        if 'elapsed_sec' not in df.columns or 'gflops' not in df.columns:
            continue
        
        df = df.copy()
        if 'array_size' in df.columns:
            df['array_size'] = pd.to_numeric(df['array_size'], errors='coerce').fillna(0).astype(int)
        df['elapsed_sec'] = pd.to_numeric(df['elapsed_sec'], errors='coerce').fillna(0.0)
        df['gflops'] = pd.to_numeric(df['gflops'], errors='coerce').fillna(0.0)

        valid = df[(df['array_size'] > 0) & (df['elapsed_sec'] > 0) & (df['gflops'] > 0)]
        if valid.empty:
            continue

        # Compute arithmetic intensity for each row
        ais = []
        for _, r in valid.iterrows():
            kernel = r.get('kernel', '')
            t = r.get('type', 'f32')
            N = int(r.get('array_size', 0))
            elapsed = float(r.get('elapsed_sec', 0.0))
            gflops = float(r.get('gflops', 0.0))
            base_bpe = base_bytes_per_elem.get(kernel, 3*4)
            bpe = base_bpe * (bytes_per_type.get(t, 4) / 4.0)
            flops = gflops * 1e9 * elapsed
            bytes_moved = N * bpe
            if bytes_moved <= 0:
                continue
            ais.append(flops / bytes_moved)

        if not ais:
            continue

        mean_ai = float(np.mean(ais))
        mean_gflops = float(valid['gflops'].mean())

        # Infer variant (scalar/simd)
        variant = None
        if 'variant' in valid.columns:
            vals = valid['variant'].dropna().unique().tolist()
            if vals:
                variant = str(vals[0])
        if not variant:
            fn = os.path.basename(path).lower()
            if 'scalar' in fn:
                variant = 'scalar'
            elif 'simd' in fn:
                variant = 'simd'
            else:
                variant = '?'

        # Infer data type
        dtype = None
        if 'type' in valid.columns:
            td = valid['type'].dropna().unique().tolist()
            if td:
                dtype = str(td[0])
        if not dtype:
            fn = os.path.basename(path).lower()
            if 'f32' in fn:
                dtype = 'f32'
            elif 'f64' in fn:
                dtype = 'f64'
            elif 'i32' in fn:
                dtype = 'i32'
            else:
                dtype = '?'

        # Infer memory level
        fn = os.path.basename(path).lower()
        tokens = [p for p in os.path.splitext(fn)[0].split('_') if p != '']
        mem_raw = tokens[-1] if tokens else 'unknown'
        if 'l1small' in mem_raw or 'l1_small' in mem_raw:
            mem_label = 'l1small'
        elif 'l1large' in mem_raw or 'l1_large' in mem_raw:
            mem_label = 'l1large'
        elif 'l2' in mem_raw:
            mem_label = 'l2'
        elif 'l3' in mem_raw:
            mem_label = 'l3'
        elif 'dram' in mem_raw:
            mem_label = 'dram'
        else:
            mem_label = mem_raw

        pts.append({
            'variant': variant,
            'dtype': dtype,
            'mem_label': mem_label,
            'ai': mean_ai,
            'gflops': mean_gflops,
            'source': path
        })

    if not pts:
        print('No measurement rows found in CSV files to plot roofline')
        return

    dfpts = pd.DataFrame(pts)
    
    # Apply jitter to duplicate coordinates
    dup_groups = dfpts.groupby(['ai', 'gflops']).size().reset_index(name='count')
    dup_groups = dup_groups[dup_groups['count'] > 1]
    if not dup_groups.empty:
        ai_min = dfpts['ai'].min()
        ai_max = dfpts['ai'].max()
        ai_range = max(1e-12, ai_max - ai_min)
        jitter = max(1e-12, ai_range * 1e-3)
        for _, dg in dup_groups.iterrows():
            aival = dg['ai']
            gval = dg['gflops']
            idxs = dfpts[(dfpts['ai'] == aival) & (dfpts['gflops'] == gval)].index.tolist()
            k = len(idxs)
            for j, ix in enumerate(idxs):
                offset = (j - (k-1)/2.0) * jitter
                dfpts.at[ix, 'ai'] = dfpts.at[ix, 'ai'] + offset

    # Create the plot with log-log axes
    fig, ax = plt.subplots(figsize=(10, 7))
    
    # Calculate the "knee" point where memory and compute roofs intersect
    knee_ai = peak_gflops * 1e9 / bw_bytes_per_s
    
    # Set x-axis range to show the knee clearly
    if not dfpts.empty:
        data_ai_min = dfpts['ai'].min()
        data_ai_max = dfpts['ai'].max()
        xmin = min(data_ai_min * 0.3, knee_ai * 0.1)
        xmax = max(data_ai_max * 3.0, knee_ai * 10.0)
    else:
        xmin = knee_ai * 0.1
        xmax = knee_ai * 10.0
    
    # Generate points for roofline curves
    xs = np.logspace(np.log10(xmin), np.log10(xmax), 300)
    
    # Memory-bound region: GFLOP/s = bandwidth * AI
    mem_y = (bw_bytes_per_s * xs) / 1e9
    
    # Compute-bound region: constant at peak GFLOP/s
    peak_y = np.full_like(xs, peak_gflops)
    
    # Take the minimum to create the actual roofline
    roofline_y = np.minimum(mem_y, peak_y)
    
    # Plot the roofline
    ax.loglog(xs, mem_y, '--', color='gray', alpha=0.7, 
              label=f'Memory roof ({bw_gib:.2f} GiB/s)', linewidth=2)
    ax.loglog(xs, peak_y, '--', color='red', alpha=0.7,
              label=f'Compute roof ({peak_gflops:.2f} GFLOP/s)', linewidth=2)
    ax.loglog(xs, roofline_y, 'k-', linewidth=2.5, label='Roofline', zorder=10)
    
    # Mark the knee point
    ax.plot(knee_ai, peak_gflops, 'k*', markersize=15, 
            label=f'Knee (AI={knee_ai:.3f})', zorder=11)

    # Plot measured points
    cmap = plt.get_cmap('tab20')
    npts = len(dfpts)
    colors = [cmap(i % cmap.N) for i in range(npts)]
    
    for idx, (_, r) in enumerate(dfpts.iterrows()):
        variant = r.get('variant', '?')
        dtype = r.get('dtype', '?')
        mem_label = r.get('mem_label', '?')
        lbl = f"{variant} | {dtype} | {mem_label}"
        ax.plot(r['ai'], r['gflops'], 'o', color=colors[idx], 
                markersize=8, label=lbl, zorder=12)

    ax.set_xlabel('Arithmetic Intensity (FLOP/byte)', fontsize=12)
    ax.set_ylabel('Performance (GFLOP/s)', fontsize=12)
    ax.set_title('Roofline Model', fontsize=14)
    
    ax.legend(fontsize='x-small', loc='best', ncol=2, title='variant | dtype | memory')
    ax.grid(True, which='both', ls=':', alpha=0.5)
    ax.set_xlim(xmin, xmax)
    
    fig.savefig(out_png, bbox_inches='tight', dpi=150)
    print(f'Saved roofline plot to {out_png}')
    print(f'Estimated DRAM bandwidth: {bw_gib:.2f} GiB/s')
    print(f'Compute peak: {peak_gflops:.2f} GFLOP/s')
    print(f'Roofline knee at AI = {knee_ai:.3f} FLOP/byte')

if __name__ == '__main__':
    main()
