% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1).

:- dynamic 'P':delta/1.

'P':delta(p(i(X,i(Y,X)))).
'P':delta(p(i(i(i(X,'F'),'F'),X))).
'P':delta(p(i(i(X,i(Y,Z)),i(i(X,Y),i(X,Z))))).
