% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('Pt',[]).

%p(X) :- '$p/1'(1, o(n(X1),o(n(o(n(o(n(a),b)),o(c,o(d,e)))),o(n(o(n(d),a)),o(c,o(e,a))))), v(X,X1)).
%p(o(n(X1),o(n(o(n(o(n(a),b)),o(c,o(d,e)))),o(n(o(n(d),a)),o(c,o(e,a)))))) :- '$p/1'(2, X, v(X,X1)).
p(o(n(o(n(o(n(a),b)),o(c,o(d,e)))),o(n(o(n(d),a)),o(c,o(e,a))))) :-
	mgtp:proofEnd.

'$p/1'(1, A2, Vars) :- 'P':model(p(A2)), '$p/2'(1,Vars).
'$p/1'(1, A2, Vars) :- 'P':current(p(A2)), '$p/2'(1,Vars).
'$p/1'(1, A2, Vars) :- 'P':delta(p(A2)), '$p/2'(1,Vars).
'$p/1'(2, A2, Vars) :- 'P':model(p(A2)), '$p/2'(2,Vars).
'$p/1'(2, A2, Vars) :- 'P':current(p(A2)), '$p/2'(2,Vars).
'$p/1'(2, A2, Vars) :- 'P':delta(p(A2)), '$p/2'(2,Vars).

'$p/2'(1, v(X,X1)) :- unify:unify(X,X1), mgtp:proofEnd.
'$p/2'(2, v(X,X1)) :- unify:unify(X,X1), mgtp:proofEnd.
