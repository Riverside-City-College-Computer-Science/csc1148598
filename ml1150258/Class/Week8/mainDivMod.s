/* To Compile
	gcc mainDivMod.s -o div
	./div
*/
.data
 
message1: .asciz "Type 2 numbers a and b for a/b and a%b: "
format:   .asciz "%d %d"
message2: .asciz "The inputs are a = %d is b = %d\n"
message3: .asciz "The outputs are a div b = %d and a mod b = %d\n"
 
.text

/*void scaleRight(int &r1,int &r3,int &r2) */
scaleRight:
	push {lr}             /* Push lr onto the stack */
	doWhile_r1_lt_r2:     /* Shift right until just under the remainder */
		mov r3,r3,ASR #1; /* Division counter */
		mov r2,r2,ASR #1  /* Mod/Remainder subtraction */
	cmp r1,r2
	blt doWhile_r1_lt_r2
	pop {lr}              /* Pop lr from the stack */
    bx lr                 /* Leave scaleRight */
/* end scaleRight */

/* void addSub(int &r3,int &r2,int &r0,int &r1) */
addSub:
	push {lr}       /* Push lr onto the stack */
	doWhile_r3_ge_1:
		add r0,r0,r3
		sub r1,r1,r2
		bl scaleRight
	cmp r3,#1
	bge doWhile_r3_ge_1
    pop {lr}       /* Pop lr from the stack */
    bx lr          /* Leave addSub */
/* end addSub */

/* void scaleLeft(int &r1,int &r3,int &r2) */
scaleLeft:
	push {lr}             /* Push lr onto the stack */
	doWhile_r1_ge_r2:     /* Scale left till overshoot with remainder */
		mov r3,r3,LSL #1  /* scale factor */
		mov r2,r2,LSL #1  /* subtraction factor */
		cmp r1,r2
	bge doWhile_r1_ge_r2  /* End loop at overshoot */
	mov r3,r3,ASR #1      /* Scale factor back */
	mov r2,r2,ASR #1      /* Scale subtraction factor back */
	pop {lr}              /* Pop lr from the stack */
    bx lr                 /* Leave addSub */
/* end scaleLeft */

/* void divMod(int &r2,int &r0,int &r1) */
divMod:
	push {lr}       /* Push lr onto the stack */
	/* Determine the quotient and remainder */
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
		bl scaleLeft
		bl addSub
	end:
	pop {lr}       /* Pop lr from the stack */
    bx lr          /* Leave addSub */
/* end divMod */
	
.globl main
main:
    str lr, [sp,#-4]!            /* Push lr onto the top of the stack */
    sub sp, sp, #8               /* Make room for two 4 byte integers in the stack */
	
    ldr r0, address_of_message1  /* Set &message1 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, address_of_format    /* Set format as the first parameter of scanf */
    mov r2, sp                   /* Set variable of the stack as b */
	add r1, r2, #4               /* and second value as a of scanf */
    bl scanf                     /* Call scanf */
 
	add r1, sp, #4               /* Place sp+4 -> r1 */
    ldr r1, [r1]                 /* Load the integer a read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer b read by scanf into r2 */
    ldr r0, address_of_message2  /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
	add r1, sp, #4               /* Place sp+4 -> r1 */
    ldr r1, [r1]                 /* Load the integer a read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer b read by scanf into r2 */
	bl divMod
	mov r2,r1					 /* divMod returns r0,r1 -> need r1,r2 for printf */
	mov r1,r0
    ldr r0, address_of_message3  /* Set &message3 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    add sp, sp, #8               /* Discard the integer read by scanf */
    ldr lr, [sp], #+4            /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_format:   .word format
