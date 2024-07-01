% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, e(X1,e(e(e(e(e(a,b),e(a,c)),e(b,c)),d),d)), v(X,X1)).
%'Pt':p(e(X1,e(e(e(e(e(a,b),e(a,c)),e(b,c)),d),d))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(e(e(e(e(e(a,b),e(a,c)),e(b,c)),d),d)) :- mgtp:proofEnd.

