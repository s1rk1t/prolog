%intersect

intersect_aux([],_,Result,Result).

intersect_aux([Element|Tail], List2, TempList, IntersectList):-
\+ member(Element, List2),
intersect_aux(Tail, List2, TempList, IntersectList).

intersect_aux([Element|Tail],List2,TempList,IntersectList) :-
member(Element,List2),
\+ member(Element,TempList),
append([Element], TempList, NewList),
intersect_aux(Tail, List2, NewList, IntersectList).

intersect_aux([Element|Tail], List2, TempList, IntersectList):-
member(Element, List2),
member(Element, TempList),
intersect_aux(Tail, List2, TempList, IntersectList).



intersect([],_,[]).
intersect(_,[],[]).

intersect(List1, List2, Result):-
intersect_aux(List1, List2, [], Result).



