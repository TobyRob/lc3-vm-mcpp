.ORIG x3000
TRAP 0x29 ; player position
TRAP 0x27
TRAP 0x2D
TRAP 0x27
LD R3, BLOCK_ID_GLASS
TRAP 0x27
TRAP 0x2C
HALT
BLOCK_ID_GLASS .FILL #20
.END