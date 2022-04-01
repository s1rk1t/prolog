%Chris Aggeles
%Farmer Problem 

:-dynamic deltaEW/4.
:-write('Type ''go.'' then hit return to run program.').


%move until there aren't any moves left:

go:-
initial(Start),
goal(End),
path(Start,End).


%keep going til it's all done

path(Start, End):-
assertz(visited(Start)),
move(Start, NextMove),
\+ wrongMove(NextMove),
\+ visited(NextMove),
path(NextMove,End).

path(End, End):-
print_data,
write('All finished!').


%farmer and goose move:

move(deltaEW(X, Fo, X, Gr), deltaEW(Y, Fo, Y, Gr)):-
bankToBank(X,Y).


%the farmer moves:

move(deltaEW(X, Fo, Go, Gr), deltaEW(Y, Fo, Go, Gr)):-
bankToBank(X, Y).

%farmer and fox move:

move(deltaEW(X, X, Go, Gr), deltaEW(Y, Y, Go, Gr)):-
bankToBank(X, Y).


%farmer and grain move:

move(deltaEW(X, Fo, Go, X), deltaEW(Y, Fo, Go, Y)):-
bankToBank(X, Y).

%binary operator

bankToBank(east, west).
bankToBank(west, east).

%get log

print_data:-
write('Farm, Fox, Goos, Grain'),
nl,	
visited(deltaEW(A,B,C,D)), 
output(A,B,C,D),
nl,
fail.

print_data.

output(A, B, C, D):-
write(A),
write('  '),
write(B),
write('  '),
write(C),
write('  '),
write(D).


%what not to do

wrongMove(deltaEW(east, west, west, _)).

wrongMove(deltaEW(west, east, east, _)).

wrongMove(deltaEW(east, east, west, west)).

wrongMove(deltaEW(west, west, east, east)).


%let's get this party started!

initial(deltaEW(west, west, west, west)).
goal(deltaEW(east,east, east, east)).

