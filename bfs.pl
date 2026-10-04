% --- Facts: connected(Node1, Node2, Cost) ---
connected(a, b, 2).
connected(a, c, 4).
connected(a, d, 2).
connected(b, e, 1).
connected(c, f, 2).
connected(c, g, 2).
connected(d, h, 6).
connected(e, h, 2).
connected(g, h, 1).
connected(a, h, 9).

% --- Breadth-First Search (BFS) Implementation ---

% Base predicate to start the search and reverse the final path
bfs(Start, Goal, Path) :-
    search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

% Base case: If the goal is reached at the head of the current path
search([[Goal | Path] | _], Goal, [Goal | Path]).

% Recursive case: Extend the current path and append new paths to the end of the queue (BFS)
search([[Node | Path] | Paths], Goal, Solution) :-
    extend([Node | Path], NewPaths),
    append(Paths, NewPaths, Paths1),
    search(Paths1, Goal, Solution).

% Generate all valid unvisited neighbor paths
extend([Node | Path], NewPaths) :-
    findall([NewNode, Node | Path],
            (connected(Node, NewNode, _), \+ member(NewNode, [Node | Path])),
            NewPaths).