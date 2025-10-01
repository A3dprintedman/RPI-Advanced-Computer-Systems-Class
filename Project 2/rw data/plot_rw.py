import re
import matplotlib.pyplot as plt
import glob
from collections import defaultdict

def extract_bandwidth(filename):
    """Extract bandwidth value from the file."""
    with open(filename, 'r') as f:
        for line in f:
            # Look for the bandwidth value (last number in the matrix)
            if line.strip() and line.strip()[0].isdigit():
                # Split the line and get the last number
                parts = line.split()
                if len(parts) >= 2:
                    try:
                        bandwidth = float(parts[-1])
                        return bandwidth
                    except ValueError:
                        continue
    return None

def parse_filename(filename):
    """Parse filename to extract rw_ratio and run_num.
    Expected format: results_rw=<ratio>_run=<num>.txt
    """
    match = re.search(r'rw=(\w+)_run=(\d+)', filename)
    if match:
        rw_ratio = match.group(1)
        run_num = match.group(2)
        return rw_ratio, run_num
    return None, None

def plot_bandwidths(file_pattern='results_rw=*_run=*.txt'):
    """Read bandwidth files and create a plot."""
    files = sorted(glob.glob(file_pattern))
    
    if not files:
        print(f"No files found matching pattern: {file_pattern}")
        return
    
    # Group files by rw_ratio
    ratio_data = defaultdict(list)
    
    for filename in files:
        bw = extract_bandwidth(filename)
        rw_ratio, run_num = parse_filename(filename)
        
        if bw is not None and rw_ratio is not None:
            ratio_data[rw_ratio].append({
                'bandwidth': bw,
                'run_num': run_num,
                'filename': filename
            })
            print(f"Processed: {filename} -> {bw} MB/sec")
    
    if not ratio_data:
        print("No bandwidth data found in files")
        return
    
    # Assign colors to each ratio
    unique_ratios = sorted(ratio_data.keys())
    colors = plt.cm.tab10(range(len(unique_ratios)))
    ratio_colors = dict(zip(unique_ratios, colors))
    
    # Prepare data for plotting
    bandwidths = []
    bar_colors = []
    legends = []
    
    for ratio in sorted(ratio_data.keys()):
        for item in sorted(ratio_data[ratio], key=lambda x: x['run_num']):
            bandwidths.append(item['bandwidth'])
            bar_colors.append(ratio_colors[ratio])
            legends.append(f"{ratio} | run_{item['run_num']}")
    
    # Create the plot
    plt.figure(figsize=(12, 6))
    x_positions = range(len(bandwidths))
    
    plt.bar(x_positions, bandwidths, color=bar_colors, alpha=0.7)
    plt.xlabel('Configuration', fontsize=12)
    plt.ylabel('Memory Bandwidth (MB/sec)', fontsize=12)
    plt.title('Memory Bandwidth Comparison', fontsize=14, fontweight='bold')
    plt.xticks(x_positions, legends, rotation=45, ha='right')
    plt.grid(axis='y', alpha=0.3)
    plt.tight_layout()
    
    # Add value labels on top of bars
    for i, bw in enumerate(bandwidths):
        plt.text(i, bw, f'{bw:.1f}', ha='center', va='bottom', fontsize=9)
    
    # Create legend for ratios
    from matplotlib.patches import Patch
    legend_elements = [Patch(facecolor=ratio_colors[ratio], alpha=0.7, label=ratio) 
                      for ratio in sorted(ratio_colors.keys())]
    plt.legend(handles=legend_elements, title='Read/Write Ratio', 
              loc='upper right', fontsize=10)
    
    #plt.show()
    plt.savefig("rw_plot.png")

if __name__ == '__main__':
    # You can specify a different file pattern if needed
    plot_bandwidths('results_rw=*_run=*.txt')