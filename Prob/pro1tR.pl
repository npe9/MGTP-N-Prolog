% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('Pt',[]).

p(X) :- '$p/1'(1, i(X1,i(i(a,i(b,c)),i(b,i(a,c)))), v(X,X1)).
p(i(X1,i(i(a,i(b,c)),i(b,i(a,c))))) :- '$p/1'(2, X, v(X,X1)).
%p(i(i(a,i(b,c)),i(b,i(a,c)))) :- mgtp:proofEnd.

%T'$p/1'(1, A2, Vars) :- 'P':model(p(A2)), '$p/2'(1,Vars).
%T'$p/1'(1, A2, Vars) :- 'P':current(p(A2)), '$p/2'(1,Vars).
%T'$p/1'(1, A2, Vars) :- 'P':delta(p(A2)), '$p/2'(1,Vars).
%T'$p/1'(2, A2, Vars) :- 'P':model(p(A2)), '$p/2'(2,Vars).
%T'$p/1'(2, A2, Vars) :- 'P':current(p(A2)), '$p/2'(2,Vars).
%T'$p/1'(2, A2, Vars) :- 'P':delta(p(A2)), '$p/2'(2,Vars).

'$p/1'(1, A2, Vars) :- recorded(model,p(A2),_), '$p/2'(1,Vars).
'$p/1'(1, A2, Vars) :- recorded(current,p(A2),_), '$p/2'(1,Vars).
'$p/1'(1, A2, Vars) :- recorded(delta,p(A2),_), '$p/2'(1,Vars).
'$p/1'(2, A2, Vars) :- recorded(model,p(A2),_), '$p/2'(2,Vars).
'$p/1'(2, A2, Vars) :- recorded(current,p(A2),_), '$p/2'(2,Vars).
'$p/1'(2, A2, Vars) :- recorded(delta,p(A2),_), '$p/2'(2,Vars).

'$p/2'(1, v(X,X1)) :- unify:unify(X,X1), mgtp:proofEnd.
'$p/2'(2, v(X,X1)) :- unify:unify(X,X1), mgtp:proofEnd.
