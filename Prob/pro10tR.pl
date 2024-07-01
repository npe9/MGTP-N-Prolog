% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1tR).

'Pt':p(X) :- 'Pt':'$p/1'(1, i(X1,i(a,i(i(a,b),b))), v(X,X1)).
'Pt':p(i(X1,i(a,i(i(a,b),b)))) :- 'Pt':'$p/1'(2, X, v(X,X1)).
%'Pt':p(i(a,i(i(a,b),b))) :- mgtp:proofEnd.

