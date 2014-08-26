# Makefile
all: prog3a
 
prog3a: prog3a.o
	ld -o $@ $+
 
prog3a.o : prog3a.s
	as -o $@ $<

clean:
	rm -vf *.o