@ http://raspberrypiassembly.wordpress.com/page/2/
@ euclid.s
@ GCD algorithm (example taken from Knuth TAOCP, p.9)

@ r1 holds the first value
@ r0 holds the second 

.section	.data
vals:
    .long 6099, 2166
.section	.text
.globl  _start

_start:
    ldr r2, =vals		@ make r1 point to start of vals
    ldr r1, [r2]		@ load first number into r2.
    ldr r0, [r2, #4]	@ load second number into r0.

gcd:
    cmp r0, r1			@ compare r0 and r1
    subgt r0, r0, r1	@ if r0 > r1, r0 = r0 - r1
    sublt r1, r1, r0	@ if r0 < r1, r1 = r1 - r0
    bne gcd 			@ if r0 != r1, repeat

    mov     r7, $1		@ prepare to exit
    swi     0			@ wake kernel

.end