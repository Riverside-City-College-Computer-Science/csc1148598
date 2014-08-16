@ helloworld.s - "Hello ARM!" program

.data                @ store string and length in 2 variables
msg:
    .ascii  "Hello ARM!\n"
    len = . - msg

.globl   _start
_start:
    mov r0, $1
    ldr r1, =msg       @ pointer string to be printed in r1
    ldr r2, =len       @ length of string in r2
    mov r7, $4         @ prepare to output to console
    svc $0             @ wake kernel

    mov r0, $0         @ set the return value to 0
    mov r7, $1         @ prepare to exit
    svc $0             @ wake kernel
	