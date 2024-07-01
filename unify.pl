% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module(unify,[unify/2]).

unify(X,Y) :- var(X), !, unifyVar(X,Y).
unify(X,Y) :- var(Y), !, unifyVar(Y,X).
unify(X,Y) :- functor(X,F,A), functor(Y,F,A), unifyArg(A, X,Y).

unifyArg(0, X,Y).
unifyArg(N, X,Y) :- arg(N,X,Xn), arg(N,Y,Yn),
	unify(Xn,Yn), !,
	N1 is N-1,
	unifyArg(N1, X,Y).

unifyVar(X,Y) :- var(Y), !, X = Y.
unifyVar(X,Y) :- notOccursIn(X,Y), !, X = Y.

notOccursIn(X,Y) :- var(Y), !, X \== Y.
notOccursIn(X,Y) :- atomic(Y), !.
notOccursIn(X,Y) :- functor(Y,F,A), notOccursInArg(A, X,Y).

notOccursInArg(0, X,Y).
notOccursInArg(N, X,Y) :- arg(N,Y,Yn),
	notOccursIn(X,Yn), !,
	N1 is N-1,
	notOccursInArg(N1, X,Y).


