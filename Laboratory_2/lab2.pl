%LABORATORIO 2

%--Ejercicio4
sus(_,_,[],[]).
sus(X,Y,[X|L1],[Y|L2]):-
  X\=Y,
  sus(X,Y,L1,[Y|L1]),
  sus(X,Y,L1,L2).
