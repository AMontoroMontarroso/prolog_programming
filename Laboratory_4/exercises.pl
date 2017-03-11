% esRosadelfa(O), el objeto O es una rosadelfa.
esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

esRosadelfa(nil, 0).
esRosadelfa(hoja(_), 1).
esRosadelfa(nodo(_, Rosadelfas), N) :- esListaRosadelfas(Rosadelfas, M), N is M + 1.

esListaRosadelfas([R], N) :- esRosadelfa(R, N).
esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R, M), esListaRosadelfas(Rosadelfas, M2), (M > M2 -> N is M; N is M2).

peso(nil, 0).
peso(hoja(_), 1).
peso(nodo(_, Rosadelfas), N) :- pesoListaRosadelfas(Rosadelfas, N1), N is N1 + 1.

pesoListaRosadelfas([R], N) :- peso(R, N).
pesoListaRosadelfas([R|Rosadelfas], N) :- peso(R, N1), pesoListaRosadelfas(Rosadelfas, N2), N is N1 + N2.
