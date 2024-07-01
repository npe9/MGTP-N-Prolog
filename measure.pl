% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

go(From,To, Time) :- From > To, !.
go(From,To, Time) :- From =< To, From1 is From+1,
	mgtp:init,
	name(pro,Pro), name(From,N), name(t,T),
	append(Pro,N,ProN), append(ProN,T,ProNT),
	name(ProN0,ProN), name(ProNT0,ProNT),
	compile(ProN0), compile(ProNT0),
	format("~nNow proving ~w~n",[ProN0]),
	gc,
	statistics(runtime,[T1,_]), !,
	time_out(mgtp:do,Time,Result), !,
	statistics(runtime,[T2,_]),
	T3 is T2-T1,
	mgtp:countData(model,Mn), 
	mgtp:countData(current,Cn),
	mgtp:countData(delta,Dn), !,
	go(Result,T3, Mn,Cn,Dn, From1,To,Time).

go(time_out, T, Mn,Cn,Dn, From,To,Time) :-
	format("Time Out ~w (msec)~n",[T]),
	format("M: ~w, D: ~w, (C: ~w), ~n",[Mn,Dn,Cn]),
	go(From,To, Time).
go(success, T, Mn,Cn,Dn, From,To,Time) :-
	format("Proof Completes in ~w (msec)~n",[T]),
	format("M: ~w, D: ~w, (C: ~w), ~n",[Mn,Dn,Cn]),
	go(From,To, Time).

append([], Y,Y).
append([A|X],Y,[A|Z]) :- append(X,Y,Z).
