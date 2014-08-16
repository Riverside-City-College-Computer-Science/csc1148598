@ How to utilize the GPIO to turn a light on
@ http://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok01.html
@ Turn on pin 16 of the GPIO
@ GPIO location -> 0x20200000
@ Every 10 pins -> 4 bytes for a total of 24 bytes
@ Every pin has 3 bits associated with it
@ Then 16 pin, is 17,18,19 bit of the second 4 bytes
.section .init
.globl _start
_start:
	ldr r0,=0x20200000   @ r0 to r12 are 13 General Purpose Registers
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@     Identify the pin to command 
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov r1,#1			 @ put 1 into r1
    lsl r1,#18			 @ shift 1 left 18 bits pin 6 x 3 bits = 18
    str r1,[r0,#4]		 @ store value in r1 to r0 + 4 bytes
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@     Turn off 40 or on with 28 but behaves opposite CMOS
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov r1,#1
    lsl r1,#16
	str r1,[r0,#40]      @ value of 40 turns off, meaning light on
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@     Might be good to put some kind of timer
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	loop$: 
		b loop$			 @ branch till the end of time
