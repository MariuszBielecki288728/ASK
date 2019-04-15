#include <stdio.h>
#include <stdlib.h>

extern unsigned long fibonacci(unsigned long);

int main(int argc, char *argv[]) {
  if (argc == 2) {
    unsigned long result = fibonacci(strtoul(argv[1], NULL, 10));
    printf("\nresult: %lu\n", result);
  }

  return 0;
}
