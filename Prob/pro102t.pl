% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, e(X1,e(a,e(a,e(e(b,e(c,c)),b)))), v(X,X1)).
%'Pt':p(e(X1,e(a,e(a,e(e(b,e(c,c)),b))))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(e(a,e(a,e(e(b,e(c,c)),b)))) :- mgtp:proofEnd.

