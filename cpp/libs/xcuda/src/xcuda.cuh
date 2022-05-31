#ifndef XCUDA_H
#define XCUDA_H

#include <cuda_runtime.h>

__device__ int atomicAdd(int* address, int value);

int callKernel(void);

#endif