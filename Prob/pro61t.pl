% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, i(X1,i(n(i(a,b)),n(b))), v(X,X1)).
%'Pt':p(i(X1,i(n(i(a,b)),n(b)))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(i(n(i(a,b)),n(b))) :- mgtp:proofEnd.

