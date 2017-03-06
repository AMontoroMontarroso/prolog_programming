%% -- Partir -- %%

partir([N|L], L1, L2) :- divide(N, L, L1, L2).

divide(_, [], [], []).
divide(N, [Head|Tail], [Head|L1], L2) :- Head =< N, divide(N, Tail, L1, L2).
divide(N, [Head|Tail], L1, [Head|L2]) :- Head > N, divide(N, Tail, L1, L2).

%% -- Quicksort -- %%

quicksort([],[]).
quicksort([Head|Tail], ListaOrdenada) :- divide(Head, Tail, L1, L2),
					 quicksort(L1, L1Ordenada),
					 quicksort(L2, L2Ordenada),
					 append(L1Ordenada, [Head|L2Ordenada], ListaOrdenada).

%% -- Mergesort -- %%

mergesort([],[]).
mergesort([X], [X]).
mergesort(List, OrderedList) :- split(List, Left, Right),
				mergesort(Left, OLeft),
				mergesort(Right, ORight),
				merge(OLeft, ORight, OrderedList).

split([], [], []).
split([E], [E], []).
split([First,Second|Tail], [First|L1], [Second|L2]) :- split(Tail, L1, L2).

merge(Elem, [], Elem).
merge([], Elem, Elem).
merge([L|Left], [R|Right], [L|List]) :- L =< R, merge(Left, [R|Right], List).
merge([L|Left], [R|Right], [R|List]) :- L > R, merge([L|Left], Right, List).

%% -- Polinomio -- %%

isInteger(P) :- integer(P).

isVariable(x).
isVariable(N*x) :- integer(N).
isVariable(x**M) :- integer(M).
isVariable(N*x**M) :- integer(N), integer(M).

isPolinomial(P+Q, X, Result) :- eval(P, X, R1), eval(Q, X, R2), Result is R1 + R2.
isPolinomial(P-Q, X, Result) :- eval(P, X, R1), eval(Q, X, R2), Result is R1 - R2.

calc(x, X, R) :- R is X.
calc(N*x, X, R) :- R is N*X.
calc(x**M, X, R) :- R is X**M.
calc(N*x**M, X, R) :- R is N*X**M.

eval(P, _, P) :- isInteger(P).
eval(P, X, R) :- isVariable(P), calc(P, X, R).
eval(P, X, R) :- isPolinomial(P, X, R).

%% -- Derivadas -- %%

d(P, 0) :- isInteger(P).
d(P, R) :- isVariable(P), calcD(P, R).
d(P, R) :- isPolinomialD(P, R).

isPolinomialD(P+Q, R2) :- d(P, R1),
			  d(Q, R2),
			  isInteger(R1),
			  R1 =:= 0.
isPolinomialD(P+Q, R1) :- d(P, R1),
			  d(Q, R2),
			  isInteger(R2),
			  R2 =:= 0.
isPolinomialD(P+Q, R1+R2) :- d(P, R1),
			     d(Q, R2).
isPolinomialD(P-Q, R2) :- d(P, R1),
			  d(Q, R2),
			  isInteger(R1),
			  R1 =:= 0.
isPolinomialD(P-Q, R1) :- d(P, R1),
			  d(Q, R2),
			  isInteger(R2),
			  R2 =:= 0.
isPolinomialD(P-Q, R1-R2) :- d(P, R1),
			     d(Q, R2).

calcD(x, R) :- R is 1.
calcD(N*x, N).
calcD(x**1, x).
calcD(x**M, M*x**F) :- F is M-1.
calcD(N*X**2, F*X) :- F is N * 2.
calcD(N*x**M, F*x**G) :- F is N*M, G is M-1.
