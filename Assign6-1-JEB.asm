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
	ADD  R6, R6, #-1 ; R6 <- location for local variable aVal
	ADD  R5, R6, #0  ; R5 is frame pointer for AtoD's local variables
	LDR  R0, R5, #8  ; place value of parameter in register R0 (acting as local variable)
	
	AND R1, R1, #0
	ADD R1, R1, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-16
	ADD R0, R0, R1   ; subtract 48 from R0
	STR R0, R5, #7   ; writes return value (in R0) to return value location
	
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
	RET			       ; return to routine that called AtoD
	.END