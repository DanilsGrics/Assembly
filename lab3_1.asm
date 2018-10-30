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
Vector		Dw  2, 7, -1, 16, 15
N			Equ 5

Start:
			Xor Bx, Bx				;clear Bx
			Mov Cx, N				;iteration counter
			Mov Ax, Vector			;first element of Vector is stored into Ax for comparison
S:
			Mov Dx, Vector[Bx]		;save current element to Dx from Vector
			Cmp Dx, Ax				;comparison of current element and last biggest
			Jle Continue			;if Dx>Ax => Ax = Dx
			Mov Ax, Dx				;Ax is current biggest figure
Continue:
			Add Bx, 2				;cause Vector is word, we need 2 bytes every time for offset
			Loop S					;looping (x5 times)		
.exit 0
end