@ http://raspberrypiassembly.wordpress.com/page/2/
@ helloworld.s - "Hello World in the world of ARM!" program

.data                @ store string and length in 2 variables
msg:
    .ascii  "Hello World in the world of ARM!\n"
    len = . - msg

.section	.text
.globl   _start
_start:
    mov r0, $1
    ldr r1, =msg       @ pointer string to be printed in r1
    ldr r2, =len       @ length of string in r2
    mov r7, $4         @ prepare to output to console
    svc $0             @ wake kernel
	
