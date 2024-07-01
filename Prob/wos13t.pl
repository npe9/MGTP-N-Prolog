% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('Pt',[]).

%o(X), p(X,j(X),j(X)), p(j(X),X,j(X)) --> false.

o(X) :- '$11o/1/1'(1, p(X1,j(X2),j(X3)), v(X,X1,X2,X3,X4,X5,X6)).
p(X,j(X1),j(X2)) :- '$11o/1/1'(2, o(X3), v(X,X1,X2,X3,X4,X5,X6)).
p(j(X),X1,j(X2)) :- '$11o/1/1'(3, o(X3), v(X,X1,X2,X3,X4,X5,X6)).

r(_,_) :- fail.

'$11o/1/1'(1, A2, v(X,X1,X2,X3,X4,X5,X6)) :- 
	('P':model(A2);'P':current(A2);'P':delta(A2)),
	'$11o/1/2'(1, p(j(X4),X5,j(X6)), v(X,X1,X2,X3,X4,X5,X6)).
'$11o/1/1'(2, A1, v(X,X1,X2,X3,X4,X5,X6)) :- 
	('P':model(A1);'P':current(A1);'P':delta(A1)),
	'$11o/1/2'(2, p(j(X4),X5,j(X6)), v(X,X1,X2,X3,X4,X5,X6)).
'$11o/1/1'(3, A1, v(X,X1,X2,X3,X4,X5,X6)) :- 
	('P':model(A1);'P':current(A1);'P':delta(A1)),
	'$11o/1/2'(3, p(X4,j(X5),j(X6)), v(X,X1,X2,X3,X4,X5,X6)).

'$11o/1/2'(1, A3, Vars) :- 
	('P':model(A3);'P':current(A3);'P':delta(A3)),
	 '$11o/1/3'(Vars).
'$11o/1/2'(2, A3, Vars) :- 
	('P':model(A3);'P':current(A3);'P':delta(A3)),
	 '$11o/1/3'(Vars).
'$11o/1/2'(3, A2, Vars) :- 
	('P':model(A2);'P':current(A2);'P':delta(A2)),
	 '$11o/1/3'(Vars).

'$11o/1/3'(v(X,X1,X2,X3,X4,X5,X6)) :-
	unify:unify(X,X1), unify:unify(X1,X2),
	unify:unify(X2,X3), unify:unify(X3,X4),
	unify:unify(X4,X5), unify:unify(X5,X6),
	mgtp:proofEnd.

