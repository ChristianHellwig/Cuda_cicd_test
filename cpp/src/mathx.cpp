#include "mathx.h"
#include <iostream>

#if defined(INCLUDE_CUDA)
#include "xcuda.cuh"
#endif

int add(int i, int j) {
    return i + j;
}

int addCuda(int i, int j) {
#if defined(INCLUDE_CUDA)
    callKernel();
    return i + j;
#else
    std::cout << "ERROR: CUDA not available. Install library with CUDA enabled." << std::endl;
    return 0;
#endif
}


