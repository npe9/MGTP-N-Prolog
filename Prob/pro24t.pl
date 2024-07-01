% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- compile(pro1t).

%'Pt':p(X) :- 'Pt':'$p/1'(1, i(X1,i(i(i(i(i(a,b),i(n(c),n(d))),c),e),i(i(e,a),i(d,a)))), v(X,X1)).
%'Pt':p(i(X1,i(i(i(i(i(a,b),i(n(c),n(d))),c),e),i(i(e,a),i(d,a))))) :- 'Pt':'$p/1'(2, X, v(X,X1)).

'Pt':p(i(i(i(i(i(a,b),i(n(c),n(d))),c),e),i(i(e,a),i(d,a)))) :- mgtp:proofEnd.

