#include <stdio.h>

// __global__ functions, or "kernels", execute on the device
__global__ void helloKernel(void)
{
  printf("Hello, world from the device!\n");
}

int callKernel(void)
{
  // greet from the host
  printf("Hello, world from the host!\n");

  // launch a kernel with a single thread to greet from the device
  helloKernel<<<1,1>>>();

  // wait for the device to finish so that we see the message
  cudaDeviceSynchronize();

  return 0;
}
 