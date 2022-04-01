go:-

list(List),
process(List),
output(List).

list([f(X1), f(X2), f(X3)]).

process([f(X1), f(X2), f(X3)]):-
across(10, f(X1), f(X2), f(X3)).


across(X, f(X1), f(X2), f(X3)):-
X1 = X - X2 - X3,
X2 = X - X1 - X3,
X3 = X - X1 - X2.

output(Head|Tail):-
write(Head),
output(Tail).

outpu([]).

f(1).
f(2).
f(3).
f(4).
f(5).
f(6).
f(7).
f(8).
f(9).

:-go.