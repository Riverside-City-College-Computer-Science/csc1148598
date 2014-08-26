# Makefile
all: prog3a
 
prog3a: prog3a.o
	gcc -o $@ $+
 
prog3a.o : prog3a.s
	as -o $@ $<
 
clean:
	rm -vf prog3a *.o
	./prog3a ; echo $?