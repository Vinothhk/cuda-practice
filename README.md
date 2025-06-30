## Intro
for general purpose computing. CUDA provides C/C++ language extension and APIs for programming and managing GPUs.

In CUDA programming, both CPUs and GPUs are used for computing. Typically, we refer to CPU and GPU system as host and device, respectively. CPUs and GPUs are separated platforms with their own memory space. Typically, we run serial workload on CPU and offload parallel computation to GPUs.

The __global__ specifier indicates a function that runs on device (GPU). Such function can be called through host code, e.g. the main() function in the example, and is also known as "kernels".


## Real, User and Sys process time statistics

One of these things is not like the other. Real refers to actual elapsed time; User and Sys refer to CPU time used only by the process.

- Real is wall clock time - time from start to finish of the call. This is all elapsed time including time slices used by other processes and time the process spends blocked (for example if it is waiting for I/O to complete).

- User is the amount of CPU time spent in user-mode code (outside the kernel) within the process. This is only actual CPU time used in executing the process. Other processes and time the process spends blocked do not count towards this figure.

- Sys is the amount of CPU time spent in the kernel within the process. This means executing CPU time spent in system calls within the kernel, as opposed to library code, which is still running in user-space. Like 'user', this is only CPU time used by the process. See below for a brief description of kernel mode (also known as 'supervisor' mode) and the system call mechanism.

- User+Sys will tell you how much actual CPU time your process used. Note that this is across all CPUs, so if the process has multiple threads (and this process is running on a computer with more than one processor) it could potentially exceed the wall clock time reported by Real (which usually occurs). Note that in the output these figures include the User and Sys time of all child processes (and their descendants) as well when they could have been collected, e.g. by wait(2) or waitpid(2), although the underlying system calls return the statistics for the process and its children separately.

## Going parallel
CUDA use a kernel execution configuration <<<...>>> to tell CUDA runtime how many threads to launch on GPU. CUDA organizes threads into a group called "thread block". Kernel can launch multiple thread blocks, organized into a "grid" structure.

The syntax of kernel execution configuration is as follows

## Tip
```
time ./vector_add
```
Using time does not give much information about the program performance. NVIDIA provides a commandline profiler tool called nvprof, which give a more insight information of CUDA program performance.

## Thread Information
CUDA provides built-in variables for accessing thread information. In this exercise, we will use two of them: threadIdx.x and blockDim.x.

threadIdx.x contains the index of the thread within the block
blockDim.x contains the size of thread block (number of threads in the thread block).