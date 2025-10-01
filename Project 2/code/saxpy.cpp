#include "memory_utils.h"
#include <chrono>
#include <vector>
#include <random>
#include <windows.h>
#include <tuple>
#include <functional>
#include <cstdio>

// Set process affinity to core 0 and highest priority
void set_high_priority_affinity() {
    HANDLE process = GetCurrentProcess();
    HANDLE thread = GetCurrentThread();
    
    SetPriorityClass(process, HIGH_PRIORITY_CLASS);
    SetThreadPriority(thread, THREAD_PRIORITY_HIGHEST);
    
    DWORD_PTR affinityMask = 1;
    SetThreadAffinityMask(thread, affinityMask);
    SetThreadIdealProcessor(thread, 0);
    
    PROCESS_POWER_THROTTLING_STATE powerThrottling = {};
    powerThrottling.Version = PROCESS_POWER_THROTTLING_CURRENT_VERSION;
    powerThrottling.ControlMask = PROCESS_POWER_THROTTLING_EXECUTION_SPEED;
    powerThrottling.StateMask = PROCESS_POWER_THROTTLING_EXECUTION_SPEED;
    
    SetProcessInformation(process, ProcessPowerThrottling, 
                         &powerThrottling, sizeof(powerThrottling));
}

bool EnableLockMemoryPrivilege() {
    HANDLE hToken = NULL;
    TOKEN_PRIVILEGES tp = { 0 };
    LUID luid = { 0 };

    if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken)) {
        printf("OpenProcessToken failed. Error: %lu\n", GetLastError());
        return false;
    }

    if (!LookupPrivilegeValue(NULL, SE_LOCK_MEMORY_NAME, &luid)) {
        printf("LookupPrivilegeValue failed. Error: %lu\n", GetLastError());
        CloseHandle(hToken);
        return false;
    }

    tp.PrivilegeCount = 1;
    tp.Privileges[0].Luid = luid;
    tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;

    if (!AdjustTokenPrivileges(hToken, FALSE, &tp, sizeof(TOKEN_PRIVILEGES), NULL, NULL)) {
        printf("AdjustTokenPrivileges failed. Error: %lu\n", GetLastError());
        CloseHandle(hToken);
        return false;
    }

    DWORD lastError = GetLastError();
    if (lastError == ERROR_NOT_ALL_ASSIGNED) {
        printf("The token does not have the Lock Memory privilege assigned.\n");
        printf("Run as administrator and ensure the privilege is assigned to your user account.\n");
        CloseHandle(hToken);
        return false;
    }

    CloseHandle(hToken);
    return true;
}

// Lightweight kernel: SAXPY
void saxpy(int n, float a, float* x, float* y) {
    for (int i = 0; i < n; ++i) {
        y[i] = a * x[i] + y[i];
    }
}

template<typename TestFunc, typename... Args>
std::vector<double> run_test_multiple_times(int num_runs, TestFunc&& test_func, Args&&... args) {
    std::vector<double> times;
    
    for (int run = 0; run < num_runs; ++run) {
        test_func(std::forward<Args>(args)...);
        flush_cache();
        
        auto start = std::chrono::high_resolution_clock::now();
        test_func(std::forward<Args>(args)...);
        auto end = std::chrono::high_resolution_clock::now();
        
        times.push_back(std::chrono::duration<double, std::nano>(end - start).count());
    }
    
    return times;
}

void test_cache_miss_impact(size_t working_set_size, int stride, bool random_access) {
    const int n = working_set_size / sizeof(float);
    float a = 2.0f;
    
    float* x = (float*)aligned_alloc(CACHE_LINE_SIZE, working_set_size);
    float* y = (float*)aligned_alloc(CACHE_LINE_SIZE, working_set_size);
    
    for (int i = 0; i < n; ++i) {
        x[i] = static_cast<float>(i);
        y[i] = static_cast<float>(n - i);
    }
    
    std::vector<int> indices;
    if (random_access) {
        indices.resize(n);
        for (int i = 0; i < n; ++i) indices[i] = i;
        std::shuffle(indices.begin(), indices.end(), std::default_random_engine(42));
    }
    
    auto test_lambda = [&]() {
        if (random_access) {
            for (int i = 0; i < n; i += stride) {
                int idx = indices[i];
                y[idx] = a * x[idx] + y[idx];
            }
        } else {
            for (int i = 0; i < n; i += stride) {
                y[i] = a * x[i] + y[i];
            }
        }
    };
    
    std::vector<double> times_ns = run_test_multiple_times(3, test_lambda);
    double operations = n / static_cast<double>(stride);
    
    printf("Size: %zuB, Stride: %d, Random: %s, Times: ",
           working_set_size, stride, random_access ? "Yes" : "No");
    for (size_t i = 0; i < times_ns.size(); ++i) {
        double performance = operations / (times_ns[i] / 1e9);
        printf("%.0fns(%.2f ops/s)", times_ns[i], performance);
        if (i < times_ns.size() - 1) printf(", ");
    }
    printf("\n");
    
    aligned_free(x);
    aligned_free(y);
}

void test_tlb_impact(size_t working_set_size, bool use_huge_pages) {
    const int n = working_set_size / sizeof(float);
    float a = 2.0f;

    if (use_huge_pages) {
        SIZE_T min_huge_page = GetLargePageMinimum();
        if (min_huge_page == 0) {
            printf("Huge pages not supported. Skipping test.\n");
            return;
        }
    }
    
    SIZE_T huge_page_size = GetLargePageMinimum();
    size_t alloc_size = working_set_size;
    if (use_huge_pages && (working_set_size % huge_page_size != 0)) {
        alloc_size = ((working_set_size + huge_page_size - 1) / huge_page_size) * huge_page_size;
    }
    
    DWORD allocation_type = use_huge_pages ? MEM_LARGE_PAGES : 0;
    float* x = (float*)VirtualAlloc(NULL, alloc_size, MEM_COMMIT | MEM_RESERVE | allocation_type, PAGE_READWRITE);
    float* y = (float*)VirtualAlloc(NULL, alloc_size, MEM_COMMIT | MEM_RESERVE | allocation_type, PAGE_READWRITE);
    
    if (x == NULL || y == NULL) {
        DWORD error = GetLastError();
        printf("Failed to allocate memory (size=%zu, huge=%s). Error=%lu\n",
               working_set_size, use_huge_pages ? "Yes" : "No", error);
        if (use_huge_pages && error == ERROR_NO_SYSTEM_RESOURCES) {
            printf("Likely missing 'Lock Pages in Memory' privilege.\n");
        }
        if (x) VirtualFree(x, 0, MEM_RELEASE);
        if (y) VirtualFree(y, 0, MEM_RELEASE);
        return;
    }
    
    for (int i = 0; i < n; ++i) {
        x[i] = static_cast<float>(i);
        y[i] = static_cast<float>(n - i);
    }
    
    auto test_lambda = [&]() {
        flush_cache();
        saxpy(n, a, x, y);
    };
    
    std::vector<double> times_ns = run_test_multiple_times(3, test_lambda);
    
    printf("Size: %zuB, HugePages: %s, Times: ",
           working_set_size, use_huge_pages ? "Yes" : "No");
    for (size_t i = 0; i < times_ns.size(); ++i) {
        double performance = n / (times_ns[i] / 1e9);
        printf("%.0fns(%.2f ops/s)", times_ns[i], performance);
        if (i < times_ns.size() - 1) printf(", ");
    }
    printf("\n");
    
    VirtualFree(x, 0, MEM_RELEASE);
    VirtualFree(y, 0, MEM_RELEASE);
}

int main() {
    set_high_priority_affinity();

    printf("=== Attempting to enable Lock Memory Privilege ===\n");
    
    if (EnableLockMemoryPrivilege()) {
        printf("Lock Memory privilege enabled successfully!\n");
    } else {
        printf("Warning: Failed to enable Lock Memory privilege. Huge page allocs may fail.\n");
    }
    
    std::vector<std::tuple<size_t, int, bool>> cache_tests;
    size_t sizes[] = {1024, 4096, 16384, 65536, 262144, 1048576, 4194304, 16777216};
    int strides[] = {1, 2, 4, 8, 16, 32, 64};
    
    for (size_t size : sizes) {
        for (int stride : strides) {
            cache_tests.emplace_back(size, stride, false);
            cache_tests.emplace_back(size, stride, true);
        }
    }

    std::random_device rd;
    std::mt19937 g(rd());
    std::shuffle(cache_tests.begin(), cache_tests.end(), g);
    
    printf("\n=== Cache Miss Impact Tests ===\n");
    for (const auto& test : cache_tests) {
        test_cache_miss_impact(std::get<0>(test), std::get<1>(test), std::get<2>(test));
    }
    
    printf("\n=== TLB Impact Tests ===\n");
    std::vector<std::pair<size_t, bool>> tlb_tests;
    size_t small_tlb_sizes[] = {4096, 8192, 32768, 65536, 262144, 1048576};

    for (size_t size : small_tlb_sizes) {
        tlb_tests.emplace_back(size, false);
    }
    
    SIZE_T min_huge_page = GetLargePageMinimum();
    if (min_huge_page == 0) {
        printf("Huge pages not supported. Skipping huge page tests.\n");
    } else {
        printf("Huge page size: %zu bytes\n", (size_t)min_huge_page);
        
        size_t tlb_sizes[] = {
            min_huge_page, min_huge_page * 2, min_huge_page * 4,
            min_huge_page * 8, min_huge_page * 16, min_huge_page * 32
        };
        
        for (size_t size : tlb_sizes) {
            tlb_tests.emplace_back(size, true);
        }
    }

    std::shuffle(tlb_tests.begin(), tlb_tests.end(), g);
    for (const auto& test : tlb_tests) {
        test_tlb_impact(test.first, test.second);
    }
    
    return 0;
}
