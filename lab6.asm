Comment &
  Danils Grics 161VDB001			16. variants
  Atrast minimalu elementu katra matricas stabina (kolona)
&

include mac1.asm
include mac2.asm

.model tiny
.code
.startup
            Org  100h
            Jmp  Short Start
    N       Equ 2
    M       Equ 3
    Matrix  Dw  1, -2, 3
            Dw  -4, 5, 0
    Vector  DW  N Dup (?)
    S       Equ Type Matrix

Start:
            FormVector N, M, Matrix, Vector, S
            Print M, Vector, S

.exit 0
end