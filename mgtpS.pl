% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module(mgtp,[do/0,consq/1,weight/2,
	proofEnd/0,init/0,countData/2,printData/1]).

do :- prepro.
do :- do1.

do1 :- fromD(X), !, do1(X).

prepro :- clause('P':delta(X),_,Ref),
	weight(X,N),
	assertz('P':weight(N,Ref)), % MGTP Order
	fail.

do1(X) :- 'P':X.
do1(X) :- moveDtoM, !, do1.

fromD(X) :- myretract(X), 
%%%	copy_term(X,Xc), numbervars(Xc,0,_), format("~nFrom D ~q~n",[Xc]), %%%
	assertz('P':current(X)).
%fromD(X) :- retract('P':delta(X)), assertz('P':current(X)).

myretract(X) :- min(W,Ref), clause('P':delta(X),_,Ref), 
	erase(Ref), retract('P':weight(W,Ref)).

min(W,Ref) :- 'P':weight(_,_), !, min(1,W,Ref).

min(N,N,Ref) :- 'P':weight(N,Ref), !.
min(N,W,Ref) :- N1 is N+1, min(N1,W,Ref).

%moveDtoM :- retract('P':delta(X)), assertz('P':model(X)). % MGTP Order
moveDtoM :- retract('P':current(X)), asserta('P':model(X)). % Otter Order
moveDtoM.

consq(C) :- weight(C,W), !, consq(C,W).

consq(C,W) :- forward(C,W), !, fail.
consq(C,W) :- backward(C,W).
consq(C,W) :- assertz('P':delta(C),Ref), 
	assertz('P':weight(W,Ref)),
%%%	clause('P':delta(Cc),_,Ref), %%%
%%%	numbervars(Cc,0,_), %%%
%%%	format("~q: ~q~n",[Ref,Cc]), %%%
	'Pt':C.

weight(T,N) :- weight(T, 0,N).

weight(T, M,N) :- (var(T);atomic(T)), !, N is M+1.
weight(T, M,N) :- functor(T,F,A), M1 is M+1, weightArg(A, T,M1,N).

weightArg(0, T,M,M) :- !.
weightArg(A, T,M,N) :- arg(A,T,Ta), weight(Ta, M,M1), !,
	A1 is A-1,
	weightArg(A1, T,M1,N).

forward(C,W) :- numbervars(C,0,_), forward1(C,W).

forward1(C,_) :- 'P':model(C), !.
forward1(C,_) :- 'P':current(C), !.
forward1(C,W) :- 'P':weight(W0,Ref), W >= W0,
	clause('P':delta(C),_,Ref), !.

backward(C,W) :- copy_term(C,Cc), backward(C,Cc,W).

backward(C,Cc,_) :- clause('P':model(C),_,Ref),
	clause('P':model(M),_,Ref),
	subsumes_chk(Cc, M),
	erase(Ref),
%%%	format("Backward ~q: ~q~n",[Ref,M]), %%%
	fail.
backward(C,Cc,_) :- clause('P':current(C),_,Ref),
	clause('P':current(M),_,Ref),
	subsumes_chk(Cc, M),
	erase(Ref),
%%%	format("Backward ~q: ~q~n",[Ref,M]), %%%
	fail.
backward(C,Cc,W) :- clause('P':weight(W0,Ref),_,Ref0), W =< W0,
	clause('P':delta(C),_,Ref),
	clause('P':delta(M),_,Ref),
	subsumes_chk(Cc, M),
	erase(Ref), erase(Ref0),
%%%	format("Backward ~q: ~q~n",[Ref,M]), %%%
	fail.

proofEnd :- format("Succeed~n",[]).

init :- retractall('P':weight(X,Y)), fail.
init :- retractall('P':model(X)), fail.
init :-	retractall('P':current(X)), fail.
init :-	retractall('P':delta(X)).

countData(F,N) :- recordz('$MyConuter',0,Ref), fail.
countData(F,N) :- Fact =.. [F,X], clause('P':Fact,_),
	recorded('$MyConuter',Cnt,Ref), erase(Ref),
	Cnt1 is Cnt+1,
	recordz('$MyConuter',Cnt1,Ref), fail.
countData(F,N) :- recorded('$MyConuter',N,Ref), erase(Ref).

printData(F) :- Fact =.. [F,X], clause('P':Fact,_,Ref),
	numbervars(X,0,_),
	format("~q ~q~n",[Ref,X]), fail.
printData(F) :- Fact =.. [F,X,Y], clause('P':Fact,_,Ref),
	format("~q ~q~n",[Ref,X/Y]), fail.
