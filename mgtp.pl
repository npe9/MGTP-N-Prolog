% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module(mgtp,[do/0,consq/1,weight/2,
	proofEnd/0,init/0,countData/2,printData/1]).

do :- fromD(X), !, do1(X).

do1(X) :- 'P':X.
do1(X) :- moveDtoM, !, do.

fromD(X) :- retract('P':delta(X)), 
%%	copy_term(X,Xc), numbervars(Xc,0,_), format("~nFrom D ~q~n",[Xc]), %%%
%%% trace %%%	format("pickup: ~q~n",[X]),
	assertz('P':current(X)).

moveDtoM :- 
	retract('P':current(X)), 
	asserta('P':model(X)). % Otter Order
%%%	assertz('P':model(X)). % MGTP Order
	%%% Have to change pro*.pl file
moveDtoM.

%consq(C) :- weight(C,W), 'P':limit(L), W > L, !, fail.
%consq(C) :- 'P':useless(C), !, fail.
consq(C) :- forward(C), !, fail.
%consq(C) :- backward(C).
consq(C) :- assertz('P':delta(C)), %%%  
%%% trace %%%	assertz('P':delta(C),Ref), 
%%% trace %%%	clause('P':delta(Cc),_,Ref), 
%%% trace %%%	numbervars(Cc,0,_), 
%%% trace %%%	format("~q: ~q~n",[Ref,Cc]), 
	'Pt':C.

weight(T,N) :- weight(T, 0,N).

weight(T, M,N) :- (var(T);atomic(T)), !, N is M+1.
weight(T, M,N) :- functor(T,F,A), M1 is M+1, weightArg(A, T,M1,N).

weightArg(0, T,M,M) :- !.
weightArg(A, T,M,N) :- arg(A,T,Ta), weight(Ta, M,M1), !,
	A1 is A-1,
	weightArg(A1, T,M1,N).

forward(C) :- numbervars(C,0,_), forward1(C).

forward1(C) :- 'P':model(C), !.
forward1(C) :- 'P':current(C), !.
forward1(C) :- 'P':delta(C), !.

backward(C) :- copy_term(C,Cc), backward(C,Cc).

backward(C,Cc) :- clause('P':model(C),_,Ref),
	clause('P':model(M),_,Ref),
	subsumes_chk(Cc, M),
	erase(Ref),
%%%	format("Backward ~q: ~q~n",[Ref,M]), 
	fail.
backward(C,Cc) :- clause('P':current(C),_,Ref),
	clause('P':current(M),_,Ref),
	subsumes_chk(Cc, M),
	erase(Ref),
%%%	format("Backward ~q: ~q~n",[Ref,M]), 
	fail.
backward(C,Cc) :- clause('P':delta(C),_,Ref),
	clause('P':delta(M),_,Ref),
	subsumes_chk(Cc, M),
	erase(Ref),
%%%	format("Backward ~q: ~q~n",[Ref,M]), 
	fail.

proofEnd :- format("Succeed~n",[]).

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
