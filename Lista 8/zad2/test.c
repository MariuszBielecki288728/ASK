#include <stdio.h>
#include <stdlib.h>
typedef struct {
  unsigned long lcm, gcd;
} result_t;

extern result_t lcm_gcd(unsigned long, unsigned long);

int main(int argc, char *argv[]) {
  if (argc == 3) {
    result_t result = lcm_gcd(strtoul(argv[1], NULL, 10), strtoul(argv[2], NULL, 10));
    printf("\nresult: %lu, %lu\n",result.lcm, result.gcd);
  }

  return 0;
}
