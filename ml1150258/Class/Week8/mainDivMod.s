/* To Compile
	gcc -c divmod.s
	gcc -c mainDivMod.s
	gcc divmod.o mainDivMod.o -o DivMod
	./DivMod
*/
.data
 
message1: .asciz "Type 2 numbers a and b for a/b and a%b: "
format:   .asciz "%d %d"
message2: .asciz "The inputs are a=%d is b=%d\n"
 
.text
 
.globl main
main:
    str lr, [sp,#-4]!            /* Push lr onto the top of the stack */
    sub sp, sp, #8               /* Make room for two 4 byte integer in the stack */
                                 /* In these 4 bytes we will keep the a and b for a/b and a%b */
                                 /* entered by the user */
                                 /* Note that after that the stack is 12-byte aligned */
    ldr r0, address_of_message1  /* Set &message1 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, address_of_format    /* Set &format as the first parameter of scanf */
    mov r2, sp                   /* Set variable of the stack as b */
	sub r1, r2, #4               /* and second value as a of scanf */
    bl scanf                     /* Call scanf */
 
    ldr r1, [sp,#-4]             /* Load the integer read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer read by scanf into r2 */
    ldr r0, address_of_message2  /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
 
 
    add sp, sp, #+8              /* Discard the integer read by scanf */
    ldr lr, [sp], #+4            /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
address_of_message1: .word message1
address_of_message2: .word message2
address_of_format: .word format
