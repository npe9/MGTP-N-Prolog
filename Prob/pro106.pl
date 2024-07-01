% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69).

:- dynamic 'P':delta/1.

'P':delta(p(e(e(e(X,Y),e(Z,Y)),e(X,Z)))).
'P':delta(p(e(X,e(e(X,e(Y,Z)),e(Z,Y))))).
