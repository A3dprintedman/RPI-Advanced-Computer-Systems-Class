// avx2_fma_gflops.c
// Compile: gcc -O3 -march=native -mfma avx2_fma_gflops.c -o avx2_fma_gflops
// Run: sudo ./avx2_fma_gflops 100000000  (iterations)  (pin thread to core as described below)

#include <immintrin.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <pthread.h>
#include <sched.h>
#include <stdlib.h>
#include <windows.h>

static inline void pin_to_core(int core) {
    DWORD_PTR mask = (DWORD_PTR)1 << core;
    HANDLE thread = GetCurrentThread();
    if (SetThreadAffinityMask(thread, mask) == 0) {
        fprintf(stderr, "Failed to set thread affinity\n");
    }
}

double now_seconds() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("usage: %s <iterations> [core]\n", argv[0]);
        return 1;
    }
    long iterations = atol(argv[1]);
    int core = (argc >= 3) ? atoi(argv[2]) : 0;
    pin_to_core(core);

    // We'll keep multiple vector registers live to hide latency.
    __m256 a = _mm256_set1_ps(1.0f);
    __m256 b = _mm256_set1_ps(1.0001f);
    __m256 c = _mm256_set1_ps(0.9999f);
    __m256 d = _mm256_set1_ps(0.5f);

    // Each _mm256_fmadd_ps does 8 elements * 2 flops = 16 flops.
    // We'll do 4 fmadds per loop iteration (adjust if you want).
    const int fmas_per_iter = 4;
    double t0 = now_seconds();
    for (long i = 0; i < iterations; ++i) {
        a = _mm256_fmadd_ps(b, c, a); // 16 flops
        b = _mm256_fmadd_ps(c, d, b); // 16 flops
        c = _mm256_fmadd_ps(d, a, c); // 16 flops
        d = _mm256_fmadd_ps(a, b, d); // 16 flops
    }
    double t1 = now_seconds();

    // Prevent optimizer from removing code
    float out[8];
    _mm256_storeu_ps(out, a);
    volatile float sink = out[0];

    double secs = t1 - t0;
    long long total_flops = (long long)iterations * fmas_per_iter * 16; // 16 flops per 256-bit FMA
    double gflops = (double)total_flops / secs / 1e9;

    printf("iters=%ld time=%.6f s GFLOPS=%.2f (core=%d)\n", iterations, secs, gflops, core);
    if (sink == 0.0f) printf(""); // keep sink used
    return 0;
}
