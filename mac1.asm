FormVector  Macro _N, _M, _Matrix, _Vector, _S
            Local Rows, Cols, Lower, FirstRowToVector

            Push Ax Bx Cx Dx Di

            Mov		Cx, _M
            Lea		Bx, _Matrix
            Lea		Di, _Vector

FirstRowToVector:
	Mov		Ax, [Bx]					
	Mov		[Di], Ax					;All elements of Vector are same as first row of Matrix
	Add		Bx, _S
	Add		Di, _S

Loop FirstRowToVector

	Mov		Cx, _N
	Dec		Cx

Rows:
	Push	Cx							;current Cx (count of iterations) saved to stack
	Mov		Cx, _M						;Cx = (M = 3) same as column count
	Sub		Di, _S*_M

Cols:
	Mov		Ax, [Bx]
	Cmp		[Di], Ax					;compare current lowest element and current element (Matrix[Bx+Si])
	Jl		Lower						;if min value of column < Matrix[Bx][Si] go to Lower and next element else save new min element for column

	Mov		[Di], Ax					;save current min element to Vector

Lower:
	Add		Bx, _S
	Add		Di, _S						;to compare min value of column and current

Loop	Cols

	Pop		Cx							;get saved Cx from stack

Loop	Rows

            Pop  Di Dx Cx Bx Ax

            EndM