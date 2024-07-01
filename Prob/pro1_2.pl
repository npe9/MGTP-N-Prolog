% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('P',[limit/1,useless/1]).

:- A = p(i(X,i(Y,X))), recordz(delta(A),A,_).
:- A = p(i(i(X,i(Y,Z)),i(i(X,Y),i(X,Z)))), recordz(delta(A),A,_).
:- A = p(i(n(n(X)),X)), recordz(delta(A),A,_).
:- A = p(i(X,n(n(X)))), recordz(delta(A),A,_).
:- A = p(i(i(X,Y),i(n(Y),n(X)))), recordz(delta(A),A,_).

limit(25).

p(X) :- copy_term(X,Xc), '$p/1'(3, X,Xc).
p(i(X1,Y)) :- '$p/1'(2, X, v(X,X1,Y)).
p(X) :- '$p/1'(1, i(X1,Y), v(X,X1,Y)).

'$p/1'(1, A2, Vars) :- X = p(A2), recorded(model(X),X,_), '$p/2'(1,Vars).
'$p/1'(2, A2, Vars) :- X = p(A2), recorded(model(X),X,_), '$p/2'(2,Vars).
'$p/1'(3, X, Xc) :- '$p/2'(3, Xc, v(X,X1,Y)).

'$p/2'(1, v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).
'$p/2'(2, v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).
'$p/2'(3, i(X1,Y), v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).

useless(i(X,Y)) :- X == Y, !.
useless(X) :- nonvar(X), functor(X,F,A), uselessArg(A, X).

uselessArg(A, X) :- arg(A,X,Fa),
	uselessArg(Fa, A,X).

uselessArg(Fa, A,X) :- useless(Fa), !.
uselessArg(Fa, A,X) :- A1 is A-1, uselessArg(A1, X).
