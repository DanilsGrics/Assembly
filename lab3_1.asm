Comment &	
	Danils Grics 161VDB001	2. variants
	atrast max elementu
	Indeksa adres. metode
&

.model tiny
.code
.startup
			Org 100h
			Jmp Short Start
Vector		Dw 2, 7, -1, 16, 15
N			Equ 5

Start:
			Xor Ax, Ax				;clear Ax
			Xor Bx, Bx				;clear Bx
			Mov Cx, N				;iteration counter

S:
			Mov Dx, Vector[Bx]		;save current element to Dx from Vector
			Cmp Dx, Ax				;comparison of current element and last biggest
			Jle Continue			;if Dx>Ax => Ax = Dx
			Mov Ax, Dx				;save current maximal value to Ax

Continue:
			Add Bx, 2				;cause Vector is word, we need 2 bytes every time for offset
			Loop S					;next iteration	
.exit 0
end