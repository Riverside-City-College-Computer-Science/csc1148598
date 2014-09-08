# Makefile
all: store
 
store: store.o
	gcc -o $@ $+
 
store.o : store.s
	as -o $@ $<

clean:
	rm -vf *.o