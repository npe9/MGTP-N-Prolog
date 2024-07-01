% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1).

:- dynamic 'P':delta/1.

'P':delta(p(i(i(i(X,Y),Z),i(Y,Z)))).
'P':delta(p(i(i(i(X,Y),Z),i(n(X),Z)))).
'P':delta(p(i(i(X,i(n(Y),Z)),i(X,i(i(U,Z),i(i(Y,U),Z)))))).
