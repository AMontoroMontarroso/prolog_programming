%EJERCICIO 23
add(X,L,L):-
	member(X,L),!.
add(X,L,[X|L]).

%EJERCICIO 24
diferente_a(X,Y):-
	X=Y,!,
	fail
	;
	true.

diferente_b(X,Y):-
	not(X=Y).

%EJERCICIO 25
cubo:-
	write('Siguiente numero'),
	read(Num),
	procesar(Num).

procesar(Num):-
	Cub is Num*Num*Num,
	write('El cubo de '),
	write(Num),
	write(' es '),
	write(Cub),nl,
	cubo.

cubo_2:-
	repeat,
	write('Siguiente numero'),
	read(Num),
	(Num='Stop',!,write('Yes')
	;
	procesar2(Num),
	fail
	).
procesar2(Num):-
	Cub is Num*Num*Num,
	write('El cubo de '),
	write(Num),
	write(' es '),
	write(Cub),nl.

%EJERCICIO 26

/* Intentar comprender */

