import re
import matplotlib.pyplot as plt
import glob
import numpy as np
from collections import defaultdict

def extract_bandwidth_from_matrix(filename):
    """Extract bandwidth value from bandwidth matrix files."""
    with open(filename, 'r') as f:
        for line in f:
            if line.strip() and line.strip()[0].isdigit():
                parts = line.split()
                if len(parts) >= 2:
                    try:
                        bandwidth = float(parts[-1])
                        return bandwidth
                    except ValueError:
                        continue
    return None

def extract_latency_from_idle(filename):
    """Extract latency from idle latency files."""
    with open(filename, 'r') as f:
        for line in f:
            # Look for line with latency in ns
            match = re.search(r'\(\s*([\d.]+)\s*ns\)', line)
            if match:
                latency = float(match.group(1))
                return latency
    return None

def parse_filename(filename):
    """Parse filename to extract pattern and run number.
    Expected formats:
    - results_bw_pattern=<pattern>_run=<num>.txt (for bandwidth)
    - results_pattern=<pattern>_run=<num>.txt (for latency)
    """
    # Try bandwidth pattern first
    match_bw = re.search(r'bw_pattern=(\w+)_run=(\d+)', filename)
    if match_bw:
        pattern = match_bw.group(1)
        run_num = int(match_bw.group(2))
        return 'bandwidth', pattern, run_num
    
    # Try latency pattern
    match_lat = re.search(r'pattern=(\w+)_run=(\d+)', filename)
    if match_lat:
        pattern = match_lat.group(1)
        run_num = int(match_lat.group(2))
        return 'latency', pattern, run_num
    
    return None, None, None

def plot_pattern_comparison(bw_pattern='results_bw_pattern=*_run=*.txt',
                            lat_pattern='results_pattern=*_run=*.txt'):
    """Plot bandwidth vs latency for different access patterns."""
    
    # Read bandwidth files
    bw_files = glob.glob(bw_pattern)
    lat_files = glob.glob(lat_pattern)
    print(bw_files)
    if not bw_files or not lat_files:
        print(f"Missing files. Found {len(bw_files)} bandwidth files and {len(lat_files)} latency files")
        return
    
    # Group data by pattern
    pattern_data = defaultdict(lambda: {'bandwidths': [], 'latencies': []})
    
    # Process bandwidth files
    for filename in bw_files:
        file_type, pattern, run_num = parse_filename(filename)
        if file_type == 'bandwidth' and pattern:
            bw = extract_bandwidth_from_matrix(filename)
            if bw is not None:
                pattern_data[pattern]['bandwidths'].append(bw)
                print(f"Processed BW: {filename} -> pattern={pattern}, run={run_num}, bw={bw:.1f} MB/sec")
    
    # Process latency files
    for filename in lat_files:
        file_type, pattern, run_num = parse_filename(filename)
        if file_type == 'latency' and pattern:
            lat = extract_latency_from_idle(filename)
            if lat is not None:
                pattern_data[pattern]['latencies'].append(lat)
                print(f"Processed LAT: {filename} -> pattern={pattern}, run={run_num}, lat={lat:.1f} ns")
    
    if not pattern_data:
        print("No valid data found")
        return
    
    # Calculate averages and error bars
    patterns = []
    avg_bandwidths = []
    avg_latencies = []
    bw_errors = []
    lat_errors = []
    
    for pattern in sorted(pattern_data.keys()):
        bws = pattern_data[pattern]['bandwidths']
        lats = pattern_data[pattern]['latencies']
        
        if not bws or not lats:
            print(f"Warning: Pattern '{pattern}' missing data (BW: {len(bws)}, LAT: {len(lats)})")
            continue
        
        patterns.append(pattern)
        
        # Calculate averages
        avg_bw = np.mean(bws)
        avg_lat = np.mean(lats)
        avg_bandwidths.append(avg_bw)
        avg_latencies.append(avg_lat)
        
        # Calculate min/max error bars
        bw_errors.append([avg_bw - min(bws), max(bws) - avg_bw])
        lat_errors.append([avg_lat - min(lats), max(lats) - avg_lat])
        
        print(f"\n{pattern.upper()}: BW={avg_bw:.1f} MB/sec (±{max(bws)-min(bws):.1f}), "
              f"LAT={avg_lat:.1f} ns (±{max(lats)-min(lats):.1f})")
    
    if not patterns:
        print("No complete pattern data found")
        return
    
    # Convert error arrays to proper shape for matplotlib
    bw_errors = np.array(bw_errors).T
    lat_errors = np.array(lat_errors).T
    
    # Create the plot
    fig, ax = plt.subplots(figsize=(10, 8))
    
    # Define colors for patterns
    colors = {'seq': 'steelblue', 'rand': 'coral', 'sequential': 'steelblue', 'random': 'coral'}
    markers = {'seq': 'o', 'rand': 's', 'sequential': 'o', 'random': 's'}
    
    for i, pattern in enumerate(patterns):
        color = colors.get(pattern, 'gray')
        marker = markers.get(pattern, 'o')
        
        ax.errorbar(avg_latencies[i], avg_bandwidths[i],
                   xerr=[[lat_errors[0][i]], [lat_errors[1][i]]],
                   yerr=[[bw_errors[0][i]], [bw_errors[1][i]]],
                   marker=marker, markersize=12, linewidth=2,
                   color=color, capsize=5, capthick=2,
                   label=pattern.capitalize(), alpha=0.8)
    
    ax.set_xlabel('Latency (ns)', fontsize=12)
    ax.set_ylabel('Bandwidth (MB/sec)', fontsize=12)
    ax.set_title('Memory Bandwidth vs Latency: Sequential vs Random Access\n(Averaged with Min/Max Range)',
                fontsize=14, fontweight='bold')
    ax.legend(loc='best', fontsize=11)
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig("pattern_comparison.png", dpi=150)
    plt.show()

if __name__ == '__main__':
    print("=" * 60)
    print("Plotting Sequential vs Random Access Patterns...")
    print("=" * 60)
    plot_pattern_comparison('results_bw_pattern=*_run=*.txt',
                           'results_pattern=*_run=*.txt')