% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('P',[delta/1]).

delta(p(i(X,i(Y,X)))).
delta(p(i(i(X,i(Y,Z)),i(i(X,Y),i(X,Z))))).
delta(p(i(n(n(X)),X))).
delta(p(i(X,n(n(X))))).
delta(p(i(i(X,Y),i(n(Y),n(X))))).

p(X) :- copy_term(X,Xc), '$p/1'(3, X,Xc).
p(i(X1,Y)) :- '$p/1'(2, X, v(X,X1,Y)).
p(X) :- '$p/1'(1, i(X1,Y), v(X,X1,Y)).

'$p/1'(1, A2, Vars) :- recorded(model,p(A2),_), '$p/2'(1,Vars).
'$p/1'(2, A2, Vars) :- recorded(model,p(A2),_), '$p/2'(2,Vars).
'$p/1'(3, X, Xc) :- '$p/2'(3, Xc, v(X,X1,Y)).

'$p/2'(1, v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).
'$p/2'(2, v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).
'$p/2'(3, i(X1,Y), v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).

