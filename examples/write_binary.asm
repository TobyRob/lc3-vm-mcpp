.ORIG x3000

TRAP 0x29 ; player position r0 x r1 y r2 z

LD R3 NUMBER_TO_CONVERT

LD R5 FIFTHTEEN
AND R4 R3 R5 ; 100000000000000
BRp S_2
BRz F_2
F_2
LEA R0 FAIL
PUTS
BR SKIP_2
S_2
LEA R0 SUCCESS
PUTS
SKIP_2
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 FOURTEEN
AND R4 R3 R5; 10000000000000
BRp S_3
BRz F_3
F_3
LEA R0 FAIL
PUTS
BR SKIP_3
S_3
LEA R0 SUCCESS
PUTS
SKIP_3
AND R0 R0 #0
AND R4 R4 #0

LD R5 THIRTEEN
AND R4 R3 R5; 1000000000000
BRp S_4
BRz F_4
F_4
LEA R0 FAIL
PUTS
BR SKIP_4
S_4
LEA R0 SUCCESS
PUTS
SKIP_4
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 TWELVE
AND R4 R3 R5; 100000000000
BRp S_5
BRz F_5
F_5
LEA R0 FAIL
PUTS
BR SKIP_5
S_5
LEA R0 SUCCESS
PUTS
SKIP_5
AND R0 R0 #0
AND R4 R4 #0

LD R5 ELEVEN
AND R4 R3 R5
BRp S_6
BRz F_6
F_6
LEA R0 FAIL
PUTS
BR SKIP_6
S_6
LEA R0 SUCCESS
PUTS
SKIP_6
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 TEN
AND R4 R3 R5; 1000000000
BRp S_7
BRz F_7
F_7
LEA R0 FAIL
PUTS
BR SKIP_7
S_7
LEA R0 SUCCESS
PUTS
SKIP_7
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 NINE
AND R4 R3 R5; 100000000
BRp S_8
BRz F_8
F_8
LEA R0 FAIL
PUTS
BR SKIP_8
S_8
LEA R0 SUCCESS
PUTS
SKIP_8
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 EIGHT
AND R4 R3 R5; 10000000
BRp S_9
BRz F_9
F_9
LEA R0 FAIL
PUTS
BR SKIP_9
S_9
LEA R0 SUCCESS
PUTS
SKIP_9
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 SEVEN
AND R4 R3 R5 ; 1000000
BRp S_10
BRz F_10
F_10
LEA R0 FAIL
PUTS
BR SKIP_10
S_10
LEA R0 SUCCESS
PUTS
SKIP_10
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 SIX
AND R4 R3 R5 ; 100000
BRp S_11
BRz F_11
F_11
LEA R0 FAIL
PUTS
BR SKIP_11
S_11
LEA R0 SUCCESS
PUTS
SKIP_11
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 FIVE
AND R4 R3 R5 ; 10000
BRp S_12
BRz F_12
F_12
LEA R0 FAIL
PUTS
BR SKIP_12
S_12
LEA R0 SUCCESS
PUTS
SKIP_12
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 FOUR
AND R4 R3 R5 ; 1000
BRp S_13
BRz F_13
F_13
LEA R0 FAIL
PUTS
BR SKIP_13
S_13
LEA R0 SUCCESS
PUTS
SKIP_13
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 THREE
AND R4 R3 R5 ; 100
BRp S_14
BRz F_14
F_14
LEA R0 FAIL
PUTS
BR SKIP_14
S_14
LEA R0 SUCCESS
PUTS
SKIP_14
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 TWO
AND R4 R3 R5 ; 10
BRp S_15
BRz F_15
F_15
LEA R0 FAIL
PUTS
BR SKIP_15
S_15
LEA R0 SUCCESS
PUTS
SKIP_15
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

LD R5 ONE
AND R4 R3 R5 ; 1
BRp S_16
BRz F_16
F_16
LEA R0 FAIL
PUTS
BR SKIP_16
S_16
LEA R0 SUCCESS
PUTS
SKIP_16
AND R0 R0 #0
AND R4 R4 #0
AND R5 R5 #0

HALT

NUMBER_TO_CONVERT .FILL #237 ; Note: Please do not change the name of this constant
FIVETEEN .FILL #32768
FOURTEEN .FILL #16384
THIRTEEN .FILL #8192
TWELVE .FILL #4096
ELEVEN .FILL #2048
TEN .FILL #1024
NINE .FILL #512
EIGHT .FILL #256
SEVEN .FILL #128
SIX .FILL #64
FIVE .FILL #32
FOUR .FILL #16
THREE .FILL #8
TWO .FILL #2
ONE .FILL #1
SUCCESS .STRINGZ " SUCCESS "
FAIL .STRINGZ " FAIL "
.END