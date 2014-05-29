		.ORIG	x3000
		LD	R3, ENDCH	; value of input terminator in R3
		NOT	R3, R3		; negate terminator for comparisons
LOOP		LEA	R0, PROMPT
		PUTS			; show prompt on console		
		IN				; input value goes in R0
		AND	R1, R0, R3	; R1 is 0 if R0 = terminator
		BRz	ENDLOOP
		ADD	R6, R6, #-1	; move top of run-time stack
		STR	R0, R6, #0	; push input value onto RTS
		LD	R2, AtoDAddr
		JSRR	R2
		LDR	R0, R6, #0	; get return value from RTS
		BRnzp	LOOP	; get another value
ENDLOOP		LEA	R0, STOP
		PUTS
		HALT
AtoDAddr	.FILL	x3200
ENDCH		.FILL	#35	; ASCII value of #
PROMPT		.STRINGZ "Enter a digit, or # to quit "
STOP		.STRINGZ "Program Completes!!"
		.END
		