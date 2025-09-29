import itertools
import subprocess
import os

# ------------------- Config -------------------

source_file = "pro1.cpp"
exe_name = "pro1"

compiler_variants = {
    "scalar": ["g++", "-O1", "-Wall", "-fno-tree-vectorize", "-fno-tree-slp-vectorize", source_file, "-o", exe_name],
    #"auto": ["g++", "-O3", "-Wall", "-march=native", source_file, "-o", exe_name],
    "simd": ["g++", "-O3", "-Wall", "-mavx2", "-mfma", "-march=native", "-ffast-math", source_file, "-o", exe_name],
}

types = ["f32", "f64", "i32"]
alignments = ["--aligned", "--misaligned"]
tails = ["--tail", "--no-tail"]
access_patterns = ["--unit-stride", "--stride=2", "--stride=4", "--stride=8", "--gather=2", "--gather=4", "--gather=8"]
memory_levels = ["l1small", "l1large", "l2", "l3", "dram", "sweep"]

# ------------------- Run Harness -------------------

def check_csv_files(expected_files):
    print("\n--- CSV File Check ---")
    missing = []
    for fname in expected_files:
        if not os.path.exists(fname):
            missing.append(fname)
    if missing:
        print(f"Missing {len(missing)} CSV files:")
        for f in missing:
            print(f"  {f}")
    else:
        print(f"All {len(expected_files)} expected CSV files found.")
    # Optionally, check for unexpected files
    produced = [f for f in os.listdir('.') if f.endswith('.csv')]
    unexpected = set(produced) - set(expected_files)
    if unexpected:
        print(f"Unexpected CSV files found:")
        for f in unexpected:
            print(f"  {f}")

def exp1():
    # Baseline (scalar) vs auto-vectorized
    # Build a scalar-only baseline and an auto-vectorized version for each selected kernel. Measure runtime
    # across sizes spanning L1→L2→LLC→DRAM. Report speedup = scalar_time / simd_time and achieved
    # GFLOP/s

    expected_files = []
    for comp_name, comp_cmd in list(compiler_variants.items()): #build with all commands
        print(f"building with: {comp_cmd}")
        for mem in memory_levels[:5]: #skip sweep for this experiment
            args = [f"./{exe_name}", comp_name ,str(types[0]), str(alignments[0]), str(tails[1]), str(access_patterns[0]), mem]
            print("Running:", " ".join(args))
            subprocess.run(comp_cmd, check=True)
            try:
                subprocess.run(args, check=True)
                csv_name = "_".join(args[1:]) + ".csv"
                expected_files.append(csv_name)
                if os.path.exists(csv_name):
                    print(f"CSV file produced: {csv_name}")
                else:
                    print(f"CSV file not found: {csv_name}")
            except subprocess.CalledProcessError as e:
                print("Error running:", e)
    check_csv_files(expected_files)

def exp2():
    # Locality (working-set) sweep
    # For one kernel, sweep N to cross cache levels. From the same runs, produce GFLOP/s (or GiB/s for purely
    # streaming) and CPE; annotate cache transitions. Discuss where SIMD gains compress as the kernel
    # becomes memory-bound

    expected_files = []
    for comp_name, comp_cmd in list(compiler_variants.items()): #build with all commands
        print(f"building with: {comp_cmd}")
        args = [f"./{exe_name}", comp_name, str(types[0]), str(alignments[0]), str(tails[1]), str(access_patterns[0]), memory_levels[5]]
        print("Running:", " ".join(args))
        subprocess.run(comp_cmd, check=True)
        try:
            subprocess.run(args, check=True)
            csv_name = "_".join(args[1:]) + ".csv"
            expected_files.append(csv_name)
            if os.path.exists(csv_name):
                print(f"CSV file produced: {csv_name}")
            else:
                print(f"CSV file not found: {csv_name}")
        except subprocess.CalledProcessError as e:
            print("Error running:", e)
    check_csv_files(expected_files)

def exp3():
    # Alignment & tail handling
    # Compare aligned vs misaligned inputs and sizes with/without a vector tail. Quantify the throughput gap
    # and explain (prologue/epilogue cost, unaligned loads, masking)

    expected_files = []
    for comp_name, comp_cmd in list(compiler_variants.items()): #build with all commands 
        print(f"building with: {comp_cmd}")
        for align, tail in itertools.product(alignments, tails):
            args = [f"./{exe_name}", comp_name, str(types[0]), align, tail, str(access_patterns[0]), memory_levels[4]]
            print("Running:", " ".join(args))
            subprocess.run(comp_cmd, check=True)
            try:
                subprocess.run(args, check=True)
                csv_name = "_".join(args[1:]) + ".csv"
                expected_files.append(csv_name)
                if os.path.exists(csv_name):
                    print(f"CSV file produced: {csv_name}")
                else:
                    print(f"CSV file not found: {csv_name}")
            except subprocess.CalledProcessError as e:
                print("Error running:", e)
    check_csv_files(expected_files)

def exp4():
    # Stride / gather effects
    # Evaluate unit-stride vs strided/gather-like patterns (where meaningful). Show the impact on effective
    # bandwidth and SIMD efficiency; explain prefetcher and cache-line utilization effects.

    expected_files = []
    for comp_name, comp_cmd in list(compiler_variants.items()): #build with all commands 
        print(f"building with: {comp_cmd}")
        for access in access_patterns:
            args = [f"./{exe_name}", comp_name, str(types[0]), str(alignments[0]), str(tails[1]), access, str(memory_levels[4])]
            print("Running:", " ".join(args))
            subprocess.run(comp_cmd, check=True)
            try:
                subprocess.run(args, check=True)
                csv_name = "_".join(args[1:]) + ".csv"
                expected_files.append(csv_name)
                if os.path.exists(csv_name):
                    print(f"CSV file produced: {csv_name}")
                else:
                    print(f"CSV file not found: {csv_name}")
            except subprocess.CalledProcessError as e:
                print("Error running:", e)
    check_csv_files(expected_files)

def exp5():
    # Data type comparison
    # Compare float32 vs float64 (and optionally int32). Report how vector width (lanes) and arithmetic
    # intensity affect speedup and GFLOP/s

    expected_files = []
    for comp_name, comp_cmd in list(compiler_variants.items()): #build with all commands 
        print(f"building with: {comp_cmd}")
        for t in types:
            args = [f"./{exe_name}", comp_name, t, str(alignments[0]), str(tails[1]), str(access_patterns[0]), str(memory_levels[4])]
            print("Running:", " ".join(args))
            subprocess.run(comp_cmd, check=True)
            try:
                subprocess.run(args, check=True)
                csv_name = "_".join(args[1:]) + ".csv"
                expected_files.append(csv_name)
                if os.path.exists(csv_name):
                    print(f"CSV file produced: {csv_name}")
                else:
                    print(f"CSV file not found: {csv_name}")
            except subprocess.CalledProcessError as e:
                print("Error running:", e)
    check_csv_files(expected_files)


def roofline():
    # For at least one kernel, compute arithmetic intensity (FLOPs per byte moved) and place your achieved
    # GFLOP/s on a roofline using your measured memory bandwidth (from Project #2, if available) and an
    # estimate of your CPU’s peak FLOP rate. Explain whether you’re compute-bound or memory-bound and
    # how this predicts the observed SIMD speedup

    expected_files = []
    for comp_name, comp_cmd in list(compiler_variants.items()): #build with all commands 
        print(f"building with: {comp_cmd}")
        for mem in memory_levels[:5]: #skip sweep for this experiment
            args = [f"./{exe_name}", comp_name, str(types[0]), str(alignments[0]), str(tails[1]), str(access_patterns[0]), mem]
            print("Running:", " ".join(args))
            subprocess.run(comp_cmd, check=True)
            try:
                subprocess.run(args, check=True)
                csv_name = "_".join(args[1:]) + ".csv"
                expected_files.append(csv_name)
                if os.path.exists(csv_name):
                    print(f"CSV file produced: {csv_name}")
                else:
                    print(f"CSV file not found: {csv_name}")
            except subprocess.CalledProcessError as e:
                print("Error running:", e)
    check_csv_files(expected_files)


    
if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python tester.py [exp1|exp2|exp3|exp4|exp5|roofline]")
        sys.exit(1)
    exp_map = {
        "exp1": exp1,
        "exp2": exp2,
        "exp3": exp3,
        "exp4": exp4,
        "exp5": exp5,
        "roofline": roofline,
    }
    exp_name = sys.argv[1].lower()
    if exp_name in exp_map:
        exp_map[exp_name]()
    else:
        print(f"Unknown experiment: {exp_name}")
        print("Valid options: exp1, exp2, exp3, exp4, exp5, roofline")
