
#include <stdio.h>

cudaMalloc(*temp,sizeof(int)*3);

 __global__ void incr(int *ptr)
 {
   printf("!\n");
   temp[threadIdx.x]=atomicAdd(ptr,1);
   printf("%d\n",temp[threadIdx.x]);
 }

 __global__ void helloFromGPU()
 {
    printf("Hello World from GPU!\n");
 }
 
 int main(int argc, char **argv)
 {
    
    printf("Hello World from CPU!\n");
    int a = 12413;
    int *p;
    p=&a;
    helloFromGPU<<<1, 3>>>();
    incr<<<1, 3>>>(p);
    cudaDeviceReset();
    return 0;
 }
 
