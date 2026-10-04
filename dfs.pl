% --- PROGRAM DATA ---
connected(a, b).
connected(a, c).
connected(b, d).
connected(b, e).
connected(c, f).
connected(c, g).
connected(d, h).
connected(e, h).
connected(g, h).
connected(a, h).

% --- DEPTH FIRST SEARCH ---
dfs(Start, Goal, Path) :-
    search(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

% Base case: destination reached
search(Goal, Goal, Visited, Visited).

% Recursive case: find next unvisited neighbor
search(Node, Goal, Visited, Path) :-
    connected(Node, Next),
    \+ member(Next, Visited),
    search(Next, Goal, [Next | Visited], Path).

% --- QUERY EXAMPLE ---
% ?- dfs(a, d, Path).