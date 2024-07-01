% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module(mgtp,[do/0]).

init :- recorded(model,C,Ref), erase(Ref), fail.
init :- recorded(current,C,Ref), erase(Ref), fail.
init :- recorded(delta,C,Ref), erase(Ref), fail.
init :- 'P':delta(C), recordz(delta,C,_), fail.
init.

do :- fromD(X), !, do1(X).

do1(X) :- 'P':X.
do1(X) :- moveDtoM, !, do.

fromD(X) :- %Tretract('P':delta(X)), 
	recorded(delta,X,Ref), erase(Ref),
%%	copy_term(X,Xc), numbervars(Xc,0,_), format("~nFrom D ~q~n",[Xc]), %%%
%T	assertz('P':current(X)).
	recordz(current,X,_).

moveDtoM :- 
%T	retract('P':current(X)), 
	recorded(current,X,Ref),  erase(Ref),
%T	asserta('P':model(X)). % Otter Order
	recorda(model,X,_). % Otter Order
%%%	assertz('P':model(X)). % MGTP Order
moveDtoM.

%consq(C) :- weight(C,W), 'P':limit(L), W > L, !, fail.
%consq(C) :- 'P':useless(C), !, fail.
consq(C) :- forward(C), !, fail.
consq(C) :- %Tassertz('P':delta(C)), %%% 
	recordz(delta,C,_),
%%%	assertz('P':delta(C),Ref), 
%%%	clause('P':delta(Cc),_,Ref), 
%%%	numbervars(Cc,0,_), 
%%%	format("~q: ~q~n",[Ref,Cc]), 
	'Pt':C.

forward(C) :- numbervars(C,0,_), forward1(C).

%Tforward1(C) :- 'P':model(C), !.
%Tforward1(C) :- 'P':current(C), !.
%Tforward1(C) :- 'P':delta(C), !.
forward1(C) :- recorded(model,C,_), !.
forward1(C) :- recorded(current,C,_), !.
forward1(C) :- recorded(delta,C,_), !.

proofEnd :- format("Succeed~n",[]).

%init :- retractall('P':model(X)), fail.
%init :-	retractall('P':current(X)), fail.
%init :-	retractall('P':delta(X)).

countData(F,N) :- recordz('$MyConuter',0,Ref), fail.
countData(F,N) :-  recorded(F,_,_),
	recorded('$MyConuter',Cnt,Ref), erase(Ref),
	Cnt1 is Cnt+1,
	recordz('$MyConuter',Cnt1,Ref), fail.
countData(F,N) :- recorded('$MyConuter',N,Ref), erase(Ref).

printData(F) :- recorded(F,C,Ref),
	numbervars(C,0,_),
	format("~q ~q~n",[Ref,C]), fail.
