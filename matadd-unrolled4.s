    /* This function has 5 parameters, and the declaration in the
       C-language would look like:

       void matadd (int **C, int **A, int **B, int height, int width)

       C, A, B, and height will be passed in r0-r3, respectively, and
       width will be passed on the stack.

       You need to write a function that computes the sum C = A + B.

       A, B, and C are arrays of arrays (matrices), so for all elements,
       C[i][j] = A[i][j] + B[i][j]

       You should start with two for-loops that iterate over the height and
       width of the matrices, load each element from A and B, compute the
       sum, then store the result to the correct element of C. 

       This function will be called multiple times by the driver, 
       so don't modify matrices A or B in your implementation.

       As usual, your function must obey correct ARM register usage
       and calling conventions. */

	.arch armv7-a
	.text
	.align	2
	.global	matadd
	.syntax unified
	.arm
matadd:
push  {r0-r8, lr}
/* r0 C base address
  r1 A base address
  r2 B base address
  r3 i-max index
  r4 j-max index
  r5 j-count
  r6 i-offset
  r7 j-offset
  r8 multiplicand */
ldr   r4, [sp, #40]   // Load the width to r4
sub   r3, r3, #1      // subtract 1 from the height 
sub   r4, r4, #1      // subtract 1 from the width
mov   r8, #4          // set the mplicand to 4
mul   r6, r3, r8      // set the i-offset to 4 * i-max idx
loop1:
ldr   r0, [sp]        // load the C address to r0
ldr   r1, [sp, #4]    // load the A address to r1
ldr   r2, [sp, #8]    // load the B address to r2
ldr   r0, [r0, r6]    // load the C[i] address to r0
ldr   r1, [r1, r6]    // load the A[i] address to r1
ldr   r2, [r2, r6]    // load the B[i] address to r2
mov   r5, r4          // move the j-max idx to j-count
loop2:
mul   r7, r5, r8      // set the j-offeset to 4 * j-count
push  {r1-r2}
ldr   r1, [r1, r7]    // load the A[i][j] address to r1
ldr   r2, [r2, r7]    // load the B[i][j] address to r2
add   r1, r1, r2      // place A[i][j] + B[i][j] value in r1
str   r1, [r0, r7]    // store C[i][j] value in address
pop   {r1-r2}
subS  r5, r5, #1      // decrement the j-offset
blt end2

mul   r7, r5, r8      // set the j-offeset to 4 * j-count
push  {r1-r2}
ldr   r1, [r1, r7]    // load the A[i][j] address to r1
ldr   r2, [r2, r7]    // load the B[i][j] address to r2
add   r1, r1, r2      // place A[i][j] + B[i][j] value in r1
str   r1, [r0, r7]    // store C[i][j] value in address
pop   {r1-r2}
subS  r5, r5, #1      // decrement the j-offset
blt end2

mul   r7, r5, r8      // set the j-offeset to 4 * j-count
push  {r1-r2}
ldr   r1, [r1, r7]    // load the A[i][j] address to r1
ldr   r2, [r2, r7]    // load the B[i][j] address to r2
add   r1, r1, r2      // place A[i][j] + B[i][j] value in r1
str   r1, [r0, r7]    // store C[i][j] value in address
pop   {r1-r2}
subS  r5, r5, #1      // decrement the j-offset
blt end2

mul   r7, r5, r8      // set the j-offeset to 4 * j-count
push  {r1-r2}
ldr   r1, [r1, r7]    // load the A[i][j] address to r1
ldr   r2, [r2, r7]    // load the B[i][j] address to r2
add   r1, r1, r2      // place A[i][j] + B[i][j] value in r1
str   r1, [r0, r7]    // store C[i][j] value in address
pop   {r1-r2}
subS  r5, r5, #1      // decrement the j-offset
bpl   loop2           // continue loop if >= 0
/* End of loop2 */
end2:
subS  r6, r6, r8      // decrement the i-offset
bpl   loop1           // continue loop if >= 0
/* End of loop1 */

pop   {r0-r8, pc}     // restore registers and return
