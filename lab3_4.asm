Comment &	
	Danils Grics 161VDB001	2. variants
	atrast max elementu
	Bazes-indeksa adresesanas metode
&

.model tiny
.code
.startup
			Org 100h
			Jmp Short Start
Vector		Dw 2, 7, -1, 16, 15
N			Equ 5

Start:
			Xor	Bx, Bx					;clean Bx
			Xor	Si, Si					;clean Si
			Mov	Cx, N					;iteration counter
			Mov Ax, Vector				;Ax == Vector[0]

S:
			Mov	Dx, Vector[Bx][Si]		;save current element to Dx from Vector
			Cmp Dx, Ax					;comparison of current element and last biggest
			Jle Continue				;if Dx>Ax => Ax = Dx
			Mov Ax, Dx					;save current maximal value to Ax

Continue:
			Inc	Bx
			Inc	Si						;to observe next element on next iteration
			Loop S						;next iteration
.exit 0
end