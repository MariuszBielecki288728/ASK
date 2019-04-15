all: test.o zad.o
	gcc -g -o zad2 test.o zad.o -Wall -Wextra 

test.o: test.c
	gcc  -g -Og -c test.c -Wall -Wextra

zad.o: zad.s
	gcc -g -c zad.s -Wall -Wextra # debug: -g  -v -da -Q 

clean:
	rm -f test.o zad.o zad2
