% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1).

:- dynamic 'P':delta/1.

'P':delta(p(i(X,i(n(X),Y)))).
'P':delta(p(i(X,i(Y,X)))).
'P':delta(p(i(i(X,i(Y,Z)),i(Y,i(X,Z))))).
'P':delta(p(i(i(X,Y),i(i(Z,X),i(Z,Y))))).
'P':delta(p(i(i(X,Y),i(i(n(X),Y),Y)))).
