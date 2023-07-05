#include <cuda.h>

__global__ void vector_add_kernel(float *out, float *a, float *b, int n) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride)
        out[i] = a[i] + b[i];
}

// Wrapper function for the __global__ call
void vector_add(float **out, float **a, float **b, int n) {
    int blockSize = 256;
    int numBlocks = (n + blockSize - 1) / blockSize;

    // Allocate device memory
    cudaMallocManaged(a, sizeof(float) * n);
    cudaMallocManaged(b, sizeof(float) * n);
    cudaMallocManaged(out, sizeof(float) * n);

    for(int i = 0; i < n; i++){
        (*a)[i] = i;
        (*b)[i] = i;
    }

    vector_add_kernel<<<numBlocks, blockSize>>>(*out, *a, *b, n);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();
}

void deallocate(float *a, float *b, float *out){
    // Free device memory
    cudaFree(a);
    cudaFree(b);
    cudaFree(out);
}
