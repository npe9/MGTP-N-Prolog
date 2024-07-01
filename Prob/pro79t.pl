% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro69t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, e(X1,e(e(a,b),e(c,e(e(b,c),a)))), v(X,X1)).
%'Pt':p(e(X1,e(e(a,b),e(c,e(e(b,c),a))))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(e(e(a,b),e(c,e(e(b,c),a)))) :- mgtp:proofEnd.

