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

cont(Fichero, Carac, Palab, Lineas) :-
    open(Fichero, read, Str),
    read_file(Str,Lines, Carac, Palab),
    close(Str),
    length(Lines, Lineas),
    write(Lines), nl.

read_file(Stream,[], 0, 0) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L], Chars, Words) :-
    \+ at_end_of_stream(Stream),
    read_line_to_codes(Stream,Codes),
    count_words_and_letters(Codes, C1, W1),
    atom_chars(X, Codes),
    read_file(Stream,L, C2, W2),
    Chars is C1 + C2,
    Words is W1 + W2 + 1,
    !.

count_words_and_letters([C], Chars, Words) :-
    extract_info_char(C, Chars, Words).

count_words_and_letters([C|Tail], Chars, Words) :-
    extract_info_char(C, C1, W1),
    count_words_and_letters(Tail, C2, W2),
    Chars is C1 + C2,
    Words is W1 + W2.

extract_info_char(C, 1, 0) :-
    char_type(C, alnum).
extract_info_char(C, 0, 1) :-
    char_type(C, space).
