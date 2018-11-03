Comment &	
	Danils Grics 161VDB001	2. variants
	atrast max elementu
	Indeksa adres. ar merog. metode (E-registres only)
&

.model tiny
.code
.startup
			Org 100h
			Jmp Short Start
Vector		Label  Word
Array		Label  Word
			Dw 2, 7, -1, 16, 15
N			Equ 5
Step		Equ 2

.386									;cause we use EBx register

Start:
			Xor Ax, Ax					;clear Ax
			Xor	EBx, EBx				;clear EBx	
			Mov	Cx, N					;iteration counter

S: 
			Mov Dx, Array[EBx*Step]		;save current element to Dx from Vector
			Cmp Dx, Ax					;comparison of current element and last biggest
			Jle Continue				;if Dx>Ax => Ax = Dx
			Mov Ax, Dx					;save current maximal value to Ax

Continue:
			Inc EBx						;next element
			Loop S						;next iteration
.exit 0
end
	   