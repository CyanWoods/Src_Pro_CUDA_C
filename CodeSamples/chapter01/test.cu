#include "../common/common.h"
#include <stdio.h>

 __global__ void incr(int *ptr)
 {
   int tmp=*ptr;
   tmp=tmp+1;
   *ptr=tmp;
   printf("%d",*ptr);
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
    incr<<<1, 1>>>(p);
    CHECK(cudaDeviceReset());
    return 0;
 }
 
