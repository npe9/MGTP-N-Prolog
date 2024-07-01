% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69).

:- dynamic 'P':delta/1.

'P':delta(p(e(X,e(e(Y,Z),e(e(Z,Y),X))))).
'P':delta(p(e(e(e(X,Y),e(X,Z)),e(Y,Z)))).
