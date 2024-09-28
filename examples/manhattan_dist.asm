.ORIG x3000
TRAP 0x29 ; get player position

;CHECKS X COOR
ADD R0 R0 #0
BRn NEGX ;CHECKS IF NEGATIVE

JSR POSITIVE_X
BRnzp SKIP_X ; skips negative jump

NEGX ; JUMPS IF NEGATIVE
JSR NEGATIVE_X

SKIP_X

; Y COORDINATE
ADD R1 R1 #0
BRn NEGY ;CHECKS IF NEGATIVE

JSR POSITIVE_Y
BRnzp SKIP_Y ; skips negative jump

NEGY ; JUMPS IF NEGATIVE
JSR NEGATIVE_Y

SKIP_Y

; Z COORDINATE
ADD R2 R2 #0
BRn NEGZ ;CHECKS IF NEGATIVE

JSR POSITIVE_Z
BRnzp SKIP_Z ; skips negative jump

NEGZ ; JUMPS IF NEGATIVE
JSR NEGATIVE_Z

SKIP_Z

;CHECKS X COOR
ADD R0 R0 #0
BRn NEGX_B ;CHECKS IF NEGATIVE

JSR POSITIVE_X_B
BRnzp SKIP_X_B ; skips negative jump

NEGX_B ; JUMPS IF NEGATIVE
JSR NEGATIVE_X_B

SKIP_X_B

; Y COORDINATE
ADD R1 R1 #0
BRn NEGY_B ;CHECKS IF NEGATIVE

JSR POSITIVE_Y_B
BRnzp SKIP_Y_B ; skips negative jump

NEGY_B ; JUMPS IF NEGATIVE
JSR NEGATIVE_Y_B

SKIP_Y_B

; Z COORDINATE
ADD R2 R2 #0
BRn NEGZ_B ;CHECKS IF NEGATIVE

JSR POSITIVE_Z_B
BRnzp SKIP_Z_B ; skips negative jump

NEGZ_B ; JUMPS IF NEGATIVE
JSR NEGATIVE_Z_B

SKIP_Z_B

TRAP 0x27

;CLEARING REG
AND R7 R7 #0
; changing to negative to minus
NOT R5 R5
ADD R5 R5 #1

; seeing which is bigger
ADD R7 R6 R5 ; r5 is a r6 is b difference, if its negative r5 A has a bigger difference therefore B (r6) is closer
BRp A_BIG
BRn  B_BIG
BRz ZERO

A_BIG
AND R0 R0 #0
LEA R0 A_BIGGER
TRAP 0x28
HALT

B_BIG
AND R0 R0 #0
LEA R0 A_BIGGER
TRAP 0x28
HALT

ZERO 
AND R0 R0 #0
LEA R0 EQUAL
TRAP 0x28
HALT

;R5 and R6 IS TOTAL FOR A DIFFERENCE
HALT 

NEGATIVE_X ; JUMP

; R3 IS COORDINATE
LD R3 A_X 

; changing to negative
NOT R3 R3
ADD R3 R3 #1 
ADD R4 R0 R3  ; TWO NEGATIVES 
;CHANGING DIFFERENCE TO POSITIVE
NOT R4 R4 
ADD R4 R4 #1
ADD R5 R5 R4 
;RESET
AND R4 R4 #0
AND R3 R3 #0 
; STORES IN MEMORY 
RET
;END OF NEGATIVE

POSITIVE_X ; JMP

LD R3 A_X

NOT R3 R3
ADD R3 R3 #1

ADD R4 R0 R3
BRp POSITIVE_X_SKIP ; IF ANSWER IS POSITIVE BECAUSE COORDINATE WAS SMALLER POSITIVE THAN PLAYER X OR WAS NEGATIVE
; COORDINATE WAS BIGGER THEN PLAYER X
NOT R4 R4
ADD R4 R4 #1

POSITIVE_X_SKIP ; SKIPS 

ADD R5 R5 R4
;RESETS
AND R4 R4 #0 
AND R3 R3 #0
;STORES IN MEMORY
RET



; Y AXIS 
NEGATIVE_Y ; JUMP

; R3 IS COORDINATE
LD R3 A_Y 

; changing to negative
NOT R3 R3
ADD R3 R3 #1 
ADD R4 R1 R3  ; TWO NEGATIVES 
;CHANGING DIFFERENCE TO POSITIVE
NOT R4 R4 
ADD R4 R4 #1
ADD R5 R5 R4 
;RESET
AND R4 R4 #0
AND R3 R3 #0 
; STORES IN MEMORY
RET
;END OF NEGATIVE

POSITIVE_Y ; JMP

LD R3 A_Y

NOT R3 R3
ADD R3 R3 #1

ADD R4 R1 R3
BRp POSITIVE_Y_SKIP ; IF ANSWER IS POSITIVE BECAUSE COORDINATE WAS SMALLER POSITIVE THAN PLAYER X OR WAS NEGATIVE
; COORDINATE WAS BIGGER THEN PLAYER X
NOT R4 R4
ADD R4 R4 #1

POSITIVE_Y_SKIP ; SKIPS 

ADD R5 R5 R4
;RESETS
AND R4 R4 #0 
AND R3 R3 #0
;STORES IN MEMORY
RET



; Z AXIS 
NEGATIVE_Z ; JUMP

; R3 IS COORDINATE
LD R3 A_Z 

; changing to negative
NOT R3 R3
ADD R3 R3 #1 
ADD R4 R1 R3  ; TWO NEGATIVES 
;CHANGING DIFFERENCE TO POSITIVE
NOT R4 R4 
ADD R4 R4 #1
ADD R5 R5 R4 
;RESET
AND R4 R4 #0
AND R3 R3 #0 
; STORES IN MEMORY 
RET
;END OF NEGATIVE

POSITIVE_Z ; JMP

LD R3 A_Z

NOT R3 R3
ADD R3 R3 #1

ADD R4 R2 R3
BRp POSITIVE_Z_SKIP ; IF ANSWER IS POSITIVE BECAUSE COORDINATE WAS SMALLER POSITIVE THAN PLAYER X OR WAS NEGATIVE
; COORDINATE WAS BIGGER THEN PLAYER X
NOT R4 R4
ADD R4 R4 #1

POSITIVE_Z_SKIP ; SKIPS 

ADD R5 R5 R4
;RESETS
AND R4 R4 #0 
AND R3 R3 #0
;STORES IN MEMORY
RET



; B



NEGATIVE_X_B ; JUMP

; R3 IS COORDINATE
LD R3 B_X 

; changing to negative
NOT R3 R3
ADD R3 R3 #1 
ADD R4 R0 R3  ; TWO NEGATIVES 
;CHANGING DIFFERENCE TO POSITIVE
NOT R4 R4 
ADD R4 R4 #1
ADD R6 R6 R4 
;RESET
AND R4 R4 #0
AND R3 R3 #0 
; STORES IN MEMORY 
RET
;END OF NEGATIVE

POSITIVE_X_B ; JMP

LD R3 B_X

NOT R3 R3
ADD R3 R3 #1

ADD R4 R0 R3
BRp POSITIVE_X_SKIP_B ; IF ANSWER IS POSITIVE BECAUSE COORDINATE WAS SMALLER POSITIVE THAN PLAYER X OR WAS NEGATIVE
; COORDINATE WAS BIGGER THEN PLAYER X
NOT R4 R4
ADD R4 R4 #1

POSITIVE_X_SKIP_B ; SKIPS 

ADD R6 R6 R4
;RESETS
AND R4 R4 #0 
AND R3 R3 #0
;STORES IN MEMORY
RET



; Y AXIS 
NEGATIVE_Y_B ; JUMP

; R3 IS COORDINATE
LD R3 B_Y 

; changing to negative
NOT R3 R3
ADD R3 R3 #1 
ADD R4 R1 R3  ; TWO NEGATIVES 
;CHANGING DIFFERENCE TO POSITIVE
NOT R4 R4 
ADD R4 R4 #1
ADD R6 R6 R4 
;RESET
AND R4 R4 #0
AND R3 R3 #0 
; STORES IN MEMORY
RET
;END OF NEGATIVE

POSITIVE_Y_B ; JMP

LD R3 B_Y

NOT R3 R3
ADD R3 R3 #1

ADD R4 R1 R3
BRp POSITIVE_Y_SKIP_B ; IF ANSWER IS POSITIVE BECAUSE COORDINATE WAS SMALLER POSITIVE THAN PLAYER X OR WAS NEGATIVE
; COORDINATE WAS BIGGER THEN PLAYER X
NOT R4 R4
ADD R4 R4 #1

POSITIVE_Y_SKIP_B ; SKIPS 

ADD R6 R6 R4
;RESETS
AND R4 R4 #0 
AND R3 R3 #0
;STORES IN MEMORY
RET



; Z AXIS 
NEGATIVE_Z_B ; JUMP

; R3 IS COORDINATE
LD R3 B_Z 

; changing to negative
NOT R3 R3
ADD R3 R3 #1 
ADD R4 R1 R3  ; TWO NEGATIVES 
;CHANGING DIFFERENCE TO POSITIVE
NOT R4 R4 
ADD R4 R4 #1
ADD R6 R6 R4 
;RESET
AND R4 R4 #0
AND R3 R3 #0 
; STORES IN MEMORY 
RET
;END OF NEGATIVE

POSITIVE_Z_B ; JMP

LD R3 B_Z

NOT R3 R3
ADD R3 R3 #1

ADD R4 R2 R3
BRp POSITIVE_Z_SKIP_B ; IF ANSWER IS POSITIVE BECAUSE COORDINATE WAS SMALLER POSITIVE THAN PLAYER X OR WAS NEGATIVE
; COORDINATE WAS BIGGER THEN PLAYER X
NOT R4 R4
ADD R4 R4 #1

POSITIVE_Z_SKIP_B ; SKIPS 

ADD R6 R6 R4
;RESETS
AND R4 R4 #0 
AND R3 R3 #0
;STORES IN MEMORY
RET

A_X .FILL #1
A_Y .FILL #2
A_Z .FILL #3
B_X .FILL #20
B_Y .FILL #32
B_Z .FILL #-8
A_BIGGER .STRINGZ "The player is closer to point A"
B_BIGGER .STRINGZ	"The player is closer to point B"
EQUAL .STRINGZ "The player is equally far from both points"
.END