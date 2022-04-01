% Chris Aggeles


% And away we go!

:-write('Please type ''start'' and press return to begin the game!').
:-read(X).
:-check(X).
:-initVar(W1, W2, W3, W4, E1, E2, E3, E4).
:-initWrite(W1, W2, W3, W4, E1, E2, E3, E4).
:-run(W1, W2, W3, W4, E1, E2, E3, E4).



% 'check' is essentially a biconditional for 'start' being entered 

check(X):-

	/+ X == 'start',
	write('Please try again, and type ''start'' in all lower case, then press return to begin!'),
	read(Y),
	check(Y).
	
check(X).



% initialize variables and print out starting positions

initVar(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-

Efarmer = 'Y   ',
Efox = 'Y   ',
Egoose = 'Y   ',
Egrain = 'Y   ',
Wfarmer = 'N   ',
Wfox = 'N   ',
Wgoose = 'N   ',
Wgrain = 'N   ', 

initWrite(Wfarmer, Wfox, Wgoose, Wgrain, Efarmer, Efox, Egoose, Egrain):-
write('Efa ', 'Efo ', 'Ego ', 'Egr ', 'Wfa ', 'Wfo ', 'Wgo ', 'Wgr '),
nl,
write(Wfarmer, Wfox, Wgoose, Wgrain, Efarmer, Efox, Egoose, Egrain).


% meat and potatoes

run(EFa, EFo, EGo, EGr, WFa, WFo, WGo, WGr),:-

move(EFa, EFo, EGo, EGr, WFa, WFo, WGo, WGr ),
write('EFa ', 'EFo ', 'EGo ', 'EGr ', 'WFa ', 'WFo ', 'WGo ', 'WGr '),
nl,nl,
write(EFa, EFo, EGo, EGr, WFa, WFo, WGo, WGr),
isWin(EFa, EFo, EGo, EGr, WFa,WFo, WGo, WGr ).


%check for a winning condition

isWin(EFa, EFo, EGo, EGr, WFa, WFo, WGo, WGr):-

WFa == 'Y   ',
WFo == 'Y   ',
WGo == 'Y   ',
WGr == 'Y   ',
write('Game Over!), nl, write('Would you like to play again? If yes, type ''yes'' and press return.),
nl, write('If no, type anything else and press return.),
read(X).

isWin(EFa, EFo, EGo, EGr, WFa, WFo, WGo, WGr ):-
run(EFa, EFo, EGo, WFa, WFo, WGo, WGr).



% only one legal starting move

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'Y   ',
Efox == 'Y   ',
Egoose == 'Y   ',
Egrain == 'Y   ',
Wfarmer = 'Y   ',
Wgoose = 'Y   ',
Efarmer = 'N   ',
Egoose = 'N   '.

% only one logical move next, too

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'N   ',
Efox == 'Y   ',
Egoose == 'N   ',
Egrain == 'Y   ',
Efarmer = 'Y   ',
Wfarmer = 'N   '.

% logic branches here

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'Y   ',
Efox == 'Y   ',
Egoose == 'N   ',
Egrain == 'Y   ',
Wfarmer = 'Y   ',
Wfox = 'Y   ',
Efarmer = 'N   ',
Efox = 'N   '.

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'Y   ',
Efox == 'Y   ',
Egoose == 'N   ',
Egrain == 'Y   ',
Wfarmer = 'Y   ',
Wgrain = 'Y   ',
Efarmer = 'N   ',
Egrain = 'N   '.

% next round of logic

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'N   ',
Efox == 'Y   ',
Egoose == 'N   ',
Egrain == 'N   ',
Efarmer = 'Y   ',
Egoose = 'Y   ',
Wfarmer = 'N   ',
Wgoose = 'N   '.

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'N   ',
Efox == 'N   ',
Egoose == 'N   ',
Egrain == 'Y   ',
Efarmer = 'Y   ',
Egoose = 'Y   ',
Wfarmer = 'N   ',
Wgoose = 'N   '.

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'Y   ',
Efox == 'N   ',
Egoose == 'Y   ',
Egrain == 'Y   ',
Efarmer = 'N   ',
Egrain = 'N   ',
Wfarmer = 'Y   ',
Wgrain = 'Y   '.


move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'N   ',
Efox == 'N   ',
Egoose == 'Y   ',
Egrain == 'N   ',
Efarmer = 'Y   ',
Wfarmer = 'N   '.


% once again

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'Y   ',
Efox == 'Y   ',
Egoose == 'Y   ',
Egrain == 'N   ',
Efarmer = 'N   ',
Efox = 'N   ',
Wfarmer = 'Y   ',
Wfox = 'Y   '.


% easier just to finish the line of logic to the end

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'N   ',
Efox == 'N   ',
Egoose == 'Y   ',
Egrain == 'N   ',
Efarmer = 'Y   ',
Wfarmer = 'N   '.

move(Efarmer, Efox, Egoose, Egrain, Wfarmer, Wfox, Wgoose, Wgrain):-
Efarmer == 'Y   ',
Efox == 'N   ',
Egoose == 'Y   ',
Egrain == 'N   ',
Wfarmer = 'Y   ',
Wgoose = 'Y   ',
Efarmer = 'N   ',
Egoose = 'N   '.








 