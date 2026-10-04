% Solve the N-Queens problem
solve(N, Solution) :-
    range(1, N, Rows),
    permutation(Rows, Solution),
    safe(Solution),
    write(Solution), nl.

% Generate a list of numbers from Start to End
range(End, End, [End]).
range(Start, End, [Start | Rest]) :-
    Start < End,
    Next is Start + 1,
    range(Next, End, Rest).

% Ensure all queens in the list are safe from each other
safe([]).
safe([Queen | Queens]) :-
    check(Queen, Queens, 1),
    safe(Queens).

% Check that a queen does not attack any remaining queens
check(_, [], _).
check(Q, [Q1 | Queens], Distance) :-
    Q =\= Q1,
    abs(Q - Q1) =\= Distance,
    Next_Distance is Distance + 1,
    check(Q, Queens, Next_Distance).