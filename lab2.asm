Comment &	
	Danils Grics 161VDB001	12. variants
	FUNKCIJA f(X, Y):
	(XY^2 + Z^2)/(-3XY - 2Z - 1),  ja (XY^2 + Z^2) > 0
	(XY^2 + Z^2)/(XZ - Y^3),  ja (XY^2 + Z^2) < 0
	NO CBW!
&

.model tiny
.code
.startup
.386
			Org 100h
			Jmp Short _Start  
X			Db  -2
Y			Db  -1
Z			Db	1
Three		Equ	3
Two			Equ	2
Zero		Equ	0
ZerDiv		Dw	0

_Start:
								;test if (XY^2 + Z^2) = 0
			Mov   Al, Y			;Al = Y = -1
			Imul  Y				;Ax = Al*Y = -1*-1 = 1
			MovSx Bx, X			;386 Bx = X(Word) = -2
			Imul  Bx, Ax		;386 Bx = Ax*Bx = -2*1 = -2 (XY^2)
			Mov   Al, Z			;Al = Y = 1
			Imul  Z				;Ax = Al*Z = 1*1 = 1
			Add Ax, Bx			;Ax = Ax + Bx = 1 + (-2) = -1 (XY^2 + Z^2)
			Mov Cx, Ax			;Cx = Ax = -1 (result saved)
			Jne   Not_Zero		;If Ax != 0 jump to "Not_Zero"

			Mov Dx, Zero	
			Jmp Short _Exit		;Else go to Exit

Not_Zero:
			Jl  Branch_C		;Test if Cx < 0 (if TRUE goes to Branch_C else stays here)

								;defining (-3XY - 2Z - 1) - B branch
			Mov Al, X			;Al = X = -2
			Imul Y				;Ax = Al*Y = -2*-1 = 2
			Imul Bx, Ax, Three	;Bx = 3*Ax = 6 (3XY)
			Neg Bx				;Bx = -Bx = -6 (-3XY)

			MovSx Ax, Z			;Ax = 1
			Imul Ax, Two		;Ax = Ax*2 = 1*2 = 2 (2Z)

			Sub Bx, Ax			;Bx = Bx - Ax = -6 -2 = -8 (-3XY - 2Z)

			Dec Bx				;Bx = Bx - 1 - -8-1 = -9 (-3XY - 2Z - 1)
			Mov Ax, Bx			;Ax = Bx = -9

			Jmp Short Rezult

Branch_C:						;(this particular variant) defining (XZ - Y^3) - C branch
			Mov  Al, X			;Al = X = -2
			Imul Z				;Ax = Al*Z = -2*1 = -2 
			Mov Bx, Ax			;Bx = Ax = -2 (XZ)

			Mov Al, Y			;Al = Y = -1 (Y)
			Imul Al				;Ax = Al*Al = 1 (Y^2)
			MovSx Dx, Y			;Dx = Y = -1
			Imul Ax, Dx			;Ax = Bx*Dx = -1 (Y^3)
			Sub Bx, Ax			;Bx = Bx - Ax = -2 - (-1) = -1 
			Mov Ax, Bx			;Ax = Bx = -1 (XZ - Y^3)
           
Rezult:
			Cmp Ax, Zero
			Jne _Div

			Mov ZerDiv, 1 
			Jmp Short _Exit

_Div:
			Xchg Ax, Cx			;Ax = -1, Cx = -1
			MovSx ECx, Cx		;386   ECx = FFFF FFFF
			Cwde					;386   EAx = FFFF FFFF
			Cdq 					;386   EDx = FFFF FFFF
			IDiv ECx				;386   EAx = 0000 0001, EDx = 0000 0000 
_Exit:

.exit 0
end
