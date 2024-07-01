% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module(mgtp,[do/0,consq/1,weight/2,
	forward/1,proofEnd/0,init/0,countData/2,printData/1]).

:- dynamic tm/2, model/2, delta/2.

do :- initDelta, fail.
do :- do1.

initDelta :- clause('P':delta(C),_),
	tm:add_term_node(C,ID),
	assertz(delta(C,ID),Ref), 
	assertz(tm(ID,Ref)),
	fail.

do1 :- fromD(X), !, 
	('P':X -> true;
	    moveDtoM, !, do1).

fromD(X) :- delta(X,_).

moveDtoM :- retract(delta(X,ID)),
	retract(tm(ID,_)),
	asserta(model(X,ID),Ref),
	assertz(tm(ID,Ref)).

consq(C) :- weight(C,W), 'P':limit(L), W > L, !, fail.
consq(C) :- 'P':useless(C), !, fail.
consq(C) :- subsume(C), !, fail.
consq(C) :- tm:add_term_node(C,ID), !,
	assertz(delta(C,ID),Ref), 
	assertz(tm(ID,Ref)),
	'Pt':C.

weight(T,N) :- weight(T, 0,N).

weight(T, M,N) :- (var(T);atomic(T)), !, N is M+1.
weight(T, M,N) :- functor(T,F,A), M1 is M+1, weightArg(A, T,M1,N).

weightArg(0, T,M,M) :- !.
weightArg(A, T,M,N) :- arg(A,T,Ta), weight(Ta, M,M1), 
	A1 is A-1,
	weightArg(A1, T,M1,N).

subsume(C) :- tm:generalization_term_node(C,ID),
	clause(tm(ID,Ref),_),
	clause(GC,_,Ref),
	subsume(GC,C).

subsume(model(GC,_), C) :- subsumes_chk(GC,C).
subsume(delta(GC,_), C) :- subsumes_chk(GC,C).

proofEnd :- format("Succeed~n",[]).

init :- retractall(model(X,Y)), retractall(delta(X,Y)),
	tm:init_term_memory.

countData(F,N) :- recordz('$MyConuter',0,Ref), fail.
countData(F,N) :- Fact =.. [F,X,Y], clause(Fact,_),
	recorded('$MyConuter',Cnt,Ref), erase(Ref),
	Cnt1 is Cnt+1,
	recordz('$MyConuter',Cnt1,Ref), fail.
countData(F,N) :- recorded('$MyConuter',N,Ref), erase(Ref).

printData(F) :- Fact =.. [F,X,Y], clause(Fact,_,Ref),
	numbervars(X,0,_),
	format("~q ~q~n",[Ref,X]), fail.
