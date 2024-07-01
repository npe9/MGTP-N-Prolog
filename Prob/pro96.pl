% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69).

:- dynamic 'P':delta/1.

'P':delta(p(e(e(e(X,Y),Z),e(e(U,Y),e(e(X,U),Z))))).
'P':delta(p(e(e(e(X,Y),e(e(Y,X),Z)),Z))).
