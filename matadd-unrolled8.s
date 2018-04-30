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
            @ save registers overwritten and 
            @ initialize registers being used
            push {r4-r10}
            ldr r4, [sp, #28] @ r4 = width
            mov r5, #0        @ r5 = 0, i for height loop
            mov r6, #0        @ r6 = 0, j for width loop
                              @ r7 will hold temp A matrix value
                              @ r8 will hold temp B matrix value
                              @ r9 will hold height offset
                              @ r10 will hold width offset

hloop:
            cmp r5, r3        @ if i < height
            beq hend          @ branch to end if loop is done

wloop:
            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j

            cmp r6, r4        @ if j < width
            beq wend          @ branch to end if loop is done

            mov r10, #4
            mul r9, r5, r10    @ r9 = height offset
            mul r10, r6, r10   @ r10 = width offset

            add r7, r1, r9    @ r7 = A + i
            ldr r7, [r7]      @ r7 = A[i]
            add r7, r7, r10   @ r7 = A[i] + j
            ldr r7, [r7]      @ r7 = A[i][j]

            add r8, r2, r9    @ r8 = B + i
            ldr r8, [r8]      @ r8 = B[i]
            add r8, r8, r10   @ r8 = B[i] + j
            ldr r8, [r8]      @ r8 = B[i][j]

            add r7, r7, r8    @ r7 = A[i][j] + B[i][j]
            add r8, r0, r9    @ r8 = C + i
            ldr r8, [r8]      @ r8 = C[i]
            add r8, r8, r10   @ r8 = C[i] + j
            str r7, [r8]      @ C[i][j] (r8) = A[i][j] + B[i][j] (r7)

            add r6, r6, #1    @ increment j
            b wloop           @ branch to beginning of loop

wend:
            add r5, r5, #1    @ increment i
            b hloop           @ branch to beginning of loop

hend:
            pop {r4-r10}      @ restore used registers
            mov pc, lr
