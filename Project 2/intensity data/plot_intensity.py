import re
import matplotlib.pyplot as plt
import glob
import numpy as np
from collections import defaultdict

def extract_latency_data(filename):
    """Extract latency vs bandwidth data from loaded latency files."""
    data = []
    with open(filename, 'r') as f:
        in_data_section = False
        for line in f:
            if '==========================' in line:
                in_data_section = True
                continue
            if in_data_section and line.strip():
                parts = line.split()
                if len(parts) == 3:
                    try:
                        inject_delay = int(parts[0])
                        latency = float(parts[1])
                        bandwidth = float(parts[2])
                        data.append((inject_delay, latency, bandwidth))
                    except ValueError:
                        continue
    return data

def parse_filename(filename):
    """Parse filename to extract parameters."""
    # For bandwidth files: results_rw=<ratio>_run=<num>.txt
    match_bw = re.search(r'rw=(\w+)_run=(\d+)', filename)
    if match_bw:
        rw_ratio = match_bw.group(1)
        run_num = match_bw.group(2)
        return 'bandwidth', f"{rw_ratio} | run_{run_num}", None
    
    # For latency files: results_intensity=<num>_run=<num>.txt
    match_lat = re.search(r'intensity=(\d+)_run=(\d+)', filename)
    if match_lat:
        intensity = int(match_lat.group(1))
        run_num = int(match_lat.group(2))
        return 'latency', intensity, run_num
    
    return None, filename, None

def plot_latency_bandwidth(file_pattern='results_intensity=*_run=*.txt'):
    """Read latency files, average by intensity, and plot with error bars."""
    files = glob.glob(file_pattern)
    
    if not files:
        print(f"No files found matching pattern: {file_pattern}")
        return
    
    # Group data by intensity level
    intensity_data = defaultdict(list)
    
    for filename in files:
        file_type, intensity, run_num = parse_filename(filename)
        if file_type == 'latency':
            data = extract_latency_data(filename)
            if data:
                intensity_data[intensity].append(data)
                print(f"Processed: {filename} -> intensity={intensity}, run={run_num}, {len(data)} points")
    
    if not intensity_data:
        print("No latency data found in files")
        return
    
    # Create the plot
    fig, ax = plt.subplots(figsize=(12, 8))
    
    colors = plt.cm.viridis(np.linspace(0, 0.9, len(intensity_data)))
    
    for idx, (intensity, runs) in enumerate(sorted(intensity_data.items())):
        # Organize data by inject delay across all runs
        delay_data = defaultdict(lambda: {'latencies': [], 'bandwidths': []})
        
        for run in runs:
            for inject_delay, latency, bandwidth in run:
                delay_data[inject_delay]['latencies'].append(latency)
                delay_data[inject_delay]['bandwidths'].append(bandwidth)
        
        # Calculate averages and min/max
        delays = sorted(delay_data.keys())
        avg_latencies = []
        avg_bandwidths = []
        lat_errors = []
        bw_errors = []
        
        for delay in delays:
            lats = delay_data[delay]['latencies']
            bws = delay_data[delay]['bandwidths']
            
            avg_lat = np.mean(lats)
            avg_bw = np.mean(bws)
            
            avg_latencies.append(avg_lat)
            avg_bandwidths.append(avg_bw)
            
            # Error bars: [lower_error, upper_error]
            lat_errors.append([avg_lat - min(lats), max(lats) - avg_lat])
            bw_errors.append([avg_bw - min(bws), max(bws) - avg_bw])
        
        # Convert error arrays to proper shape for matplotlib
        lat_errors = np.array(lat_errors).T
        bw_errors = np.array(bw_errors).T

        # Plot with error bars - SWAPPED: latency on X, bandwidth on Y
        ax.errorbar(avg_latencies, avg_bandwidths, 
                    xerr=lat_errors, yerr=bw_errors,
                    marker='o', linewidth=2, markersize=6,
                    label=f'Intensity {intensity}',
                    color=colors[idx], capsize=3, capthick=1.5, alpha=0.8)
    
    ax.set_xlabel('Latency (ns)', fontsize=12)
    ax.set_ylabel('Bandwidth (MB/sec)', fontsize=12)
    ax.set_title('Memory Bandwidth vs Latency (Averaged with Min/Max Range)', 
                 fontsize=14, fontweight='bold')
    ax.legend(loc='best', fontsize=10)
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig("intensity_plot.png")
    #plt.show()

if __name__ == '__main__':
    # Plot latency vs bandwidth
    print("\n" + "=" * 60)
    print("Plotting Bandwidth vs Latency...")
    print("=" * 60)
    plot_latency_bandwidth('results_intensity=*_run=*.txt')