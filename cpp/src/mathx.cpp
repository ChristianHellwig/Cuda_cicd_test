#include "mathx.h"
#include "xcuda.cuh"

int add(int i, int j) {
    callKernel();
    return i + j;
}


