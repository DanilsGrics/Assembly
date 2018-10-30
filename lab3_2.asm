Comment &	
	Danils Grics 161VDB001	2. variants
	atrast max elementu
	Bazes adres. metode
&

.model tiny
.code
.startup
           Org 100h
           Jmp Short Start
Vector     Dw  2, 7, -1, 16, 15
N          Equ 5
Start:
			Lea  Bx, Vector			;elements of Vector are linked to Bx
			Mov  Cx, N				;iteration counter
			Mov Ax, Vector			;first element of Vector is stored into Ax for comparison
S:
			Mov	Dx, [Bx]			;save current element to Dx from Vector
			Cmp Dx, Ax				;comparison of current element and last biggest
			Jle Continue			;if Dx>Ax => Ax = Dx
			Mov Ax, Dx
Continue:	   
			Add  Bx, 2
			Loop S
.exit 0
end
	