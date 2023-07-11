:- use_module(library(clpfd)).

main(Count):-
    open("../Data/4.txt", read, Stream),
    % read(Stream, List);
    read_lines(Stream, Lines),
    close(Stream),
    inclusions(Lines, Count).

read_lines(Stream, []) :-
    at_end_of_stream(Stream).
    
read_lines(Stream, [Numbers|RemainingNumbers]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, RawLine),
    split_string(RawLine, ",-", "", Line),
    maplist(number_string, Numbers, Line),
    read_lines(Stream, RemainingNumbers).

inclusions([], 0).

inclusions([Numbers|RemainingNumbers], Count) :-
    contains(Numbers),
    inclusions(RemainingNumbers, TailCount),
    Count #= TailCount + 1.
    
inclusions([_|RemainingNumbers], Count) :-
    inclusions(RemainingNumbers, Count).

contains([A, B, C, D]) :-
    A =< C, 
    B >= D.

contains([A, B, C, D]) :-
    C =< A, 
    D >= B.