all: test.o zad.o
	gcc -g -o zad8 test.o zad.o -Wall -Wextra -no-pie

test.o: test.c
	gcc -g -Og -c test.c -Wall -Wextra -no-pie

zad.o: zad.s
	gcc -g -c zad.s -Wall -Wextra -no-pie

clean:
	rm -f test.o zad.o zad8
