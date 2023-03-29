ORG 9000H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #7EH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED
	
ORG 9020H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0CH
	  
	  MOVX @DPTR, A
	
	  LJMP LED

ORG 9040H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0B6H
	  
	  MOVX @DPTR, A
	  
	  LJMP LED
	  
ORG 9060H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #9EH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED

ORG 9080H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0CCH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED

ORG 90A0H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0DAH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED

ORG 90C0H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0FAH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED
	  
ORG 90E0H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0EH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED
	  
ORG 9100H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0FEH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED
	  
ORG 9120H
	  MOV DPH, #0E8H
	  MOV DPL, #00H
	  MOV A, #0DEH
	  
	  MOVX @DPTR, A
	  
	  LJMP LED
	  
ORG 8100H
	  SETB IE.7
	  SETB IE.1

	  MOV TMOD,#01H		
	  MOV TH0, #4CH
	  MOV TL0, #04H
	  SETB TR0
	  
	  MOV DPH, #0E8H
	  MOV DPL, #03H
	  MOV A, #82H
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #00H
	  MOV A, #30
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #01H
	  MOV A, #58
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #02H
	  MOV A, #12
	  MOVX @DPTR,A
	  
	  MOV R2, #00
	  MOV R0, #00
	  
LOOP: 

	  MOV DPH, #0E8H
	  MOV DPL, #01H
	  MOVX A,@DPTR
	  MOV B,#8
	  DIV AB
	  MOV B,#2
	  DIV AB
	  MOV R1,B ;START
	  MOV B,#2
	  DIV AB
	  MOV B,#2
	  DIV AB
	  MOV R3,B ;STOP
	  MOV B,#2
	  DIV AB
	  MOV B,#2
	  DIV AB
	  MOV R5,B ;MODE

	  MOV A,R5
	  JNZ CSTOP
      ACALL CLOCK
	  JMP UP

CSTOP: ACALL STOP
	   
UP:   MOV A, R2
	  SUBB A, #4
	  JNZ WRAP
	  MOV DPH, #95H
	  MOV DPL, #00H
	  MOVX A,@DPTR
	  INC A
	  MOVX @DPTR,A
	  
	  MOV A,R1
	  JZ SKIP
	  MOV DPH, #95H
	  MOV DPL, #03H
	  MOVX A,@DPTR
	  INC A
	  MOVX @DPTR,A
	  
SKIP: MOV R2, #00
	  
      MOV DPH, #95H
	  MOV DPL, #00H
	  MOVX A,@DPTR
	  SUBB A, #60
	  JNZ WRAP
	  MOV DPH, #95H
	  MOV DPL, #01H
	  MOVX A,@DPTR
	  INC A
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #01H
	  MOVX A,@DPTR
	  
	  SUBB A, #60
	  MOV R6,A
	  
	  MOV DPH, #95H
	  MOV DPL, #00H
	  MOV A,#00
	  MOVX @DPTR,A
	  
	  MOV A,R6
	  JNZ WRAP
	  
	  MOV DPH, #95H
	  MOV DPL, #02H
	  MOVX A,@DPTR
	  INC A
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #02H
	  MOVX A,@DPTR
	  SUBB A, #13
	  MOV R6,A
	  
	  MOV DPH, #95H
	  MOV DPL, #01H
	  MOV A,#00
	  MOVX @DPTR,A
	  
	  MOV A,R6
	  JNZ WRAP
	  MOV DPH, #95H
	  MOV DPL, #02H
	  MOV A,#01
	  MOVX @DPTR,A
	  
WRAP:
	  MOV DPH, #95H
	  MOV DPL, #03H
	  MOVX A,@DPTR
	  SUBB A, #60
	  JNZ WRAP1
	  MOV DPH, #95H
	  MOV DPL, #04H
	  MOVX A,@DPTR
	  INC A
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #04H
	  MOVX A,@DPTR
	  
	  SUBB A, #60
	  MOV R6,A
	  
	  MOV DPH, #95H
	  MOV DPL, #03H
	  MOV A,#00
	  MOVX @DPTR,A
	  
	  MOV A,R6
	  JNZ WRAP1
	  
	  MOV DPH, #95H
	  MOV DPL, #05H
	  MOVX A,@DPTR
	  INC A
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #05H
	  MOVX A,@DPTR
	  SUBB A, #13
	  MOV R6,A
	  
	  MOV DPH, #95H
	  MOV DPL, #04H
	  MOV A,#00
	  MOVX @DPTR,A
	  
	  MOV A,R6
	  JNZ WRAP1
	  MOV DPH, #95H
	  MOV DPL, #05H
	  MOV A,#01
	  MOVX @DPTR,A
	  
WRAP1:JMP LOOP


	  
	  
	 ;RESET STOPWATCH TO 00:00:00
CLOCK:MOV DPH, #95H
	  MOV DPL, #03H
	  MOV A, #0
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #04H
	  MOV A, #0
	  MOVX @DPTR,A
	  
	  MOV DPH, #95H
	  MOV DPL, #05H
	  MOV A, #0
	  MOVX @DPTR,A
	  
	  
	  ;MINUTES
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11111110B
	  MOVX @DPTR, A ;grounding 10s place cathode
	  
	  MOV DPH, #95H
	  MOV DPL, #01H
	  MOVX A,@DPTR
	  MOV B,#10
	  DIV AB		;quotient in accumulator, pass to print
	  MOV R7,B		;remainder stored in R7 for later
	  
	  ACALL DELAY
      ACALL PRINT   ;printing the 10s digit 
	  
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11111011B
	  MOVX @DPTR, A ;grounding 1s place cathode
	  
	  MOV A,R7
	  ACALL DELAY
      ACALL PRINT ;printing 1s digit
	  
	  
	  ;SECONDS
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11110111B
	  MOVX @DPTR, A ;grounding 10s place cathode
	  
	  MOV DPH, #95H
	  MOV DPL, #00H
	  MOVX A,@DPTR
	  MOV B,#10
	  DIV AB		;quotient in accumulator, pass to print
	  MOV R7,B		;remainder stored in R7 for later
	  
	  ACALL DELAY
      ACALL PRINT   ;printing the 10s digit 
	  
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11101111B
	  MOVX @DPTR, A ;grounding 1s place cathode
	  
	  MOV A,R7
	  ACALL DELAY
      ACALL PRINT ;printing 1s digit
	  
	  
	  ;HOURS
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11011111B
	  MOVX @DPTR, A ;grounding 10s place cathode
	  
	  MOV DPH, #95H
	  MOV DPL, #02H
	  MOVX A,@DPTR
	  MOV B,#10
	  DIV AB		;quotient in accumulator, pass to print
	  MOV R7,B		;remainder stored in R7 for later
	  
	  ACALL DELAY
      ACALL PRINT   ;printing the 10s digit 
	  
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11111101B
	  MOVX @DPTR, A ;grounding 1s place cathode
	  
	  MOV A,R7
	  ACALL DELAY
      ACALL PRINT ;printing 1s digit
	  
	  MOV A,R5
	  RET


STOP:
	  ;MINUTES
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11111110B
	  MOVX @DPTR, A ;grounding 10s place cathode
	  
	  MOV DPH, #95H
	  MOV DPL, #04H
	  MOVX A,@DPTR
	  MOV B,#10
	  DIV AB		;quotient in accumulator, pass to print
	  MOV R7,B		;remainder stored in R7 for later
	  
	  ACALL DELAY
      ACALL PRINT   ;printing the 10s digit 
	  
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11111011B
	  MOVX @DPTR, A ;grounding 1s place cathode
	  
	  MOV A,R7
	  ACALL DELAY
      ACALL PRINT ;printing 1s digit
	  
	  
	  ;SECONDS
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11110111B
	  MOVX @DPTR, A ;grounding 10s place cathode
	  
	  MOV DPH, #95H
	  MOV DPL, #03H
	  MOVX A,@DPTR
	  MOV B,#10
	  DIV AB		;quotient in accumulator, pass to print
	  MOV R7,B		;remainder stored in R7 for later
	  
	  ACALL DELAY
      ACALL PRINT   ;printing the 10s digit 
	  
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11101111B
	  MOVX @DPTR, A ;grounding 1s place cathode
	  
	  MOV A,R7
	  ACALL DELAY
      ACALL PRINT ;printing 1s digit
	  
	  
	  ;HOURS
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11011111B
	  MOVX @DPTR, A ;grounding 10s place cathode
	  
	  MOV DPH, #95H
	  MOV DPL, #05H
	  MOVX A,@DPTR
	  MOV B,#10
	  DIV AB		;quotient in accumulator, pass to print
	  MOV R7,B		;remainder stored in R7 for later
	  
	  ACALL DELAY
      ACALL PRINT   ;printing the 10s digit 
	  
	  MOV DPH, #0E8H
	  MOV DPL, #02H
	  MOV A, #11111101B
	  MOVX @DPTR, A ;grounding 1s place cathode
	  
	  MOV A,R7
	  ACALL DELAY
      ACALL PRINT ;printing 1s digit
	  RET

PRINT:
	  MOV DPH, #90H
	  MOV DPL, #00H
	  MOV B,#32			;locate which subroutine to call, width of 20H or 32
	  MUL AB
	  MOV R4,A			;R4 now stores the lower nibble of product, we first handle the upper nibble at B
	  MOV A,DPH
	  ADD A,B			;adding upper nibble and moving to DPH
	  MOV DPH,A
	  MOV A,R4			;taking lower nibble back at A and jumping to @A+DPTR
	  JMP @A+DPTR
	  
LED:  RET
	  
	  
	  
DELAY:
	  MOV R4, #10
	  LOOP1: MOV R6, #100
	  LOOP3: DJNZ R6, LOOP3
	  DJNZ R4, LOOP1
	  RET

ORG 0FFF0H
	INC R2
    MOV TMOD,#01H		
	MOV TH0, #4CH
	MOV TL0, #04H
	SETB TR0
	RETI

END