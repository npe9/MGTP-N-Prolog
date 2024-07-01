% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module(mgtp,[do/0,consq/1,weight/2,
	proofEnd/0,init/0,countData/2,printData/1]).

do :- fromD(X), !, do1(X).

do1(X) :- 'P':X.
do1(X) :- moveDtoM, !, do.

fromD(X) :- recorded(delta(_),X,Ref), erase(Ref),
	recordz(current,X,_).

moveDtoM :- 
	recorded(current,X,Ref), !, erase(Ref), recorda(model(X),X,_).
moveDtoM.

consq(C) :- weight(C,W), 'P':limit(L), W > L, !, fail.
consq(C) :- 'P':useless(C), !, fail.
consq(C) :- forward(C), !, fail.
%consq(C) :- backward(C).
consq(C) :- recordz(delta(C),C,_), 
	'Pt':C.

weight(T,N) :- weight(T, 0,N).

weight(T, M,N) :- (var(T);atomic(T)), !, N is M+1.
weight(T, M,N) :- functor(T,F,A), M1 is M+1, weightArg(A, T,M1,N).

weightArg(0, T,M,M) :- !.
weightArg(A, T,M,N) :- arg(A,T,Ta), weight(Ta, M,M1), !,
	A1 is A-1,
	weightArg(A1, T,M1,N).

forward(C) :- numbervars(C,0,_), forward1(C).

forward1(C) :- recorded(model(C),C,_), !.
forward1(C) :- recorded(current(C),C,_), !.
forward1(C) :- recorded(delta(C),C,_), !.

backward(C) :- copy_term(C,Cc), backward(C,Cc).

backward(C,Cc) :- clause(model(C),C,Ref),
	instance(Ref,M),
	subsumes_chk(Cc, M),
	erase(Ref),
	fail.
backward(C,Cc) :- clause(current(C),C,Ref),
	instance(Ref,M),
	subsumes_chk(Cc, M),
	erase(Ref),
	fail.
backward(C,Cc) :- clause(delta(C),C,Ref),
	instance(Ref,M),
	subsumes_chk(Cc, M),
	erase(Ref),
	fail.

proofEnd :- format("Succeed~n",[]).

init :- recorded(_,_,Ref), erase(Ref), fail.

countData(F,N) :- recordz('$MyConuter',0,Ref), fail.
countData(F,N) :- Fact =.. [F,X], recorded(Fact,_,_),
	recorded('$MyConuter',Cnt,Ref), erase(Ref),
	Cnt1 is Cnt+1,
	recordz('$MyConuter',Cnt1,Ref), fail.
countData(F,N) :- recorded('$MyConuter',N,Ref), erase(Ref).

printData(F) :- Fact =.. [F,X], recorded(Fact,Y,Ref),
	numbervars(Y,0,_),
	format("~q ~q~n",[Ref,Y]), fail.
