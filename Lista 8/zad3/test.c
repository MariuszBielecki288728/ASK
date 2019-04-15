#include <stdio.h>
#include <stdlib.h>

extern void insert_sort(long *, long *);

int main(int argc, char *argv[]) {
  long tab[argc - 1];
  for (int i = 1; i < argc; i++) {
    tab[i - 1] = strtol(argv[i], NULL, 10);
  }
  insert_sort(tab, tab + argc - 2);
  printf("\n");
  for (int i = 0; i < argc - 1; i++) {
    printf("%ld ", tab[i]);
  }
  printf("\n");

  return 0;
}
