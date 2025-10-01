#!/bin/bash

runs=5
STRIDES=("64" "256" "1024")
PATTERNS=("seq" "rand")
RW=("100R" "100W" "75R25W" "50R50W")
INTENSITIES=(1 2 4)   # threads for loaded-latency sweep

# Map RW pattern to MLC flag
declare -A RW_FLAGS
RW_FLAGS=( ["100R"]="-R" ["100W"]="-W6" ["75R25W"]="-W3" ["50R50W"]="-W5" )

# ------------------------------
# Stride Sweep
# ------------------------------
run_stride() {
    for stride in "${STRIDES[@]}"; do
        for (( i=0; i<runs; i++ )); do
            echo "./mlc --idle_latency -c1 -i1 -l$stride >> results_stride=${stride}_run=${i}.txt"
            ./mlc --idle_latency -c1 -i1 -l$stride >> results_stride=${stride}_run=${i}.txt
            ./mlc --bandwidth_matrix -l$stride >> results_bw_stride=${stride}_run=${i}.txt
        done
        echo "Stride sweep for stride=$stride done."
    done
}

# ------------------------------
# Pattern Sweep
# ------------------------------
run_pattern() {
    for pattern in "${PATTERNS[@]}"; do
        flag=""
        [ "$pattern" = "rand" ] && flag="-r"
        for (( i=0; i<runs; i++ )); do
            echo "./mlc --idle_latency -c1 -i1 $flag >> results_pattern=${pattern}_run=${i}.txt"
            ./mlc --idle_latency -c1 -i1 $flag >> results_pattern=${pattern}_run=${i}.txt
            ./mlc --bandwidth_matrix >> results_bw_pattern=${pattern}_run=${i}.txt
        done
        echo "Pattern sweep for pattern=$pattern done."
    done
}

# ------------------------------
# Read/Write Mix Sweep
# ------------------------------
run_rw() {
    for rw in "${RW[@]}"; do
        mlc_flag=${RW_FLAGS[$rw]}
        for (( i=0; i<runs; i++ )); do
            echo "mlc --bandwidth_matrix $mlc_flag >> results_rw=${rw}_run=${i}.txt"
            ./mlc --bandwidth_matrix $mlc_flag >> results_rw=${rw}_run=${i}.txt
        done
        echo "Read/Write sweep for pattern=$rw done."
    done
}

# ------------------------------
# Access Intensity Sweep
# ------------------------------
run_intensity() {
    for intensity in "${INTENSITIES[@]}"; do
        for (( i=0; i<runs; i++ )); do
            echo "./mlc --loaded_latency -t$intensity -c1 >> results_intensity=${intensity}_run=${i}.txt"
            ./mlc --loaded_latency -t$intensity -c1 >> results_intensity=${intensity}_run=${i}.txt
        done
        echo "Intensity sweep for threads=$intensity done."
    done
}

# ------------------------------
# Working-Set Size Sweep (Latency + Bandwidth)
# ------------------------------
run_ws() {
    WORKING_SETS=("16K" "32K" "64K" "128K" "256K" "512K" \
                  "1M" "2M" "4M" "8M" "16M" "32M")

    for ws in "${WORKING_SETS[@]}"; do
            echo "./mlc --idle_latency -c1 -b $ws >> results_ws_latency=${ws}_run=${i}.txt"
            ./mlc --idle_latency -c1 -b$ws >> results_ws_latency=${ws}_run=${i}.txt
            echo "./mlc --bandwidth_matrix -b $ws >> results_ws_bw=${ws}_run=${i}.txt"
            ./mlc --bandwidth_matrix -b$ws >> results_ws_bw=${ws}_run=${i}.txt
        echo "Working-set sweep for size=$ws done."
    done
}

# ------------------------------
# Main
# ------------------------------
case "$1" in
    stride) run_stride ;;
    pattern) run_pattern ;;
    rw) run_rw ;;
    intensity) run_intensity ;;
    ws) run_ws ;;
    *)
        echo "Usage: $0 {stride|pattern|rw|intensity|ws}"
        exit 1
        ;;
esac