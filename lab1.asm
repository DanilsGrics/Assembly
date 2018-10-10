Comment &
   Danils Grics 161VDB001 14. variants
   f(X, Y) = (-XZ^2 - Y + 1)/(2X + Z^3)
&

.model tiny
.code
.startup
           Org 100h
		   Jmp Short _Start
X          Db   1
Y          Db   2
Z          Db	-2
Two       Equ	2  
ZerDiv     Dw   0

_Start:
           Mov  Al, Z 	;Al = -2
           Imul Al		;Ax = Al*Al = -2^2 = 4 (Z^2)
		   Mov	Bx, Ax	;Bx = Ax = 4
           Mov  Al, X	;Al = 1
		   Imul Bx		;Ax = Ax*Bx = 1*4 = 4 (XZ^2)

		   Neg Ax		;Ax = -4
		   Mov	Bx, Ax	;Bx = Ax = -4
		   Mov Al, Y	;Al = 2
		   Cbw			;Ax = Al(Word) = 2
		   Sub Bx, Ax 	;Bx = Bx - Ax = -4-2 = -6
		   Inc	Bx		;Bx = Bx+1 = -5
		   Mov	Cx, Bx	;Cx = Bx = -5 Cx = (-XZ^2 - Y + 1)

		   Mov  Al, X	;Al = 1
		   Mov Bl, Two	;Bl = Two = 2
		   Imul Bl		;Ax = Al*Bl = 1*2 = 2 (2X)
		   Mov	Bx, Ax	;Bx = Ax = 2 (2X)

		   Mov  Al, Z 	;Al = -2
		   Imul Al		;Ax = Al*Al = -2^2 = 4 (Z^2)
		   Mov Dx, Ax	;Dx = Ax = 4
		   Mov  Al, Z 	;Al = -2
		   Imul Dx		;Ax = Ax*Dx = -2*4 = -8
		   Add Ax, Bx	;Ax = Ax + Bx = -8 + 2 = -6 Ax = (2X + Z^3)
		   Xchg Ax, Cx  ;Ax = -5, Cx = -6

		   cmp Cx, ZerDiv	;Cx is devider so it cant be == 0
		   Jnz short _Div	;if cmp = true > exit
		   Jmp Short _Exit
		   

_Div:
		   Cwd
		   Idiv Cx		; Ax = Ax / Cx = -5/-6 = 0  

_Exit:

.exit 0
end
