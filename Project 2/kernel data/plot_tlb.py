import matplotlib.pyplot as plt
import re
from collections import defaultdict
import numpy as np

# Read and parse the data
data = defaultdict(lambda: defaultdict(list))

with open('tlb_data.txt', 'r') as f:
    for line in f:
        line = line.strip()  # Remove leading/trailing whitespace
        if 'Size:' in line:
            # Parse the line
            match = re.search(r'Size:\s*(\d+)B,\s*HugePages:\s*(Yes|No),\s*Times:\s*(.+)', line)
            if match:
                size = int(match.group(1))
                huge_pages = match.group(2) == 'Yes'
                times_str = match.group(3)
                
                # Parse ops/s values - look for number before "ops/s"
                ops_values = re.findall(r'([0-9.]+) ops/s', times_str)
                # Convert to float
                valid_ops = [float(ops) for ops in ops_values if float(ops) > 0]
                
                if valid_ops:  # Only include if we have valid measurements
                    avg_ops = np.mean(valid_ops)
                    page_type = 'Huge Pages' if huge_pages else 'Regular Pages'
                    data[page_type][size] = avg_ops

# Create the plot
plt.figure(figsize=(12, 8))

# Plot each page type
for page_type in sorted(data.keys()):
    sizes = sorted(data[page_type].keys())
    ops = [data[page_type][s] for s in sizes]
    
    # Use different markers for huge pages vs regular pages
    if 'Huge' in page_type:
        marker = 'o'
        linestyle = '-'
        color = 'blue'
    else:
        marker = 's'
        linestyle = '--'
        color = 'red'
    
    plt.loglog(sizes, ops, marker=marker, linestyle=linestyle, 
               label=page_type, linewidth=2, markersize=8, color=color)
l1 = 32 * 1024          # 32K
l2 = 512 * 1024         # 512K
l3 = 8 * 1024 * 1024    # 8M

for boundary, label in [(l1, 'L1 (~32K)'), (l2, 'L2 (~512K)'), (l3, 'L3 (~8M)')]:
	y_min, y_max = plt.ylim()
	y_center = (y_min + y_max) / 2
	plt.axvline(x=boundary, linestyle='--', linewidth=1)
	plt.text(boundary, y_center, label, rotation=90,
			verticalalignment='center', fontsize=9)
        
plt.xlabel('Memory Size (bytes)', fontsize=12)
plt.ylabel('Performance (ops/sec)', fontsize=12)
plt.title('TLB Performance: Operations per Second vs Memory Size', fontsize=14)
plt.grid(True, which="both", ls="-", alpha=0.3)
plt.legend(fontsize=11)
plt.tight_layout()

# Save the plot
plt.savefig('tlb_plot.png', dpi=300, bbox_inches='tight')
plt.show()

print(f"Plotted {len(data)} different page types")
for page_type in data:
    print(f"{page_type}: {len(data[page_type])} data points")