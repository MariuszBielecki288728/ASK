#include <stdio.h>
#include <stdlib.h>

extern double approx_sqrt(double, double);

int main(int argc, char *argv[]) {
  if (argc == 3) {
    double result = approx_sqrt( atof(argv[1]), atof(argv[2]));
    printf("\nresult: %f\n", result);
  }

  return 0;
}
