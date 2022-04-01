append(List, List2, NewList).
append([], List2, List2).
append(List, [], List).
append(Head|Tail, List2, NewList):-
append(Tail, List2, NewList).

reverse(List, ReverseList).
reverse([], []).
reverse(Head|Tail, ReverseList):-
append(Tail, ReverseList),
reverse(Tail, ReverseList).

 