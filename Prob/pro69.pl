% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('P',[delta/1,model/1,current/1,limit/1,useless/1]).
:- dynamic delta/1.
:- dynamic model/1.
:- dynamic current/1.
:- dynamic weight/2.

delta(p(e(e(X,Y),e(Y,X)))).
delta(p(e(e(e(X,Y),Z),e(X,e(Y,Z))))).

limit(25).

p(X) :- copy_term(X,Xc), '$p/1'(3, X,Xc).
p(e(X1,Y)) :- '$p/1'(2, X, v(X,X1,Y)).
p(X) :- '$p/1'(1, e(X1,Y), v(X,X1,Y)).

%p(X) :- '$p/1'(1, e(X1,Y), v(X,X1,Y)).
%p(e(X1,Y)) :- '$p/1'(2, X, v(X,X1,Y)).
%p(X) :- copy_term(X,Xc), '$p/1'(3, X,Xc).

'$p/1'(1, A2, Vars) :- model(p(A2)), '$p/2'(1,Vars).
'$p/1'(2, A2, Vars) :- model(p(A2)), '$p/2'(2,Vars).
'$p/1'(3, X, Xc) :- '$p/2'(3, Xc, v(X,X1,Y)).

'$p/2'(1, v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).
'$p/2'(2, v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).
'$p/2'(3, e(X1,Y), v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(p(Y)).

useless(p(e(X,Y))) :- !, (useless1(X); useless1(Y)).
useless(X) :- useless1(X).

useless1(e(X,Y)) :- X == Y, !.
useless1(X) :- nonvar(X), functor(X,F,A), useless1Arg(A, X).

useless1Arg(A, X) :- arg(A,X,Fa),
	useless1Arg(Fa, A,X).

useless1Arg(Fa, A,X) :- useless1(Fa), !.
useless1Arg(Fa, A,X) :- A1 is A-1, useless1Arg(A1, X).
