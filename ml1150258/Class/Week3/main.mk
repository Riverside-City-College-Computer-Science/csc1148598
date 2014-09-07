# Makefile
all: main
 
main: main.o
	ld -o $@ $+
 
main.o : main.s
	as -o $@ $<

clean:
	rm -vf *.o