% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro50t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, o(n(X1),o(n(o(n(b),c)),o(n(o(a,b)),o(a,c)))), v(X,X1)).
%'Pt':p(o(n(X1),o(n(o(n(b),c)),o(n(o(a,b)),o(a,c))))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(o(n(o(n(b),c)),o(n(o(a,b)),o(a,c)))) :- mgtp:proofEnd.

