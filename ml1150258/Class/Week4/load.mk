# Makefile
all: load
 
load: load.o
	gcc -o $@ $+
 
load.o : load.s
	as -o $@ $<

clean:
	rm -vf *.o