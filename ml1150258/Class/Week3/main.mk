# Makefile
all: main
 
main: main.o
	gcc -o $@ $+
 
main.o : main.s
	as -o $@ $<

clean:
	rm -vf *.o