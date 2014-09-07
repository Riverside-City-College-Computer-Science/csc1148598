# Makefile
all: sum01
 
sum01: sum01.o
	gcc -o $@ $+
 
sum01.o : sum01.s
	as -o $@ $<

clean:
	rm -vf *.o