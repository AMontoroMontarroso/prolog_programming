sustituye(_, _, [], []).
sustituye(X, Y, [X|Tail], [Y|L2]) :- sustituye(X, Y, Tail, L2).
sustituye(X, Y, [Z|Tail], [Z|L2]) :- sustituye(X, Y, Tail, L2).

aplanar([], []).
aplanar([Head1|Tail1], [Head1|Tail2]) :- atom(Head1), aplanar(Tail1, Tail2).
aplanar([Head1|Tail1], List) :- aplanar(Head1, H1), aplanar(Tail1, Tail2), append(H1, Tail2, List).

igualesElem(L1, L2) :- length(L1, X), length(L2, X), iElem(L1, L2).

iElem([],[]).
iElem([X|XS], Y) :- member(X, Y), memberSubstitute(X, Y, NewY), iElem(XS, NewY).

memberSubstitute(_, [], []).
memberSubstitute(X, [X|Tail], Tail).
memberSubstitute(X, [Z|Tail], NewList) :- memberSubstitute(X, Tail, L2), append([Z], L2, NewList).

descomponer(Val, A, B) :- between(0, Val, A), between(A, Val, B), Val is A + B.

numBrandreth(N,C) :- between(32,99,N), between(1000,9999, C), L=C//100,R=mod(C,100),N*N =:= C, L+R=:=N.
