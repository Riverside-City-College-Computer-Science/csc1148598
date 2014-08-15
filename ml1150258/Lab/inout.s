@ Referenc = http://raspberrypiassembly.wordpress.com/
@ inout.s - a little asm greeter.
@ A program to show how to obtain input
@ as well as output

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@              Allocate Memory
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.section	.bss
.comm buffer, 48	     @ reserve 48 byte buffer

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@              Create some constants
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.section	.data
msg:
	.ascii	"** Greeter **\nPlease enter your name: "
    msgLen = . - msg
msg2:
	.ascii	"Hello "
    msg2Len = . - msg2
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@              Program
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.section	.text
.globl	_start
_start:

mov r0, $1		    @ print program's opening message	
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

mov r0, $1		    @ read syscall	
ldr r1, =buffer
mov r2, $0x30
mov r7, $3
svc $0

mov r0, $1		    @ print msg2
ldr r1, =msg2
ldr r2, =msg2Len
mov r7, $4
svc $0

mov r0, $1		    @ now print the user input
ldr r1, =buffer
mov r2, $0x30
mov r7, $4
svc $0

mov r7, $1	            @ exit syscall
svc $0		            @ wake kernel
.end
