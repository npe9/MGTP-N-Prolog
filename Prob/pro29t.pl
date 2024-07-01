% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, i(X1,i(i(n(a),a),a)), v(X,X1)).
%'Pt':p(i(X1,i(i(n(a),a),a))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(i(i(n(a),a),a)) :- mgtp:proofEnd.

