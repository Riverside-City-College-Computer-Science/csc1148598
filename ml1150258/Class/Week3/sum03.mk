# Makefile
all: sum03
 
sum03: sum03.o
	gcc -o $@ $+
 
sum03.o : sum03.s
	as -o $@ $<

clean:
	rm -vf *.o