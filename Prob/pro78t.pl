% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, e(X1,e(e(a,e(b,c)),e(c,e(a,b)))), v(X,X1)).
%'Pt':p(e(X1,e(e(a,e(b,c)),e(c,e(a,b))))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(e(e(a,e(b,c)),e(c,e(a,b)))) :- mgtp:proofEnd.

