% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

:- module('P',[delta/1,model/1,current/1,limit/1,useless/1]).
:- dynamic delta/1.
:- dynamic model/1.
:- dynamic current/1.
:- dynamic weight/2.

delta(p(e,X,X)).
delta(p(g(X),X,e)).
delta(p(X,Y,f(X,Y))).

limit(25).

%p(X,Y,U), p(Y,Z,V), p(U,Z,W) --> p(X,V,W).
p(X,Y,U) :- '$1p/3/1'(1, p(Y1,Z,V), v(X,Y,Y1,U,U1,Z,Z1,V,W)).
p(Y,Z,V) :- '$1p/3/1'(2, p(X,Y1,U), v(X,Y,Y1,U,U1,Z,Z1,V,W)).
p(U,Z,W) :- '$1p/3/1'(3, p(X,Y,U1), v(X,Y,Y1,U,U1,Z,Z1,V,W)).

'$1p/3/1'(1, A2, v(X,Y,Y1,U,U1,Z,Z1,V,W)) :- model(A2), 
	'$1p/3/2'(1, p(U1,Z1,W), v(X,Y,Y1,U,U1,Z,Z1,V,W)).
'$1p/3/1'(2, A1, v(X,Y,Y1,U,U1,Z,Z1,V,W)) :- model(A1), 
	'$1p/3/2'(2, p(U1,Z1,W), v(X,Y,Y1,U,U1,Z,Z1,V,W)).
'$1p/3/1'(3, A1, v(X,Y,Y1,U,U1,Z,Z1,V,W)) :- (model(A1);current(A1)),
	'$1p/3/2'(3, p(Y1,Z1,V), v(X,Y,Y1,U,U1,Z,Z1,V,W)).

'$1p/3/2'(1, A3, Vars) :- model(A3), '$1p/3/3'(Vars).
'$1p/3/2'(2, A3, Vars) :- model(A3), '$1p/3/3'(Vars).
'$1p/3/2'(3, A2, Vars) :- (model(A2);current(A2)), '$1p/3/3'(Vars).

'$1p/3/3'(v(X,Y,Y1,U,U1,Z,Z1,V,W)) :- 
	unify:unify(Y,Y1), unify:unify(U,U1), unify:unify(Z,Z1),
	mgtp:consq(p(X,V,W)).

%p(X,Y,U), p(Y,Z,V), p(X,V,W) --> p(U,Z,W).
p(X,Y,U) :- '$2p/3/1'(1, p(Y1,Z,V), v(X,Y,Y1,U,U1,Z,V,V1,W)).
p(Y,Z,V) :- '$2p/3/1'(2, p(X,Y1,U), v(X,Y,Y1,U,U1,Z,V,V1,W)).
p(X,V,W) :- '$2p/3/1'(3, p(X1,Y,U), v(X,Y,Y1,U,U1,Z,V,V1,W)).

'$2p/3/1'(1, A2, v(X,Y,Y1,U,U1,Z,V,V1,W)) :- model(A2), 
	'$2p/3/2'(1, p(X1,V1,W), v(X,Y,Y1,U,U1,Z,V,V1,W)).
'$2p/3/1'(2, A1, v(X,Y,Y1,U,U1,Z,V,V1,W)) :- model(A1), 
	'$2p/3/2'(2, p(X1,V1,W), v(X,Y,Y1,U,U1,Z,V,V1,W)).
'$2p/3/1'(3, A1, v(X,Y,Y1,U,U1,Z,V,V1,W)) :- (model(A1);current(A1)),
	'$2p/3/2'(3, p(Y1,Z,V), v(X,Y,Y1,U,U1,Z,V,V1,W)).

'$2p/3/2'(1, A3, Vars) :- model(A3), '$1p/3/3'(Vars).
'$2p/3/2'(2, A3, Vars) :- model(A3), '$1p/3/3'(Vars).
'$2p/3/2'(3, A2, Vars) :- (model(A2);current(A2)), '$1p/3/3'(Vars).

'$2p/3/3'(v(X,Y,Y1,U,U1,Z,V,V1,W)) :- 
	unify:unify(Y,Y1), unify:unify(U,U1), unify:unify(V,V1),
	mgtp:consq(p(U,Z,W)).

%%dom(X) --> r(X,X).
delta(r(X,X)).

%r(X,Y) --> r(Y,X).
r(X,Y) :- mgtp:consq(r(Y,X)).

%r(X,Y), r(Y,Z) --> r(X,Z).
r(X,Y) :- '$4r/2/1'(1, r(Y1,Z), v(X,Y,Y1,Z)).
r(Y,Z) :- '$4r/2/1'(2, r(X,Y1), v(X,Y,Y1,Z)).

'$4r/2/1'(1, A2, Vars) :- model(A2), '$4r/2/2'(Vars).
'$4r/2/1'(2, A1, Vars) :- (model(A1);current(A1)), '$4r/2/2'(Vars).

'$4r/2/2'(v(X,Y,Y1,Z)) :- unify:unify(Y,Y1), mgtp:consq(r(X,Z)).

%p(X,Y,U), p(X,Y,V) --> r(U,V).
p(X,Y,U) :- '$5p/3/1'(1, p(X1,Y1,V), v(X,X1,Y,Y1,U,V)).
p(X,Y,V) :- '$5p/3/1'(2, p(X1,Y1,U), v(X,X1,Y,Y1,U,V)).

'$5p/3/1'(1, A2, Vars) :- model(A2), '$5p/3/2'(Vars).
'$5p/3/1'(2, A1, Vars) :- (model(A1);current(A1)), '$5p/3/2'(Vars).

'$5p/3/2'(v(X,X1,Y,Y1,U,V)) :- unify:unify(X,X1), unify:unify(Y,Y1),
	mgtp:consq(r(U,V)).

%r(U,V), p(X,Y,U) --> p(X,Y,V).
r(U,V) :- '$6r/2/1'(1, p(X,Y,U1), v(X,Y,U,U1,V)).
p(X,Y,U) :- '$6r/2/1'(2, r(U1,V), v(X,Y,U,U1,V)).

'$6r/2/1'(1, A2, Vars) :- model(A2), '$6r/2/2'(Vars).
'$6r/2/1'(2, A1, Vars) :- (model(A1);current(A1)), '$6r/2/2'(Vars).

'$6r/2/2'(v(X,Y,U,U1,V)) :- unify:unify(U,U1), mgtp:consq(p(X,Y,V)).

%r(U,V), p(X,U,Y) --> p(X,V,Y).
r(U,V) :- '$7r/2/1'(1, p(X,U1,Y), v(X,Y,U,U1,V)).
p(X,U,Y) :- '$7r/2/1'(2, r(U1,V), v(X,Y,U,U1,V)).

'$7r/2/1'(1, A2, Vars) :- model(A2), '$7r/2/2'(Vars).
'$7r/2/1'(2, A1, Vars) :- (model(A1);current(A1)), '$7r/2/2'(Vars).

'$7r/2/2'(v(X,Y,U,U1,V)) :- unify:unify(U,U1), mgtp:consq(p(X,V,Y)).

%r(U,V), p(U,X,Y) --> p(V,X,Y).
r(U,V) :- '$8r/2/1'(1, p(U1,X,Y), v(X,Y,U,U1,V)).
p(U,X,Y) :- '$8r/2/1'(2, r(U1,V), v(X,Y,U,U1,V)).

'$8r/2/1'(1, A2, Vars) :- model(A2), '$8r/2/2'(Vars).
'$8r/2/1'(2, A1, Vars) :- (model(A1);current(A1)), '$8r/2/2'(Vars).

'$8r/2/2'(v(X,Y,U,U1,V)) :- unify:unify(U,U1), mgtp:consq(p(V,X,Y)).

%%dom(X), r(U,V) --> r(f(X,U),f(X,V)).
%%dom(Y), r(U,V) --> r(f(U,Y),f(V,Y)).
%r(U,V) --> r(f(X,U),f(X,V)).
%r(U,V) --> r(f(U,Y),f(V,Y)).
%r(U,V) --> r(g(U),g(V)).
r(U,V) :- mgtp:consq(r(f(X,U),f(X,V))).
r(U,V) :- mgtp:consq(r(f(U,Y),f(V,Y))).
r(U,V) :- mgtp:consq(r(g(U),g(V))).

%%dom(X) --> p(X,e,X).
%%dom(X) --> p(X,g(X),e).
%true --> p(X,e,X).
%true --> p(X,g(X),e).
delta(p(X,e,X)).
delta(p(X,g(X),e)).

%o(X), o(Y), p(X,g(Y),Z) --> o(Z).
o(X) :- '$9o/1/1'(1, o(Y), v(X,X1,Y,Y1,Z)).
o(Y) :- '$9o/1/1'(2, o(X), v(X,X1,Y,Y1,Z)).
p(X,g(Y),Z) :- '$9o/1/1'(3, o(X1), v(X,X1,Y,Y1,Z)).

'$9o/1/1'(1, A2, v(X,X1,Y,Y1,Z)) :- model(A2), 
	'$9o/1/2'(1, p(X1,g(Y1),Z), v(X,X1,Y,Y1,Z)).
'$9o/1/1'(2, A1, v(X,X1,Y,Y1,Z)) :- model(A1), 
	'$9o/1/2'(2, p(X1,g(Y1),Z), v(X,X1,Y,Y1,Z)).
'$9o/1/1'(3, A1, v(X,X1,Y,Y1,Z)) :- (model(A1);current(A1)),
	'$9o/1/2'(3, o(Y1), v(X,X1,Y,Y1,Z)).

'$9o/1/2'(1, A3, Vars) :- model(A3), '$9o/1/3'(Vars).
'$9o/1/2'(2, A3, Vars) :- model(A3), '$9o/1/3'(Vars).
'$9o/1/2'(3, A2, Vars) :- (model(A2);current(A2)), '$9o/1/3'(Vars).

'$9o/1/3'(v(X,X1,Y,Y1,Z)) :- unify:unify(X,X1), unify:unify(Y,Y1), 
	mgtp:consq(o(Z)).

%o(X), r(X,Y) --> o(Y).
o(X) :- '$10o/1/1'(1, r(X1,Y), v(X,X1,Y)).
r(X,Y) :- '$10o/1/1'(2, o(X1), v(X,X1,Y)).

'$10o/1/1'(1, A2, Vars) :- model(A2), '$10o/1/2'(Vars).
'$10o/1/1'(2, A1, Vars) :- (model(A1);current(A1)), '$10o/1/2'(Vars).

'$10o/1/2'(v(X,X1,Y)) :- unify:unify(X,X1), mgtp:consq(o(Y)).

%true --> o(a).
delta(o(a)).

%o(X) --> o(j(X)).
o(X) :- mgtp:consq(o(j(X))).

%%true --> dom(e).
%%true --> dom(a).
%%dom(X) --> dom(g(X)).
%%dom(X) --> dom(j(X)).
%%dom(X), dom(Y) --> dom(f(X,Y)).
