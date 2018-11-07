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
Vector		Dw 2, 7, -1, 16, 15
N			Equ 5

Start:		
			Mov Ax, Vector			;Ax == Vector[0]
			Lea Bx, Vector			;elements of Vector are linked to Bx
			Mov Cx, N				;iteration counter

S:
			Mov Dx, [Bx]			;save current element to Dx from Vector
			Cmp Dx, Ax				;comparison of current element and last biggest
			Jle Continue			;if Dx>Ax => Ax = Dx
			Mov Ax, Dx				;save current maximal value to Ax

Continue:	   
			Add Bx, 2				;next two bytes (next element)
			Loop S					;next iteration
.exit 0
end
	