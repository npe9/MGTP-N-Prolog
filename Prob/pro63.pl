% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1).

:- dynamic 'P':delta/1.

'P':delta(p(i(X,i(Y,X)))).
'P':delta(p(i(i(i(X,Y),X),X))).
'P':delta(p(i(i(X,Y),i(i(Y,Z),i(X,Z))))).
