%power set
%Chris Aggeles


%to do: list members of list, including empty set
%assert members
%combine each unique element with elements from list not containing element
%combine each combination with another element from list, each time removing element combined from master list
%assert all of these combinations
%spit out all asserted facts

:-dynamic(member/1).


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




%assert all of the elements, including the empty set.


assert_members([]):-
assert(member([])).

assert_members(Head|Tail):-
assert(member(Head)),
assert_members(Tail).




%see if a list contains a member

not_contained([Head|Tail], X):-
X \== Head,
not_contained(Tail, X).

not_contained([], _).



%finds all the combinations

combine_members(X, []):-
assert(member(X)).


combine_members(X, List):-
get_list_members(List, Y),
Y \== [],
append([X],[Y], newPiece),
assert(member(newPiece)). 



%handles creating that final power set from all of the assertions
output([]).

output(PowerSet):-
member(Y),
append([Y], _, TempSet),
output(TempSet, PowerSet).

output([X], PowerSet):-
member(Y),
not_contained(X, Y),
append([X], [Y], PowerSet).

%this combines all the functions and returns the power set

power_set(List, PowerSet):-

assert_members(List),
member(X),
remove_member_from_list(X, List, ListWithoutX),
combine_members(X, ListWithoutX),
output(PowerSet).
 