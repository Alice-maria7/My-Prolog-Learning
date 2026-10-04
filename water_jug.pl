% Fill Jug 1
move(C1, _, (X, Y), (C1, Y)) :- X < C1. 

% Fill Jug 2
move(_, C2, (X, Y), (X, C2)) :- Y < C2. 

% Empty Jug 2
move(_, _, (X, Y), (X, 0)) :- Y > 0. 

% Empty Jug 1
move(_, _, (X, Y), (0, Y)) :- X > 0. 

% Pour Jug 2 into Jug 1
move(C1, _, (X, Y), (X1, Y1)) :-
    Y > 0,
    T is X + Y,
    (T > C1 -> X1 = C1, Y1 is T - C1 ; X1 = T, Y1 = 0).

% Pour Jug 1 into Jug 2
move(_, C2, (X, Y), (X1, Y1)) :-
    X > 0,
    T is X + Y,
    (T > C2 -> Y1 = C2, X1 is T - C2 ; Y1 = T, X1 = 0).

% Base case for Depth First Search
search(_, _, Goal, Goal, Visited, Visited) :- !.

% Recursive case for DFS search
search(C1, C2, Goal, State, Visited, Path) :-
    move(C1, C2, State, Next),
    \+ member(Next, Visited),
    search(C1, C2, Goal, Next, [Next | Visited], Path).

% Main predicate to find the path from (0,0) to Goal
find(C1, C2, Goal, Path) :-
    search(C1, C2, Goal, (0, 0), [(0, 0)], RevPath),
    reverse(RevPath, Path).
    