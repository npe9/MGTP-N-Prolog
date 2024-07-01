% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69).

:- dynamic 'P':delta/1.

'P':delta(p(e(e(e(e(e(X,Y),e(X,Z)),e(Y,Z)),U),U))).
'P':delta(p(e(X,e(e(e(e(Y,Z),e(Y,U)),e(Z,U)),X)))).
