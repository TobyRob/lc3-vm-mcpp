.ORIG x3000
TRAP 0x29 ; player position, r0,r1,r2
STI R1 Y_VALUE; KEEPING PLAYER Y VALUE

; have to do first to have a starting point for lwoest
TRAP 0x2D ; r1 now holds HIGHEST POINT AT OG SPOT 
ADD R4 R4 R1 ; HOLDS CURRENT HIGHTEST
TRAP 0x27
JSR LOWEST_POINT ; FINDS LOWEST POINT IN 3 X 3 AREA
ADD R0 R0 #-1 ; x value CHANGED
TRAP 0x27
JSR LOWEST_POINT
ADD R0 R0 #2 ; x value CHANGED
TRAP 0x27
JSR LOWEST_POINT ; R4 HOLDS LOWEST POINT
TRAP 0x27

;RESETS
ADD R0 R0 #-1

NOT R5 R4 
ADD R5 R5 #1

ADD R5 R3 R5 ;  PLAYER POSITION Y - LOWEST POINT, USED AS COUNT

; CHANGE Y HEIGHT TO LOWEST POINT
AND R1 R1 #0
ADD R1 R1 R4 ; change

; RESET 
AND R3 R3 #0
AND R4 R4 #0


HEIGHT_LOOP
;CHECKS 9 BLOCKS
JSR BLOCKS
ADD R0 R0 #-1
JSR BLOCKS
ADD R0 R0 #2
JSR BLOCKS
; RESETS X TRUE VALUE
ADD R0 R0 #-1

ADD R1 R1 #1 ; NEXT HEIGHT BLOCK
ADD R5 R5 #-1 ; MINUS DIFFERENCE UNTIL PLAYER HEIGHT IS REACHED
BRp HEIGHT_LOOP


HALT

LOWEST_POINT 
; BACK TO PLAYER HEIGHT LEVEL
AND R1 R1 #0
ADD R1 R1 R3 

 TRAP 0x2D ; CHANGES Y VALUE
 NOT R5 R1 
 ADD R5 R5 #1
 ADD R6 R4 R5 ; CURRENT - NEW BLOCK, IF NEW BLOCK IS LOWER THEN OTHER BLOCK 
BRn SMALLER_CENTRE
 AND R4 R4 #0
 ADD R4 R4 R5 ; NEW LOWEST POINT
SMALLER_CENTRE
; BACK TO PLAYER HEIGHT LEVEL
 AND R1 R1 #0
 ADD R1 R1 R3 

 ADD R2 R2 #-1 ; LEFT BLOCK
 TRAP 0x2D ; GETS HIGHSEST POINT OF LEFT BLOCK
 ;NOT VALUE OF LEFT 
 NOT R5 R1
 ADD R5 R5 #1
 ADD R6 R4 R5 ; CURRENT - NEW BLOCK, IF NEW BLOCK IS LOWER THEN OTHER BLOCK 
BRn SMALLER_LEFT
 AND R4 R4 #0
 ADD R4 R4 R5 ; NEW LOWEST POINT
SMALLER_LEFT
;BACK TO PLAYER HEIGHT LEVEL
AND R1 R1 #0
ADD R1 R1 R3 
 
 ADD R2 R2 #1 ; RUGHT BLOCK
 TRAP 0x2D ; GETS HIGHSEST POINT OF RIGHT BLOCK
 ;NOT VALUE OF RIGHT 
 NOT R5 R1
 ADD R5 R5 #1
 ADD R6 R4 R5 ; CURRENT - NEW BLOCK, IF NEW BLOCK IS LOWER THEN OTHER BLOCK 
BRn SMALLER_RIGHT
 AND R4 R4 #0
 ADD R4 R4 R5 ; NEW LOWEST POINT
SMALLER_RIGHT

; RESET TO CENTRE POSITION
 ADD R2 R2 #-1
 AND R1 R1 #0
 ADD R1 R1 R3 
RET

BLOCKS

 TRAP 0x2B ; GET BLOCKID R3 NOW HOLDS VALUE
 ADD R3 R3 #-1 ; CHECKS IF BLOCK ID IS AIR
 BRzp NOT_AIR_START
 AND R3 R3 #0
 ADD R3 R3 #4
 TRAP 0x2C
 NOT_AIR_START
 ADD R2 R2 #-1 ; LEFT Z BLOCK
 AND R3 R3 #0

 TRAP 0x2B ; GET BLOCKID R3 NOW HOLDS VALUE
 ADD R3 R3 #-1 ; CHECKS IF BLOCK ID IS AIR
 BRzp NOT_AIR_LEFT
 AND R3 R3 #0
 ADD R3 R3 #4
 TRAP 0x2C
 NOT_AIR_LEFT
 AND R3 R3 #0

 ADD R2 R2 #2  ; RIGHT Z BLOCK
 TRAP 0x2B ; GET BLOCKID R3 NOW HOLDS VALUE
 ADD R3 R3 #-1 ; CHECKS IF BLOCK ID IS AIR
 BRzp NOT_AIR_RIGHT
 AND R3 R3 #0
 ADD R3 R3 #4 ; SET R3 TO COBBLESTONE ID
 TRAP 0x2C
 NOT_AIR_RIGHT
 AND R3 R3 #0

 ; RESET 
 ADD R2 R2 #-1
RET

Y_VALUE .FILL X3250
.END