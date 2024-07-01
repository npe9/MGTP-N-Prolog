% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('Pt',[]).

p(X) :- '$p/1'(1, e(X1,e(e(e(a,e(b,c)),c),e(b,a))), v(X,X1)).
p(e(X1,e(e(e(a,e(b,c)),c),e(b,a)))) :- '$p/1'(2, X, v(X,X1)).

'$p/1'(1, A2, Vars) :- 'P':model(p(A2)), '$p/2'(1,Vars).
'$p/1'(1, A2, Vars) :- 'P':current(p(A2)), '$p/2'(1,Vars).
'$p/1'(1, A2, Vars) :- 'P':delta(p(A2)), '$p/2'(1,Vars).
'$p/1'(2, A2, Vars) :- 'P':model(p(A2)), '$p/2'(2,Vars).
'$p/1'(2, A2, Vars) :- 'P':current(p(A2)), '$p/2'(2,Vars).
'$p/1'(2, A2, Vars) :- 'P':delta(p(A2)), '$p/2'(2,Vars).

'$p/2'(1, v(X,X1)) :- unify:unify(X,X1), mgtp:proofEnd.
'$p/2'(2, v(X,X1)) :- unify:unify(X,X1), mgtp:proofEnd.
