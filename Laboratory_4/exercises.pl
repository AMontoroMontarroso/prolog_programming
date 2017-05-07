%(1, [nodo(2, [hoja(3)]), nodo(4, [hoja(5)]), nodo(6, [hoja(7)]), nodo(8, [hoja(9)]), nodo(10, [hoja(11)]), nodo(12, [hoja(13)]), nil])
esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

esRosadelfa(nil, 0).
esRosadelfa(hoja(_), 1).
esRosadelfa(nodo(_, Rosadelfas), N) :- esListaRosadelfas(Rosadelfas, M), N is M + 1.

esListaRosadelfas([R], N) :- esRosadelfa(R, N).
esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R, M),
					esListaRosadelfas(Rosadelfas, M2),
					(M > M2 -> N is M; N is M2).

peso(nil, 0).
peso(hoja(_), 1).
peso(nodo(_, Rosadelfas), N) :- pesoListaRosadelfas(Rosadelfas, N1),
				N is N1 + 1.

pesoListaRosadelfas([R], N) :- peso(R, N).
pesoListaRosadelfas([R|Rosadelfas], N) :- peso(R, N1),
					  pesoListaRosadelfas(Rosadelfas, N2), N is N1 + N2.

grado(nil, 0).
grado(hoja(_), 0).
grado(nodo(_, Rosadelfas), N) :- length(Rosadelfas, M1),
				 gradoRosadelfas(Rosadelfas, M2),
				 (M1 > M2 -> N is M1 ; N is M2).

gradoRosadelfas([R], N) :- grado(R, N).
gradoRosadelfas([R|Rosadelfas], N) :- grado(R, M1),
				      gradoRosadelfas(Rosadelfas, M2),
				      (M1 > M2 -> N is M1; N is M2).

frontera(nil, 0).
frontera(hoja(N), [hoja(N)]).
frontera(nodo(_, Rosadelfas), N) :- fronteraRosadelfas(Rosadelfas, N).

fronteraRosadelfas([R], [N]) :- frontera(R, N).
fronteraRosadelfas([R|Rosadelfas], N) :- frontera(R, M1),
					 fronteraRosadelfas(Rosadelfas, M2),
					 append(M1, M2, N).

preorden(nil, [nil]).
preorden(hoja(N), [hoja(N)]).
preorden(nodo(L, Rosadelfas), N) :- preordenRosadelfas(Rosadelfas, M1), append([nodo(L, [])], M1, N).


preordenRosadelfas([R], N) :- preorden(R, N).
preordenRosadelfas([R|Rosadelfas], N) :- preorden(R, M1), preordenRosadelfas(Rosadelfas, M2), append(M1, M2, N).

% construirRosadelfa(L, G, R), construye una rosadelfa R, a partir de los elementos de una lista L.
construirRosadelfa([], _, nil).
construirRosadelfa([X], _, hoja(X)).
construirRosadelfa([X|L], G, nodo(X, [R|Rosadelfas])) :- partir(L, G, [L1|GListas]),
							 construirRosadelfa(L1, G, R),
							 construirRosadelfas(GListas, G, Rosadelfas).

% inspecciona una lista de listas y por cada lista inspeccionada crea una rosadelfa
construirRosadelfas([], _, []).
construirRosadelfas([L|GListas], G, [R|Rosadelfas]) :- construirRosadelfa(L, G, R),
						       construirRosadelfas(GListas, G, Rosadelfas).

% partir(L, G, [L1|GListas]), divide la lista L en una secuencia de listas de longitud
% menor o igual que G, que se devuelve como una lista de listas en el segundo argumento.
partir(L, G, [L]):- length(L,N), N < G.
partir(L, G, [L1|GListas]):- length(L,N), N >= G,
			     A is ceiling(N/G),
			     length(L1,A),
			     append(L1, LL, L),
			     partir(LL, A, GListas).
