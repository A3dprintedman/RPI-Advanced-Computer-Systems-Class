import matplotlib.pyplot as plt
import re
from collections import defaultdict
import numpy as np

# Read and parse the data
data = defaultdict(lambda: defaultdict(list))

with open('cache_miss_data.txt', 'r', encoding='utf-16') as f:
    for line in f:
        line = line.strip()  # Remove leading/trailing whitespace
        if 'Size:' in line:
            # Parse the line
            match = re.search(r'Size:\s*(\d+)B,\s*Stride:\s*(\d+),\s*Random:\s*(Yes|No),\s*Times:\s*(.+)', line)
            if match:
                size = int(match.group(1))
                stride = int(match.group(2))
                is_random = match.group(3) == 'Yes'
                times_str = match.group(4)
                
                # Parse ops/s values - look for number before "ops/s", excluding "inf"
                ops_values = re.findall(r'([0-9.]+) ops/s', times_str)
                # Filter out 'inf' values and convert to float
                valid_ops = [float(ops) for ops in ops_values if ops != 'inf' and float(ops) != 0]
                
                if valid_ops:  # Only include if we have valid measurements
                    avg_ops = np.mean(valid_ops)
                    access_type = 'Random' if is_random else 'Sequential'
                    key = f"{size}B | {access_type}"
                    data[key][stride].append(avg_ops)

# Average multiple measurements for the same size/stride/access combination
processed_data = {}
for key in data:
    processed_data[key] = {}
    for stride, ops_list in data[key].items():
        processed_data[key][stride] = np.mean(ops_list)

# Create the plot
plt.figure(figsize=(12, 8))

# Sort keys by size for better legend ordering
def get_size(key):
    return int(key.split('B')[0])

sorted_keys = sorted(processed_data.keys(), key=get_size)

# Plot each size/access pattern combination
for key in sorted_keys:
    strides = sorted(processed_data[key].keys())
    ops = [processed_data[key][s] for s in strides]
    
    # Use different markers for random vs sequential
    if 'Random' in key:
        marker = 'o'
        linestyle = '--'
    else:
        marker = 's'
        linestyle = '-'
    
    plt.loglog(strides, ops, marker=marker, linestyle=linestyle, 
               label=key, linewidth=2, markersize=6)

plt.xlabel('Stride (bytes)', fontsize=12)
plt.ylabel('Performance (ops/sec)', fontsize=12)
plt.title('Cache Performance: Operations per Second vs Stride', fontsize=14)
plt.grid(True, which="both", ls="-", alpha=0.3)
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', fontsize=9)
plt.tight_layout()

# Save the plot
plt.savefig('cache_miss.png', dpi=300, bbox_inches='tight')
plt.show()

print(f"Plotted {len(processed_data)} different configurations")
print(f"Size/Access combinations: {sorted_keys}")