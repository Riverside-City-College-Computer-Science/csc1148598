AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
CLIBS   := -lm

all: armstrong4 armstrong5 armstrong6

#harness: harness.s armstrong4macro.s power.s
#armstrong: armstrong4main.s armstrong.s power.s

armstrong4: armstrong4macro armstrong4string armstrong4divide 
armstrong4macro: armstrong4main.s armstrong4macro.s power.s
armstrong4string: armstrong4string.c
armstrong4divide: armstrong4divide.c

armstrong5: armstrong5macro armstrong5string armstrong5divide
armstrong5macro: armstrong5main.s armstrong5macro.s power.s
armstrong5divide: armstrong5divide.c
armstrong5divide: armstrong5divide.c

armstrong6: armstrong6macro armstrong6string armstrong6divide
armstrong6macro: armstrong6main.s armstrong6macro.s power.s
armstrong6string: armstrong6string.c
armstrong6divide: armstrong6divide.c


%: %.c
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	rm -f armstrong harness armstrong4macro armstrong4string armstrong4divide armstrong5macro armstrong5string armstrong5divide armstrong6macro armstrong6string armstrong6divide
