.data
 
message1: .asciz "Type a number: "
format:   .asciz "%d"
message2: .asciz "The factorial of %d is %d\n"
 
.text
 
.globl main
main:
    str lr, [sp,#-4]!            /* Push lr onto the top of the stack */
    sub sp, sp, #4               /* Make room for one 4 byte integer in the stack */
                                 /* In these 4 bytes we will keep the number */
                                 /* entered by the user */
                                 /* Note that after that the stack is 8-byte aligned */
    ldr r0, address_of_message1  /* Set &message1 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, address_of_format    /* Set &format as the first parameter of scanf */
    mov r1, sp                   /* Set the top of the stack as the second parameter */
                                 /* of scanf */
    bl scanf                     /* Call scanf */
 
    ldr r0, [sp]                 /* Load the integer read by scanf into r0 */
                                 /* So we set it as the first parameter of factorial */
    bl factorial                 /* Call factorial */
 
    mov r2, r0                   /* Get the result of factorial and move it to r2 */
                                 /* So we set it as the third parameter of printf */
    ldr r1, [sp]                 /* Load the integer read by scanf into r1 */
                                 /* So we set it as the second parameter of printf */
    ldr r0, address_of_message2  /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
 
 
    add sp, sp, #+4              /* Discard the integer read by scanf */
    ldr lr, [sp], #+4            /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
address_of_message1: .word message1
address_of_message2: .word message2
address_of_format: .word format
