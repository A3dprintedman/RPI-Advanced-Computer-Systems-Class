import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Read the CSV data
df = pd.read_csv('sweep_table.csv')

# Separate sequential and random data
seq_data = df[df['jobname'].str.contains('seq')].copy()
rand_data = df[df['jobname'].str.contains('rand')].copy()

# Define the transition point (64 KiB)
transition_bs = 65536

def plot_workload(data, workload_type):
    """Create dual-axis plot for a given workload type"""
    fig, ax1 = plt.subplots(figsize=(10, 6))
    
    # Color scheme
    color_throughput = '#2E86AB'  # Blue
    color_latency = '#A23B72'     # Purple
    color_transition = '#F18F01'  # Orange
    
    # Primary y-axis: IOPS/Bandwidth
    ax1.set_xlabel('Block Size', fontsize=12, fontweight='bold')
    ax1.set_ylabel('IOPS / Bandwidth (MB/s)', fontsize=12, fontweight='bold', color=color_throughput)
    
    # Plot IOPS for small block sizes and MB/s for large block sizes
    small_bs = data[data['bs_bytes'] <= transition_bs]
    large_bs = data[data['bs_bytes'] >= transition_bs]
    
    # Plot IOPS (left side of transition)
    if not small_bs.empty:
        ax1.plot(small_bs['bs'], small_bs['iops'], 'o-', 
                color=color_throughput, linewidth=2, markersize=8,
                label='IOPS', zorder=3)
    
    # Plot MB/s (right side of transition)
    if not large_bs.empty:
        ax1.plot(large_bs['bs'], large_bs['bw_MBps'], 's-', 
                color=color_throughput, linewidth=2, markersize=8,
                label='Bandwidth (MB/s)', zorder=3)
    
    ax1.tick_params(axis='y', labelcolor=color_throughput)
    ax1.grid(True, alpha=0.3, linestyle='--')
    
    # Add vertical line at transition point
    transition_idx = data[data['bs_bytes'] == transition_bs].index
    if not transition_idx.empty:
        transition_x = data.loc[transition_idx[0], 'bs']
        ax1.axvline(x=transition_x, color=color_transition, linestyle='--', 
                   linewidth=2, alpha=0.7, label='IOPS→MB/s transition (64 KiB)')
    
    # Secondary y-axis: Latency
    ax2 = ax1.twinx()
    ax2.set_ylabel('Average Latency (µs)', fontsize=12, fontweight='bold', color=color_latency)
    ax2.plot(data['bs'], data['lat_avg_us'], 'D-', 
            color=color_latency, linewidth=2, markersize=7,
            label='Avg Latency', alpha=0.8, zorder=2)
    ax2.tick_params(axis='y', labelcolor=color_latency)
    
    # Title and layout
    plt.title(f'{workload_type.capitalize()} Access: Block Size Sweep', 
             fontsize=14, fontweight='bold', pad=20)
    
    # Combine legends
    lines1, labels1 = ax1.get_legend_handles_labels()
    lines2, labels2 = ax2.get_legend_handles_labels()
    ax1.legend(lines1 + lines2, labels1 + labels2, 
              loc='upper left', fontsize=10, framealpha=0.9)
    
    # Rotate x-axis labels for readability
    plt.xticks(rotation=45, ha='right')
    
    # Adjust layout to prevent label cutoff
    plt.tight_layout()
    
    # Save figure
    plt.savefig(f'{workload_type}_block_size_sweep.png', dpi=300, bbox_inches='tight')
    print(f"Saved {workload_type}_block_size_sweep.png")
    
    plt.show()

# Create plots for both workload types
plot_workload(seq_data, 'sequential')
plot_workload(rand_data, 'random')