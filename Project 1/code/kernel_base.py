import numpy as np
import matplotlib.pyplot as plt

# -------------------------------
# Utility function
# -------------------------------
def relative_error(reference, result, eps=1e-12):
    """Compute relative error between reference and result arrays."""
    return np.linalg.norm(reference - result) / (np.linalg.norm(reference) + eps)

# -------------------------------
# Kernel implementations
# -------------------------------

def saxpy_scalar(a, x, y):
    y_out = y.copy()
    for i in range(len(x)):
        y_out[i] = a * x[i] + y_out[i]
    return y_out

def saxpy_reference(a, x, y):
    return a * x + y

def dot_scalar(x, y):
    s = 0.0
    for i in range(len(x)):
        s += x[i] * y[i]
    return s

def dot_reference(x, y):
    return np.dot(x, y)

def elemwise_mul_scalar(x, y):
    z = np.empty_like(x)
    for i in range(len(x)):
        z[i] = x[i] * y[i]
    return z

def elemwise_mul_reference(x, y):
    return x * y

def stencil3_scalar(a, b, c, x):
    N = len(x)
    y = np.zeros_like(x)
    for i in range(N):
        xm1 = x[i-1] if i > 0 else 0.0
        xp1 = x[i+1] if i < N-1 else 0.0
        y[i] = a*xm1 + b*x[i] + c*xp1
    return y

def stencil3_reference(a, b, c, x):
    y = np.zeros_like(x)
    y[0] = b*x[0] + c*x[1]
    y[-1] = a*x[-2] + b*x[-1]
    y[1:-1] = a*x[:-2] + b*x[1:-1] + c*x[2:]
    return y

# -------------------------------
# Test and plot function
# -------------------------------
def run_kernel_tests(array_size=5000, runs=10, tolerance=1e-12):
    np.random.seed(0)  # reproducible
    # Generate random input arrays
    x = np.random.rand(array_size).astype(np.float64)
    y = np.random.rand(array_size).astype(np.float64)
    z = np.random.rand(array_size).astype(np.float64)  # for elemwise or stencil
    a, b, c = 1.1, 2.2, 3.3

    kernels = [
        ("SAXPY", saxpy_scalar, saxpy_reference, (a, x, y)),
        ("Dot Product", dot_scalar, dot_reference, (x, y)),
        ("Elementwise Multiply", elemwise_mul_scalar, elemwise_mul_reference, (x, y)),
        ("3-Point Stencil", stencil3_scalar, stencil3_reference, (a, b, c, x))
    ]

    # Store relative errors
    kernel_errors = {}

    for name, scalar_fn, ref_fn, args in kernels:
        errors = []
        ref_out = ref_fn(*args)  # compute reference once
        for run in range(runs):
            result = scalar_fn(*args)
            # If scalar result is a scalar (dot), wrap in np.array for uniformity
            if np.isscalar(result):
                result = np.array([result])
                ref_cmp = np.array([ref_out])
            else:
                ref_cmp = ref_out
            err = relative_error(ref_cmp, result)
            errors.append(err)
        kernel_errors[name] = errors
        mean_err = np.mean(errors)
        std_err = np.std(errors)
        print(f"{name}: mean relative error = {mean_err:.3e}, std = {std_err:.3e}")

    # Plotting
    fig, ax = plt.subplots(figsize=(8,6))
    names = list(kernel_errors.keys())
    means = [np.mean(kernel_errors[n]) for n in names]
    stds = [np.std(kernel_errors[n]) for n in names]

    ax.bar(names, means, yerr=stds, capsize=5, color='skyblue')
    ax.set_ylabel("Relative Error")
    ax.set_title(f"Scalar Kernel Validation vs NumPy Reference (array size={array_size})")
    ax.set_yscale('log')  # log scale is useful for small errors
    plt.tight_layout()
    plt.savefig("kernel_error_bars.png")
    print("\nPlot saved as 'kernel_error_bars.png'")

# -------------------------------
# Main
# -------------------------------
if __name__ == "__main__":
    run_kernel_tests(array_size=5000, runs=10, tolerance=1e-12)
