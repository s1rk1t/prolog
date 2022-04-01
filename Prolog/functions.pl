%cool_delete_all

cool_delete_all(Ele, [Ele|Tail], Tail).
    
cool_delete_all(Ele, [First, Head|Tail], [First|NewList]) :-
cool_delete_all(Ele, [Head|Tail], NewList).


cool_delete_all(Ele, [[Head|Tail]|Rest], [TempList|Rest]):-
cool_delete_all(Ele, [Head], HeadList),
cool_delete_all(Ele, [Tail], TailList),
append(HeadList, TailList, TempList).

%cool reverse

cool_rev([],[]).

cool_rev([Head|Tail],Reversed):- 
cool_rev(Tail,RevTail), 
append(RevTail,[Head],Reversed). 

cool_rev([[Head|Tail]|Rest], Reversed):-
cool_rev(Tail, RevTail),
append(RevTail, [Head], NewList),
append([Rest], NewList, Reversed).







%permutations

perms([], []).

perms(Head|Tail, List):-
perms(Tail, TailList),
append([Head], TailList, List).










		
		
		