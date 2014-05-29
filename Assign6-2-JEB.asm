	; CSCI250 Assignment 6-1
	; Joseph Black
		.ORIG x3200
	ADD  R6, R6, #-1 ; R6 <- location of return value for main
	ADD  R6, R6, #-1 ; R6 <- location of return address of main
	STR  R7, R6, #0	 ; store return address, which is in R7
	ADD  R6, R6, #-1 ; R6 <- location for main's frame pointer
	STR  R5, R6, #0  ; store frame pointer, which is in R5
	ADD  R6, R6, #-1 ; R6 <- location for saving R3's value
	STR  R3, R6, #0  ; save R3's value
	ADD  R6, R6, #-1 ; R6 <- location for saving R2's value
	STR  R2, R6, #0  ; save R2's value
	ADD  R6, R6, #-1 ; R6 <- location for saving R1's value
	STR  R1, R6, #0  ; save R1's value
	ADD  R6, R6, #-1 ; R6 <- location for saving R0's value
	STR  R0, R6, #0  ; save R0's value
	ADD  R6, R6, #-1 ; R6 <- location for local variable A
	ADD  R5, R6, #0  ; R5 is frame pointer for subroutine's local variables
	LDR  R0, R5, #8  ; place value of parameter A (starting address) in register R0
	STR  R0, R6, #0
	ADD  R6, R6, #-1
	LDR  R1, R5, #9  ; place value of parameter N (size of array) in register R1
	STR  R1, R6, #0
	
	AND R3, R3, #0	 ; Clear R3.
	AND R2, R2, #0   ; R2 (MAX) set to 0.
LOOP	NOT R1, R1
	ADD R1, R1, #1   ; Stores in R1 the negative of the size of the array
	ADD R4, R1, R3   ; checks to see if i < size.array
	BRzp FOUNDMAX    ; branches out of loop if i >= size.array
	ADD R4, R0, R3   ; adds i to the address of A[0]
	LDR R4, R4, #0   ; loads value at address of A[i]
	NOT R4, R4	     
	ADD R4, R4, #1   ; 2's comp of A[i]
	ADD R3, R3, #1   ; Add 1 to R3.
	ADD R4, R4, R2   ;
	BRzp LOOP		 ; branches to LOOP if A[i] !> MAX
	ADD R4, R4, #-1
	NOT R2, R4       ; Stores A[i] in R2
	BRnzp LOOP	     ; Runs LOOP again
	
FOUNDMAX	STR R2, R5, #7   ; writes return value (in R0) to return value location
	
	ADD  R6, R5, #1    ; R6 <- location where R0 is saved
	LDR  R0, R6, #0    ; restore R0
	ADD  R6, R6, #1
	LDR  R1, R6, #0    ; restore R1
	ADD  R6, R6, #1
	LDR  R2, R6, #0    ; restore R2
	ADD  R6, R6, #1
	LDR  R3, R6, #0    ; restore R3
	ADD  R6, R6, #1
	LDR  R5, R6, #0    ; restore value of previous frame pointer
	ADD  R6, R6, #1
	LDR  R7, R6, #0    ; R7 has return value to routines that called AtoD
	ADD  R6, R6, #1    ; R6 now references location of return value
	RET		       	   ; return to routine that called AtoD
	.END			   