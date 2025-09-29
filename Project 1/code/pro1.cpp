#include <cstddef>
#include <cstdint>
#include <vector>
#include <iostream>
#include <string>
#include <random>
#include <cstdio>
#include <chrono>
#include <fstream>
#include <sstream>
// OS-specific includes for setting CPU affinity
#if defined(_WIN32) || defined(_WIN64)
#include <windows.h>
#else
#endif

// ---------------- Alignment & Tail control ----------------
bool g_aligned = true;
bool g_tail = false;

// ---------------- Stride / Access Pattern ----------------
enum class AccessPattern { UnitStride, Strided, Gather };
AccessPattern g_access_pattern = AccessPattern::UnitStride;
int g_stride = 1; // Used for strided access

// Metadata globals for CSV
std::string g_type, g_memory_level;
std::string g_cmdline;

// CSV file handle
std::ofstream g_csv;

// Helper for gather-like index pattern
std::vector<size_t> make_gather_indices(size_t N, int stride) {
    std::vector<size_t> idx(N);
    for (size_t i = 0; i < N; i++) {
        idx[i] = (i * stride) % N;
    }
    return idx;
}

template <typename T>
T* maybe_misalign(std::vector<T>& v) {
    if (g_aligned) {
        return v.data();
    } else {
        return v.data() + 1; // deliberate misalignment
    }
}

template <typename T>
inline void do_not_optimize(T const& value) {
    asm volatile("" : : "r,m"(value) : "memory");
}

// ---------------- Timer with CSV export ----------------
template <typename F>
void time_function(F f, const std::string& kernel, double flops_per_elem, size_t N, int runs = 10) {
    printf("Timing kernel %s over %d runs...\n", kernel.c_str(), runs);
    using namespace std::chrono;
    for (int run = 0; run < runs; run++) {
        auto start = high_resolution_clock::now();
        f();
        auto end = high_resolution_clock::now();
        double elapsed = duration<double>(end - start).count();

        // might need to change this
        // if eplased is 0, set gflops to 0 to avoid inf
        if (elapsed == 0) elapsed = 0.1; // prevent division by zero
        double gflops = (flops_per_elem * N) / elapsed / 1e9;

        // Export row to CSV
        g_csv << kernel << ","
              << run << ","
              << elapsed << ","
              << gflops << ","
              << N << ","
              << g_type << ","
              << g_aligned << ","
              << g_tail << ","
              << (g_access_pattern == AccessPattern::UnitStride ? "unit-stride" :
                  g_access_pattern == AccessPattern::Strided ? "strided" : "gather") << ","
              << g_stride << ","
              << g_memory_level << "\n";
              //<< "\"" << g_cmdline << "\"" << "\n";
              //"," << "\"" << g_compiler_args << "\"" << "\n";
              
    }
}

// -------------------- Scalar Kernels --------------------
template <typename T>
void saxpy_scalar(T* y, const T* x, T a, std::size_t N,
                  AccessPattern pattern, int stride,
                  const std::vector<size_t>* gather_idx) {
    //printf("Running SAXPY with pattern %d and stride %d\n", static_cast<int>(pattern), stride);
    if (pattern == AccessPattern::UnitStride) {
        for (std::size_t i = 0; i < N; i++) y[i] = a * x[i] + y[i];
    } else if (pattern == AccessPattern::Strided) {
        for (std::size_t i = 0; i * stride < N; i++)
            y[i * stride] = a * x[i * stride] + y[i * stride];
    } else if (pattern == AccessPattern::Gather && gather_idx) {
        for (std::size_t i = 0; i < N; i++) {
            size_t idx = (*gather_idx)[i];
            y[idx] = a * x[idx] + y[idx];
        }
    }
    do_not_optimize(y);
}

template <typename T>
void dot_scalar(const T* x, const T* y, std::size_t N,
             AccessPattern pattern, int stride,
             const std::vector<size_t>* gather_idx) {
    T sum = 0;
    if (pattern == AccessPattern::UnitStride) {
        for (std::size_t i = 0; i < N; i++) sum += x[i] * y[i];
    } else if (pattern == AccessPattern::Strided) {
        for (std::size_t i = 0; i * stride < N; i++)
            sum += x[i * stride] * y[i * stride];
    } else if (pattern == AccessPattern::Gather && gather_idx) {
        for (std::size_t i = 0; i < N; i++) {
            size_t idx = (*gather_idx)[i];
            sum += x[idx] * y[idx];
        }
    }
    do_not_optimize(sum);
}

template <typename T>
void mul_scalar(T* z, const T* x, const T* y, std::size_t N,
                AccessPattern pattern, int stride,
                const std::vector<size_t>* gather_idx) {
    if (pattern == AccessPattern::UnitStride) {
        for (std::size_t i = 0; i < N; i++) z[i] = x[i] * y[i];
    } else if (pattern == AccessPattern::Strided) {
        for (std::size_t i = 0; i * stride < N; i++)
            z[i * stride] = x[i * stride] * y[i * stride];
    } else if (pattern == AccessPattern::Gather && gather_idx) {
        for (std::size_t i = 0; i < N; i++) {
            size_t idx = (*gather_idx)[i];
            z[idx] = x[idx] * y[idx];
        }
    }
    do_not_optimize(z);
}

template <typename T>
void stencil_scalar(T* y, const T* x, T a, T b, T c, std::size_t N,
                    AccessPattern pattern, int stride,
                    const std::vector<size_t>* gather_idx) {
    if (pattern == AccessPattern::UnitStride) {
        for (std::size_t i = 1; i + 1 < N; i++)
            y[i] = a * x[i - 1] + b * x[i] + c * x[i + 1];
    } else if (pattern == AccessPattern::Strided) {
        for (std::size_t i = 1; i + 1 < N; i++) {
            size_t idx = i * stride;
            if (idx > 0 && idx + 1 < N)
                y[idx] = a * x[idx - 1] + b * x[idx] + c * x[idx + 1];
        }
    } else if (pattern == AccessPattern::Gather && gather_idx) {
        for (std::size_t i = 1; i + 1 < N; i++) {
            size_t idx = (*gather_idx)[i];
            if (idx > 0 && idx + 1 < N)
                y[idx] = a * x[idx - 1] + b * x[idx] + c * x[idx + 1];
        }
    }
    do_not_optimize(y);
}

// -------------------- Working-set size helper --------------------
// Helper: get total working-set size for a kernel (sum of all arrays accessed)
template <typename T>
size_t get_working_set_size(size_t N, int num_arrays) {
    return N * sizeof(T) * num_arrays;
}

// Updated choose_N: returns N so that all arrays together fit in the cache level
// Example cache sizes (adjust for your system):
constexpr size_t L1_SMALL = 32 * 1024;   // 32 KB per core (L1 Data)
constexpr size_t L1_LARGE = 192 * 1024; // 6 x 32 KB = 192 KB total L1 Data
constexpr size_t L2_SIZE = 512 * 1024;  // 512 KB per core (L2)
constexpr size_t L3_SIZE = 8 * 1024 * 1024; // 8 MB shared (L3)
constexpr size_t DRAM_SIZE = 1ULL << 30; // 1 GB (arbitrary large)

template <typename T>
size_t choose_N(const std::string& memory_level, int num_arrays) {
    size_t cache_bytes = 0;
    if (memory_level == "l1small") cache_bytes = L1_SMALL;
    else if (memory_level == "l1large") cache_bytes = L1_LARGE;
    else if (memory_level == "l2") cache_bytes = L2_SIZE;
    else if (memory_level == "l3") cache_bytes = L3_SIZE;
    else if (memory_level == "dram") cache_bytes = DRAM_SIZE;
    else cache_bytes = 8 * sizeof(T) * num_arrays; // default tiny
    return cache_bytes / (sizeof(T) * num_arrays);
}

// Simple sweep across cache levels
std::vector<size_t> get_sweep_N() {
    // Example sweep points for float32/int32 and float64
    // Adjust as needed for your cache sizes
    return {
        1 * 1024,      // 1K
        4 * 1024,      // 4K
        16 * 1024,     // 16K
        32 * 1024,     // 32K (L1)
        192 * 1024,    // 192K (L1 total)
        512 * 1024,    // 512K (L2)
        2 * 1024 * 1024, // 2M (L3)
        8 * 1024 * 1024, // 8M (L3 total)
        32 * 1024 * 1024 // 32M (DRAM)
    };
}

// -------------------- Driver --------------------
template <typename T>
void run_demo(const std::string& label) {
    int runs = 10;
    std::vector<size_t> N_sweep;
    if (g_memory_level == "sweep") {
        N_sweep = get_sweep_N();
    } else {
        N_sweep = { choose_N<T>(g_memory_level, 2) };
    }
    for (size_t N : N_sweep) {
        N = g_tail ? N + 3 : N;
        printf("Array size N = %zu\n", N);
        std::vector<T> x(N), y(N), z(N);
        T* xp = maybe_misalign(x);
        T* yp = maybe_misalign(y);
        T* zp = maybe_misalign(z);
        std::mt19937 gen(42);
        std::uniform_real_distribution<float> dist(0.0f, 1.0f);
        for (size_t i = 0; i < N; i++) {
            xp[i] = dist(gen);
            yp[i] = dist(gen);
            zp[i] = dist(gen);
        }
        std::vector<size_t> gather_idx;
        if (g_access_pattern == AccessPattern::Gather) {
            gather_idx = make_gather_indices(N, g_stride);
        }
        const std::vector<size_t>* gather_ptr = (g_access_pattern == AccessPattern::Gather) ? &gather_idx : nullptr;
        // SAXPY
        time_function([&]() { saxpy_scalar(yp, xp, (T)3, N, g_access_pattern, g_stride, gather_ptr); },
                      "SAXPY", 2.0, N, runs);
        // Dot
        time_function([&]() { dot_scalar(xp, yp, N, g_access_pattern, g_stride, gather_ptr); },
                      "DOT", 2.0, N, runs);
        // Multiply
        time_function([&]() { mul_scalar(zp, xp, yp, N, g_access_pattern, g_stride, gather_ptr); },
                      "MUL", 1.0, N, runs);
        // Stencil
        time_function([&]() { stencil_scalar(yp, xp, (T)1, (T)2, (T)3, N, g_access_pattern, g_stride, gather_ptr); },
                      "STENCIL", 5.0, N, runs);
    }
}

int main(int argc, char** argv) {
    // Build command-line string
    std::ostringstream oss;
    for (int i = 0; i < argc; i++) {
        oss << argv[i];
        if (i + 1 < argc) oss << " ";
    }
    g_cmdline = oss.str();

    // Parse arguments
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "-help" || arg == "--help") {
            printf("  f32, f64, or i32 data types (required)\n");
            printf("  --aligned / --misaligned: memory alignment\n");
            printf("  --tail / --no-tail: add or remove tail elements\n");
            printf("  --unit-stride: contiguous access (default)\n");
            printf("  --stride=N: strided access, N=2,4,8,...\n");
            printf("  --gather=N: gather-like access pattern, stride N\n");
            printf("  l1 / l2 / l3 / dram / sweep target working-set size for cache or memory hierarchy\n");
            return 0;
        }else if (arg == "f32" || arg == "f64" || arg == "i32") {
            g_type = arg;
        } else if (arg == "--aligned") {
            g_aligned = true;
        } else if (arg == "--misaligned") {
            g_aligned = false;
        } else if (arg == "--tail") {
            g_tail = true;
        } else if (arg == "--no-tail") {
            g_tail = false;
        } else if (arg == "--unit-stride") {
            g_access_pattern = AccessPattern::UnitStride;
            g_stride = 1;
        } else if (arg.rfind("--stride=", 0) == 0) {
            g_access_pattern = AccessPattern::Strided;
            g_stride = std::stoi(arg.substr(9));
        } else if (arg.rfind("--gather=", 0) == 0) {
            g_access_pattern = AccessPattern::Gather;
            g_stride = std::stoi(arg.substr(9));
        } else if (arg == "l1small" || arg == "l1large" || arg == "l2" || arg == "l3" || arg == "dram" || arg == "sweep") {
            g_memory_level = arg;
        }
    }

    // Open CSV and write header
    // Prepend compiler variant (argv[1]) to filename, then join rest of args
    std::string csv_name;
    if (argc > 1) {
        csv_name = argv[1];
        for (int i = 2; i < argc; ++i) {
            csv_name += "_";
            csv_name += argv[i];
        }
    } else {
        csv_name = "results";
    }
    // Replace spaces with underscores for filename
    for (size_t i = 0; i < csv_name.size(); ++i) {
        if (csv_name[i] == ' ') csv_name[i] = '_';
    }
    csv_name += ".csv";
    g_csv.open(csv_name);
    g_csv << "kernel,run,elapsed_sec,gflops,array_size,type,aligned,tail,access,stride,memory_level\n";

    // Pin process to a single core (core 0) to ensure single-core execution for benchmarks
#if defined(_WIN32) || defined(_WIN64)
    {
        HANDLE h = GetCurrentProcess();
        DWORD_PTR mask = 1; // CPU 0
        if (!SetProcessAffinityMask(h, mask)) {
            fprintf(stderr, "Warning: failed to set process affinity on Windows\n");
        }
    }
#else
#endif

    if (g_type == "f32") {
        run_demo<float>("float32");
    } else if (g_type == "f64") {
        run_demo<double>("float64");
    } else if (g_type == "i32") {
        run_demo<int32_t>("int32");
    }

    g_csv.close();
    return 0;
}
