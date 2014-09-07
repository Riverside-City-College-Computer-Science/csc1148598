# Makefile
all: sum02
 
sum02: sum02.o
	gcc -o $@ $+
 
sum02.o : sum02.s
	as -o $@ $<

clean:
	rm -vf *.o