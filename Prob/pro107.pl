% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69).

:- dynamic 'P':delta/1.

'P':delta(p(e(X,e(e(X,e(Y,Z)),e(Z,Y))))).
'P':delta(p(e(e(X,Y),e(e(X,Z),e(Y,Z))))).
