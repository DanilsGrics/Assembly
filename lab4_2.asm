Comment &
  Danils Grics 161VDB001			16. variants
  Atrast minimalu elementu katra matricas stabina
&

.model tiny
.code
.startup
	Org 100h
	Jmp Short Start
	N Equ 3								;count of elements in column
	M Equ 3								;count of elements in row

	Matrix	DW 4, 5, 6
			DW 1, 2, 3
			DW 4, 1, 7					;1 for first column, 1 for second, 3 for third
			Vector	DW N Dup (?)

	S Equ Type Matrix

Start:
	Lea		Bx, Matrix					;elements of Matrix are linked to Bx (saving results to this vector)
	Mov		Cx, M						;count of iterations is the same as count of elements in row
	Xor		Di, Di						;clear Bx

FirstRowToVector:
	Mov		Ax, [Bx]					
	Mov		Vector[Di], Ax				;All elements of Vector are same as first row of Matrix
	Add		Bx, S
	Add		Di, S

Loop FirstRowToVector

	Mov		Cx, (N-1)					;Cx = N-1 (= 1) to force comparison except first row

Rows:
	Push	Cx							;current Cx (count of iterations) saved to stack
	Mov		Cx, M						;Cx = (M = 3) same as column count
	Xor		Si, Si						;clear Si index
	Xor		Di, Di						;clear Di index

Cols:
	Mov		Ax, [Bx][Si]
	Cmp		Vector[Di], Ax				;compare current lowest element and current element (Matrix[Bx+Si])
	Jl		Lower						;if min value of column < Matrix[Bx][Si] go to Lower and next element else save new min element for column

	Mov		Vector[Di], Ax				;save current min element to Vector

	Lower:
	Add		Si, S						;Si = Si + S => Next element to compare
	Mov		Di, Si						;to compare min value of column and current

Loop	Cols

	Add		Bx, S*M						;Bx = Bx + S*M
	Pop		Cx							;get saved Cx from stack

Loop	Rows   

	Xor		Di, Di						;clear Di index
	Mov		Cx, M						;Cx = M (count of columns)	

Print:
	Mov		Ax, Vector[Di]				;Ax = current [Di] (to see minimal element of column in Ax)
	Add		Di, S						;Di index = Di + S (next element)

Loop	Print
        
.exit 0
end
