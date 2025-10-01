import json, sys, pathlib
import matplotlib.pyplot as plt

path = pathlib.Path.home() / "Documents" / "ACS Projects" / "Project 3" / "rwmix_4k_rand_qd32.json"
if len(sys.argv) > 1:
    path = pathlib.Path(sys.argv[1])

with open(path) as f:
    data = json.load(f)

# Order the mixes as requested
order = ["R100", "W100", "R70W30", "R50W50"]

rows = []
for job in data["jobs"]:
    name = job["jobname"]
    if name not in order:
        continue
    # Throughput (MiB/s)
    # fio reports 'bw' in KiB/s
    if "read" in job and job["read"]["io_bytes"] > 0:
        rbw_mib = job["read"]["bw"] / 1024.0
        r_iops  = job["read"]["iops"]
        r_latus = (job["read"]["clat_ns"]["mean"] / 1000.0) if job["read"]["clat_ns"]["mean"] > 0 else 0.0
        r_p99us = (job["read"]["clat_ns"]["percentile"]["99.000000"] / 1000.0) if job["read"]["clat_ns"]["percentile"] else 0.0
    else:
        rbw_mib = r_iops = r_latus = r_p99us = 0.0

    if "write" in job and job["write"]["io_bytes"] > 0:
        wbw_mib = job["write"]["bw"] / 1024.0
        w_iops  = job["write"]["iops"]
        w_latus = (job["write"]["clat_ns"]["mean"] / 1000.0) if job["write"]["clat_ns"]["mean"] > 0 else 0.0
        w_p99us = (job["write"]["clat_ns"]["percentile"]["99.000000"] / 1000.0) if job["write"]["clat_ns"]["percentile"] else 0.0
    else:
        wbw_mib = w_iops = w_latus = w_p99us = 0.0

    total_bw_mib = rbw_mib + wbw_mib
    # For latency, show read and write separately; also compute weighted mean by IO count
    total_ios = 0
    if "read" in job: total_ios += job["read"]["total_ios"]
    if "write" in job: total_ios += job["write"]["total_ios"]
    if total_ios > 0:
        r_weight = (job["read"]["total_ios"] if "read" in job else 0)/total_ios
        w_weight = (job["write"]["total_ios"] if "write" in job else 0)/total_ios
        lat_avg_us = r_weight * r_latus + w_weight * w_latus
        lat_p99_us = max(r_p99us, w_p99us)  # conservative
    else:
        lat_avg_us = lat_p99_us = 0.0

    rows.append({
        "name": name, "total_bw_mib": total_bw_mib,
        "r_bw_mib": rbw_mib, "w_bw_mib": wbw_mib,
        "lat_avg_us": lat_avg_us, "lat_p99_us": lat_p99_us,
        "r_lat_us": r_latus, "w_lat_us": w_latus
    })

# Reorder
rows = sorted(rows, key=lambda r: order.index(r["name"]))

labels = [r["name"] for r in rows]
bw = [r["total_bw_mib"] for r in rows]
lat = [r["lat_avg_us"] for r in rows]

# Combined plot: Throughput and Latency on dual axes
fig, ax1 = plt.subplots(figsize=(10, 6))

# Color scheme
color_throughput = '#2E86AB'  # Blue
color_latency = '#A23B72'     # Purple

# Primary y-axis: Throughput
ax1.set_xlabel('Read/Write Mix', fontsize=12, fontweight='bold')
ax1.set_ylabel('Throughput (MiB/s)', fontsize=12, fontweight='bold', color=color_throughput)
line1 = ax1.plot(labels, bw, 'o-', color=color_throughput, linewidth=2, 
                markersize=8, label='Throughput', zorder=3)
ax1.tick_params(axis='y', labelcolor=color_throughput)
ax1.grid(True, alpha=0.3, linestyle='--')

# Secondary y-axis: Latency
ax2 = ax1.twinx()
ax2.set_ylabel('Average Latency (µs)', fontsize=12, fontweight='bold', color=color_latency)
line2 = ax2.plot(labels, lat, 's-', color=color_latency, linewidth=2, 
                markersize=8, label='Avg Latency', alpha=0.8, zorder=2)
ax2.tick_params(axis='y', labelcolor=color_latency)

# Title
plt.title('4 KiB Random Access (QD=32): Throughput and Latency vs Read/Write Mix', 
         fontsize=14, fontweight='bold', pad=20)

# Combine legends
lines = line1 + line2
labels_legend = [l.get_label() for l in lines]
ax1.legend(lines, labels_legend, loc='upper left', fontsize=11, framealpha=0.9)

# Adjust layout
plt.tight_layout()

# Save figure
plt.savefig(path.with_suffix(".combined.png"), dpi=300, bbox_inches='tight')
print(f"Saved combined plot to {path.with_suffix('.combined.png')}")

plt.show()

# Print summary
print("\n=== Read/Write Mix Summary ===")
for r in rows:
    print(f"{r['name']}: {r['total_bw_mib']:.2f} MiB/s, {r['lat_avg_us']:.2f} µs avg latency")