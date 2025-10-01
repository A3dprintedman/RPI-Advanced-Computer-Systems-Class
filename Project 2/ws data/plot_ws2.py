import os
import glob
import re
import matplotlib.pyplot as plt
import numpy as np

# Convert strings like "32K", "1M", "8M" to bytes
def size_to_bytes(size_str):
    size_str = size_str.upper()
    if size_str.endswith('K'):
        return int(size_str[:-1]) * 1024
    elif size_str.endswith('M'):
        return int(size_str[:-1]) * 1024 * 1024
    elif size_str.endswith('G'):
        return int(size_str[:-1]) * 1024 * 1024 * 1024
    else:  # assume plain number in bytes
        return int(size_str)

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

def plot_latency_by_size():
    files = glob.glob("results_ws_latency=*_*run=.txt")

    if not files:
        print("No matching files found.")
        return

    size_latency_data = []

    for filename in files:
        match = re.search(r'ws_latency=([\w]+)_run=', filename)
        if not match:
            print(f"Skipping unrecognized filename: {filename}")
            continue
        
        size_str = match.group(1)
        size_bytes = size_to_bytes(size_str)
        
        latency = extract_latency_from_idle(filename)
        
        if latency is None:
            print(f"No latency found in file: {filename}")
            continue
        
        size_latency_data.append((size_bytes, latency))
        print(f"Parsed {filename}: size={size_bytes} bytes, latency={latency} ns")

    if not size_latency_data:
        print("No valid data to plot.")
        return

    size_latency_data.sort(key=lambda x: x[0])
    sizes = [x[0] for x in size_latency_data]
    latencies = [x[1] for x in size_latency_data]

    plt.figure(figsize=(10, 6))
    plt.loglog(sizes, latencies, marker='o', linewidth=2)

    l1 = 32 * 1024          # 32K
    l2 = 512 * 1024         # 512K
    l3 = 8 * 1024 * 1024    # 8M

    for boundary, label in [(l1, 'L1 (~32K)'), (l2, 'L2 (~512K)'), (l3, 'L3 (~8M)')]:
        y_min, y_max = plt.ylim()
        y_center = (y_min + y_max) / 2
        plt.axvline(x=boundary, linestyle='--', linewidth=1)
        plt.text(boundary, y_center, label, rotation=90,
                 verticalalignment='center', fontsize=9)

    plt.xlabel("Memory Size (bytes)")
    plt.ylabel("Latency (ns)")
    plt.title("Latency vs Memory Size")
    plt.grid(True, which="both", linestyle='--', linewidth=0.5)
    plt.tight_layout()
    plt.savefig("ws_plot2.png", dpi=150)
    plt.show()

if __name__ == "__main__":
    plot_latency_by_size()
