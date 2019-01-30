Comment &
  Danils Grics 161VDB001			16. variants
  Atrast minimalu elementu katra matricas stabina (kolona)
&

.model tiny
.code
.startup
            Org 100h
            Jmp Short Start
    N       Equ 3
    M       Equ 3
    Matrix  Dw  1, 2, 3
            Dw  4, -5, -6
    Vector  DW  N Dup (?)
    S       Equ Type Matrix

FormVector  Proc
            Push Bp
            Mov  Bp, Sp

            Push Cx
            Push Bx
            Push Dx
            Push Di
            Push Ax

			Mov  Cx, [Bp + 6]
            Mov  Bx, [Bp + 8]
            Mov  Di, [Bp + 10]
			
FirstRowToVector:
	Mov		Ax, [Bx]					
	Mov		[Di], Ax					
	Add		Bx, S
	Add		Di, S
Loop FirstRowToVector

            Mov  Cx, [Bp + 4]
			Dec  Cx

Rows:
	Push	Cx							;current Cx (count of iterations) saved to stack
	Mov		Cx, M						;Cx = (M = 3) same as column count
	Mov		Di, [Bp + 10]

Cols:
	Mov		Ax, [Bx]
	Cmp		[Di], Ax					;compare current lowest element and current element (Matrix[Bx+Si])
	Jl		Lower						;if min value of column < Matrix[Bx][Si] go to Lower and next element else save new min element for column

	Mov		[Di], Ax					;save current min element to Vector

	Lower:
	Add		Bx, S						;Si = Si + S => Next element to compare
	Add		Di, S						;to compare min value of column and current

Loop	Cols

	Pop		Cx							;get saved Cx from stack

Loop	Rows   
  
            Pop Ax 
            Pop Di
            Pop Dx
            Pop Bx
            Pop Cx

            Pop  Bp
            Ret  2*4
FormVector  EndP




Print       Proc
            Push Bp
            Mov  Bp, Sp

            Push Cx
            Push Bx
            Push Ax

            Mov  Cx, [Bp + 4]
            Mov  Bx, [Bp + 6]
Pr:         Mov  Ax, [Bx]
            Add  Bx, S
            Loop Pr

            Pop  Ax
            Pop  Bx
            Pop  Cx

            Pop  Bp
            Ret  2*2
Print       EndP

Start:
            Lea  Ax, Vector
            Push Ax
            Lea  Ax, Matrix
            Push Ax
            Mov  Ax, M
            Push Ax 
            Mov  Ax, N
            Push Ax 
            Call FormVector            

            Lea  Ax, Vector
            Push Ax
            Mov  Ax, M
            Push Ax
            Call Print
.exit 0
end