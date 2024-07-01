% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, i(X1,i(i(a,b),i(i(b,c),i(a,c)))), v(X,X1)).
%'Pt':p(i(X1,i(i(a,b),i(i(b,c),i(a,c))))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(i(i(a,b),i(i(b,c),i(a,c)))) :- mgtp:proofEnd.

