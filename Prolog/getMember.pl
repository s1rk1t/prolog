getMember([], []).
getMember([Head|Tail], Head):-
getMember(Tail, Newmember).