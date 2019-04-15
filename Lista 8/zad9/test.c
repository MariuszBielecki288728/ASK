#include <stdio.h>
#include <stdlib.h>

#define ADD(a, b, result) ({ \
    asm volatile (\
    "movq   %2, %0\n\t"\
    "addq   %1, %0\n\t"\
    "jno 0f\n\t"\
	  "mov %3, %0\n\t"\
    "cmovcq %4, %0\n\t"\
    "0:\n\t"\
    :"=&r" (result)\
    :"r" (a), "r" (b), "r" (0x7FFFFFFFFFFFFFFF), "r" (0x8000000000000000)\
    :"cc"); })

int main(int argc, char *argv[]) {
  
  if (argc == 3) {
    long a = atol(argv[1]);
    long b = atol(argv[2]);
    volatile long result;
    ADD(a,b, result);
    
    printf("result: %ld (hex: 0x%lx) \n", result, result);
  }
 

  return 0;
}
