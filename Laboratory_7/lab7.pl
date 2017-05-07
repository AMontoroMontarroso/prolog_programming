%EJERCICIO 27
ficha(H):-
	H=..[X|Xs],
	write(X),
	write(':'),
	body(Xs,1).
body([],_).
body([X|Xs],R):-
	atom(X),nl,tab(R*8),
	write(X),
	write(','),
	body(Xs,R),!.
	body([X|Xs],R):-
	number(X),nl,tab(R*8),
	write(X),
	write(','),
	body(Xs,R).
body([X|Xs],R):-
	compound(X),
	X=..[Y|Ys],nl,tab(R*8),
	stars(R),
	write(Y),
	write(':'),
	H is R+1,
	body(Ys,H),
	body(Xs,R).

stars(R):- R=0,write(' ').
stars(R):- R>0,write('*'),R1 is R-1, stars(R1).

%EJERCICIO 28

unific_a(X,Y):-
	X=Y,!,
	true
	;
	false.

unific_b(X,Y):-atom(X);number(X);var(X), atom(Y);number(Y);var(Y),X=Y,!.
unific_b([],[]).
unific_b(X,Y) :-
	compound(X),compound(Y),
	X=..[L,LL],
	not(ocur(X,[L|LL])), not(ocur(Y,[L,LL])),!, X=Y,
	true
	;
	false.

ocur(X,[Y|Ys]):- X==Y, ocur(X=Ys).

%EJERCICIO 29

%Predicados auxiliares
sum1(X,Y,S):- S is X+Y.
mult(X,Y,P):- P is X*Y.

%Apartado a
reduce([],_,Base,Base).
reduce([X|Xs],Func,Base,Result):-
  reduce(Xs,Func,Base,Raux),
  apply(Func,[X,Raux,Result]).

%Apartado b
sumList([],0).
sumList(List,Suma):-
  reduce(List,sum1,0,Suma).

%Apartado c
multList([],0).
multList(List,Prod):-
  reduce(List,mult,1,Prod).