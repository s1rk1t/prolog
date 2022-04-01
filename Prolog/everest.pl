%everest
%Chris Aggeles


:-dynamic good_path/2.


 

% these will need to be adjusted
initial_position((0,0)).
final_position((100,100)).

% crev(X,Y) is the notation for the crevasses that will be entered into knowledge base at some point

% D is starting direction
% D1 is ending direction

% for D and D1: 1 = north, 2 = east, 3 = south, 4 = west

%facing north

%up three

move(D, D1, (X,Y), (X,Y1)):-
D == 1,
Ytemp is Y + 1,
\+ crev(X, Ytemp),
Ytemp1 is Ytemp + 1,
\+ crev(X, Ytemp1),
Y1 is Ytemp1 + 1,
\+ crev(X, Y1),
D1 = 1.

%up two, right one

move(D, D1, (X,Y), (X1,Y1)):-
D == 1,
Ytemp is Y + 1,
\+ crev(X, Ytemp),
Y1 is Ytemp + 1,
\+ crev(X, Y1),
X1 is X + 1),
\+ crev(X1, Y1),
D1 = 2.

%up two, left one

move(D, D1, (X,Y), (X1,Y1)):-
D == 1,
Ytemp is Y + 1,
\+ crev(X, Ytemp),
Y1 is Ytemp + 1,
\+ crev(X, Y1),
X1 is X + 1,
\+ crev(X1, Y1),
D1 = 4.

%facing east

%right three

move(D, D1, (X,Y),(X1,Y)):-
D == 2,
Xtemp is X + 1,
\+ crev(Xtemp, Y),
Xtemp1 is Xtemp + 1,
\+ crev(Xtemp1, Y),
X1 is Xtemp1 + 1,
\+ crev(X1, Y),
D1 = 2.

%right two, up one

move(D, D1, (X, Y), (X1, Y1)):-
D == 2,
Xtemp is X +1,
\+ crev(Xtemp, Y),
X1 is Xtemp + 1,
\+ crev(X1, Y),
Y1 is Y + 1,
\+ crev(X1, Y1),
D1 = 1.

%right two, down one

move(D, D1, (X,Y), (X1, Y1)):-
D == 2,
Xtemp is X +1,
\+ crev(Xtemp, Y),
X1 is Xtemp + 1,
\+ crev(X1, Y),
Y1 is Y - 1,
\+ crev(X1, Y1),
D1 = 3.

% facing south

% down three

move(D, D1, (X, Y), (X1, Y1)):-
D == 3,
Ytemp is Y - 1,
\+ crev(X, Ytemp),
Ytemp1 is Ytemp - 1,
\+ crev(X, Ytemp1),
Y1 is Ytemp1 - 1,
\+ crev(X, Y1),
D1 = 3.

%down two, right one

move(D, D1, (X, Y), (X1, Y1)):-
D == 3,
Ytemp is Y - 1,
\+ crev(X, Ytemp),
Y1 is Ytemp - 1,
\+ crev(X, Y1),
X1 is X + 1,
\+ crev(X1, Y1),
D1 = 2.

%down two, left one

move(D, D1, (X, Y), (X1, Y1)):-
D == 3,
Ytemp is Y - 1,
\+ crev(X, Ytemp),
Y1 is Ytemp - 1,
\+ crev(X, Y1),
X1 is X - 1,
\+ crev(X1, Y1),
D1 = 4.

%facing west

%left three

move(D, D1, (X,Y),(X1,Y)):-
D == 4,
Xtemp is X - 1,
\+ crev(Xtemp, Y),
Xtemp1 is Xtemp - 1,
\+ crev(Xtemp1, Y),
X1 is Xtemp1 - 1,
\+ crev(X1, Y),
D1 = 4.

%left two, up one

move(D, D1, (X, Y), (X1, Y1)):-
D == 4,
Xtemp is X - 1,
\+ crev(Xtemp, Y),
X1 is Xtemp - 1,
\+ crev(X1, Y),
Y1 is Y + 1,
\+ crev(X1, Y1),
D1 = 1.

%left two, down one

move(D, D1, (X,Y), (X1, Y1)):-
D == 4,
Xtemp is X - 1,
\+ crev(Xtemp, Y),
X1 is Xtemp - 1,
\+ crev(X1, Y),
Y1 is Y - 1,
\+ crev(X1, Y1),
D1 = 3.


%get the path from start to finish and create a list of the moves for reference


path(Direction, Start, Finish, List, Count):-
move(Direction, NewDirection, Start, NextMove),
\+ member(NextMove, List),
NewCount is Count + 1,
append(NextMove, List, TempList),
path(NewDirection, NextMove, Finish, TempList, NewCount).

%this one is supposed to stop the assertion of any paths that try to repeat a move

path(Direction, Start, _, List, _):-
move(Direction, _, Start, NextMove),
member(NextMove, List).

%if you're at the finish line, assert the path into the knowledge base

path(Direction, Finish, _, List, Count):-
\+ good_path(List, Count),
assert(good_path(List, Count)).

%this next one cuts off the flow to the knowledge base once the lists start repeating.

path(Direction, Finish, _, List, Count):-
good_path(List, Count),
!.

%get_all_paths runs through all of the possible start to finish paths 

get_all_paths(Start, Finish):-
path(_, Start, Finish, [], _),
fail.

%default

get_all_paths.

%get_shortest_path compares all the good_path facts and retracts all the ones
%that have a count of moves larger than the quickest path

get_shortest_path(List):-
good_path(List, Count),
good_path(List2, Count2),
Count =< Count2,
retract(good_path(List2, Count2)),
get_shortest_path_aux(List).

get_shortest_path(List):-
good_path(List, Count),
good_path(List2, Count2),
Count2 =< Count,
retract(good_path(List, Count)),
get_shortest_path_aux(List2).

%this breaks any ties in path length

get_shortest_path(List):-
good_path(List, Count),
good_path(List2, Count2),
Count == Count2,
retract(good_path(List, Count)),
get_shortest_path_aux(List2).

%this is for when you only have one path left

get_shortest_path(List):-
good_path(List, _).

%once the shortest path has been found, 
%clear the knowlege base so we can get back home

clear_kb:-
retractall(good_path(X,Y)).


%there are a few predicates here that have no defnition yet. 
%i've been thinking about how to design an algorithm 
%to calculate the base camps and just haven't done the math 


go:-
initial_position(Start),
final_position(Finish),
get_all_paths(Start, Finish),
get_shortest_path(ToSummit),
clear_kb,
initial_position(Finish),
final_position(Start),
get_all_paths(Start, Finish),
get_shortest_path(ToHome)
base_camps(ToSummit, ToHome, CampList),
steps_to_summit(CampList, ToSummit, ToHome, StepsList),
write(StepsList).





