#include <stdio.h>
#include "xcuda.cuh"

// __global__ functions, or "kernels", execute on the device
__global__ void helloKernel(int* a)
{
	printf("Hello, world from the device %d!\n", *a);
	atomicAdd(a, 1);
	printf("Hello, world from the device %d!\n", *a);
}

int callKernel(void)
{
  // greet from the host
  printf("Hello, world from the host!\n");

  int a = 10;
  int* d_a;
  const auto cudaStatus = cudaMalloc((void**)&d_a, sizeof(int));

  if (cudaStatus != cudaSuccess) {
	  printf("Err!\n");
	  return -1;
  }

  cudaMemcpy(d_a, &a, sizeof(int), cudaMemcpyHostToDevice);

  // launch a kernel with a single thread to greet from the device
  helloKernel<<<1,1>>>(d_a);


  cudaMemcpy(&a, d_a, sizeof(int), cudaMemcpyDeviceToHost);
  printf("Res: %d\n", a);

  // wait for the device to finish so that we see the message
  cudaDeviceSynchronize();

  return 0;
}
 