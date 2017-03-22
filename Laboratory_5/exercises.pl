speedup(S, G1, G2) :- getCPUTime(G1, T1), getCPUTime(G2, T2), S is T2 / T1.

getCPUTime(G, T) :- T1 is cputime, call(G), T2 is cputime, T is T2 - T1.

invertir1([],[]).
invertir1([H|T],L) :- invertir1(T,Z), append(Z,[H],L).

invertir2(L,I) :- inv(L, [], I).
inv([], I, I).
inv([X|R], A, I) :- inv(R, [X|A], I).

randomNumbers(0, []).
randomNumbers(C, Y) :- C > 0,
		       C1 is C-1,
		       random(1, 10, U),
		       Y = [U|T],
		       randomNumbers(C1, T).

ej18(S) :- randomNumbers(3000, List), speedup(S, invertir2(List, _), invertir1(List, _)).


longitud1([],0).
longitud1([_|T],N) :- longitud1(T,Z), N is Z +1.

longitud2(List, N) :- longitudAcc(List, N, 0).

longitudAcc([], N, N).
longitudAcc([_|Tail], V, Acc) :- M is Acc + 1, longitudAcc(Tail, V, M).

ej19Part1(S) :- randomNumbers(3000, List), speedup(S, longitud2(List, _), longitud1(List, _)).

ej19Part2(S) :- randomNumbers(3000, List), speedup(S, longitud2(List, _), length(List, _)).

suma1([],0).
suma1([H|T],N) :- suma1(T,Z), N is Z +H.


suma2(List, N) :- sumaAcc(List, N, 0).
sumaAcc([], N, N).
sumaAcc([Head|Tail], N, Acc) :- M is Acc + Head, sumaAcc(Tail, N, M).

ej20(S) :- randomNumbers(3000, List), speedup(S, suma2(List, _), suma1(List, _)).


fib(1,1).
fib(2,1).
fib(N,F) :- N>2,
	    H1 is N-1,
	    H2 is N-2,
	    fib(H1,F1),
	    fib(H2,F2),
	    F is F1+F2.

fib2(1, 1).
fib2(2, 1).
fib2(N, Res) :- M is N-2, fibAcc(M, 1, 1, Res).

fibAcc(0, _, Res, Res).
fibAcc(N, Acc1, Acc2, Res) :- Acc3 is Acc2 + Acc1,
			      M is N-1,
			      fibAcc(M, Acc2, Acc3, Res).

ej21(S) :- N is 20, speedup(S, fib2(N, _), fib(N, _)).
