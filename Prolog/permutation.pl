%permutate
%Chris Aggeles




%append element to permutated list


%asserts elements in list to knowledge base

createMembers([Head|Tail]):-
assert(member(Head)),
createMembers(Tail).

createMembers([]).




%removes a designated member from a given list and returns a list without the member

remove_member_from_list(Member, Member, []).

remove_member_from_list([], List, List).

remove_member_from_list(Member, [Head|Tail], Tail):-
Member == Head.

remove_member_from_list(Member, [Head|Tail], [Head|RestOfList]):-
Member \== Head,
remove_member_from_list(Member, Tail, RestOfList).





%gets the list's members

get_list_members([], []).

get_list_members([Head|_], Head).

get_list_members([_|Tail], X):-
get_list_members(Tail, X).



%return the permutated list

return_list([], []).

return_list(List, PermutatedList):-

get_list_members(List, X),

remove_member_from_list(X, List, ListWithElementRemoved),

permutate_list(X, ListWithElementRemoved, PermutatedList).


permutate_list(List, [], List).

permutate_list(X, List, PermutatedList):-
get_list_members(List, Y),
remove_member_from_list(Y, List, NewList)
append([X], [Y], Appended),
permutate_list(Appended, NewList, PermutatedList).



 




%this is where the list will be entered into the program to be processed

process(List):-
createMembers(List),
permutateList(List, X),
write(X).



