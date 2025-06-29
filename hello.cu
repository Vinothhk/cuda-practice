#include <stdio.h>

__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}

// The __global__ specifier indicates a function that runs on device (GPU). 
// Such function can be called through host code, e.g. the main() function in the example, and is also known as "kernels".

int main() {
    cuda_hello<<<1,1>>>(); 
    cudaDeviceSynchronize(); // Wait for GPU to finish
    return 0;
}