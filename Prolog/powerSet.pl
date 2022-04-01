%power set
%Chris Aggeles

%for all members, take some member of a list and remove it, then append what's left to the power set,
%then do this recursively for the list without the element.



%removes a designated member from a given list and returns a list without the member

remove_X_from_list(X, X, []).

remove_X_from_list([], List, List).

remove_X_from_list(X, [Head|Tail], Tail):-
X == Head.

remove_X_from_list(X, [Head|Tail], [Head|RestOfList]):-
X \== Head,
remove_X_from_list(X, Tail, RestOfList).



go(List, PowerSet):-
go_aux(List, [], PowerSet).

go_aux([], PowerSet, PowerSet).

go_aux(List, TempList, PowerSet):-
member(X, List),
remove_X_from_list(X, List, ListWithoutX),
go_aux(ListWithoutX, [List|TempList], PowerSet).







