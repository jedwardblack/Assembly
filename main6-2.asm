		.ORIG	x3000
		LEA	R0, A		; R0 contains base address of A
		LD	R1, N 		; R1 contains the size of array A
		ADD	R6, R6, #-1	; move top of run-time stack
		STR	R1, R6, #0	; push value of N onto run-time stack
		ADD	R6, R6, #-1 	
		STR	R0, R6, #0	; push address of A onto run-time stack
		LD	R2, maxAddr	; load address of function max
		JSRR	R2		; call your max function
		LDR	R3, R6, #0	; get return value from RTS and put it in R3
		HALT
maxAddr		.FILL	x3200
A		.BLKW	10   ; I use 10 here, but it may be different at run-time 
N		.BLKW 1
		.END