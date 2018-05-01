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
ldr   r4, [sp, #40]
sub   r3, r3, #1
sub   r4, r4, #1
mov   r8, #4
mov   r6, r3
mul   r6, r6, r8
loop1:
ldr   r0, [sp]
ldr   r1, [sp, #4]
ldr   r2, [sp, #8]
ldr   r0, [r0, r6]
ldr   r1, [r1, r6]
ldr   r2, [r2, r6]
mov   r5, r4
loop2:
mov   r7, r5
mul   r7, r7, r8
push  {r1-r2}
ldr   r1, [r1, r7]
ldr   r2, [r2, r7]
add   r1, r1, r2
str   r1, [r0, r7]
pop   {r1-r2}
subS  r5, r5, #1
bpl   loop2
/* End of loop2 */

subS  r6, r6, r8
bpl   loop1
/* End of loop1 */

pop   {r0-r8, pc}
