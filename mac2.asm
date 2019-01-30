Print       Macro _M, _Vector, _S
            Local Pr

            Push Ax Bx Cx

            Mov  Cx, _M
            Lea  Bx, _Vector
Pr:         Mov  Ax, [Bx]
            Add  Bx, _S  
Loop Pr

            Pop  Cx Bx Ax

            EndM