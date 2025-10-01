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
    Supports:
    - results_ws_bw=<size>.txt          (bandwidth)
    - results_ws_latency=<size>.txt     (latency, alternate naming)
    """
    # Bandwidth format
    match_bw = re.search(r'ws_bw=([\w]+)_run=\.txt', filename)
    if match_bw:
        pattern = match_bw.group(1)
        return 'bandwidth', pattern

    # Latency format (your actual filenames!)
    match_stride = re.search(r'ws_latency=([\w]+)_run=\.txt', filename)
    if match_stride:
        pattern = match_stride.group(1)
        return 'latency', pattern
    
	
    return None, None

def plot_stride_comparison(bw_pattern='results_ws_bw=*_run=.txt',
                            lat_pattern='results_ws_latency=*_run=.txt'):
    """Plot bandwidth vs latency for different stride patterns."""
    
    # Read bandwidth files
    bw_files = glob.glob(bw_pattern)
    lat_files = glob.glob(lat_pattern)

    if not bw_files or not lat_files:
        print(f"Missing files. Found {len(bw_files)} bandwidth files and {len(lat_files)} latency files")
        return

    # Group data by pattern
    pattern_data = defaultdict(lambda: {'bandwidths': [], 'latencies': []})
    
    # Process bandwidth files
    for filename in bw_files:
        file_type, pattern = parse_filename(filename)
        if file_type == 'bandwidth' and pattern:
            bw = extract_bandwidth_from_matrix(filename)
            if bw is not None:
                pattern_data[pattern]['bandwidths'].append(bw)
                print(f"Processed BW: {filename} -> pattern={pattern}, bw={bw:.1f} MB/sec")
    
    # Process latency files
    for filename in lat_files:
        file_type, pattern = parse_filename(filename)
        if file_type == 'latency' and pattern:
            lat = extract_latency_from_idle(filename)
            if lat is not None:
                pattern_data[pattern]['latencies'].append(lat)
                print(f"Processed LAT: {filename} -> pattern={pattern}, lat={lat:.1f} ns")
    
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
    colors = {'1M': 'tab:blue', 
              '2M': 'tab:orange', 
              '4M': 'tab:purple', 
              '8M': 'tab:green', 
			  '16K': 'tab:red',
              '16M': 'tab:brown', 
              '32M': 'tab:pink',
              '64K': 'tab:gray',
              '512K': 'tab:olive',
			  '128K': 'tab:cyan',
              '32K': 'black', 
              '256K': 'coral'}
    markers = {'1M': 'o', 
			   '2M': 'o', 
			   '4M': 'o', 
			   '8M': 'o', 
			   '16K': 'o',
			   '16M': 's', 
			   '32M': 'o',
			   '64K': 'o',
			   '512K': 'o',
			   '128K': 'o',
			   '32K': 'o', 
			   '256K': 'o'}
    
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
    ax.set_title('Memory Bandwidth vs Latency: Working Space\n',
                fontsize=14, fontweight='bold')
    ax.legend(loc='best', fontsize=11)
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig("ws_plot.png", dpi=150)
    #plt.show()

if __name__ == '__main__':
    print("=" * 60)
    print("Plotting Stride Patterns...")
    print("=" * 60)
    plot_stride_comparison('results_ws_bw=*.txt',
                           'results_ws_latency=*.txt')