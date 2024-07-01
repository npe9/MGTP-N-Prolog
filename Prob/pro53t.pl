% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro50t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, o(n(X1),o(n(a),o(b,a))), v(X,X1)).
%'Pt':p(o(n(X1),o(n(a),o(b,a)))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(o(n(a),o(b,a))) :- mgtp:proofEnd.



