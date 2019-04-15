#include <stdio.h>
#include <stdlib.h>

extern int clz(long);

int main(int argc, char *argv[]) {
  if (argc == 2) {
    int result = clz(atol(argv[1]));
    printf("\nresult: %d\n",result);
  }

  return 0;
}
