% Base Case: An empty list flattens to an empty list.
flatten_list([], []).

% Case 1: The head (H) is a list. Recursive flattening of both head and tail.
flatten_list([H|T], FlatList) :-
    is_list(H),
    flatten_list(H, NewH),
    flatten_list(T, NewT),
    append(NewH, NewT, FlatList).

% Case 2: The head (H) is an element. Keep it and flatten the remaining tail.
flatten_list([H|T], [H|FlatList]) :-
    \+ is_list(H),
    flatten_list(T, FlatList).