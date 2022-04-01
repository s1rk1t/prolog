f(1).
f(2).
f(3).
f(4).
f(5).
f(6).
f(7).
f(8).
f(9).

solve(Length, Sum, [A, B, C, D, E]):-
Length == 15,
f(A),
f(B),
f(C),
f(D),
f(E),
A \= B,
A \= C,
A \= D, 
A \= E,
B \= C, 
B \= D,
B \= E,
C \= D,
C \= E,
D \= E,
constrain(A, B, C, D, E),
Sum is A + B + C + D + E.

solve(Length, Sum, [X, Y]):-
Length == 2,
f(X),
f(Y),
X \= Y,
Sum is X + Y.

solve(Length, Sum, [X, Y, Z]):-
Length == 3,
f(X),
f(Y),
f(Z),
X \= Y,
X \= Z,
Y \= Z,
Sum is X + Y + Z.

solve(Length, Sum, [X, Y, Z, A]):-
Length == 4,
f(X),
f(Y),
f(Z),
f(A),
X \= Y,
X \= Z,
X \= A,
Y \= Z,
Y \= A,
Z \= A,
Sum is X + Y + Z + A.

solve(Length, Sum, [A, B, C, D, E]):-
Length == 5,
f(A),
f(B),
f(C),
f(D),
f(E),
A \= B,
A \= C,
A \= D, 
A \= E,
B \= C, 
B \= D,
B \= E,
C \= D,
C \= E,
D \= E,
Sum is A + B + C + D + E.

process([X1, X2, X3, X4, X5, X6, X7, X8, X9, X10,
X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,
X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36,X37,
X38,X39,X40,X41,X42,X43,X44,X45,X46,X47,X48,X49,X50,X51,X52,
X53,X54,X55,X56,X57,X58,X59,X60,X61,X62,X63,X64,X65,X66,X67,X68,
X69,X70,X71,X72,X73,X74,X75,X76,X77,X78,X79,X80,X81,X82,X83,X84,X85,
X86,X87,X88,X89,X90,X91,X92]):-

%the board

solve(3, 10, [X1, X2, X3]),
solve(3, 22, [X4, X5, X6]),
solve(3, 15, [X7, X8, X9]),
solve(3, 9, [X10, X11, X12]),
solve(3, 15, [X13, X14, X15]),
solve(3, 21, [X16, X17, X18]),
solve(5, 16, [X19, X20, X21, X22, X23]),
solve(5, 15, [X24,X25,X26,X27,X28]),
solve(3, 7, [X29,X30,X31]),
solve(3, 8, [X32,X33,X34]),
solve(5, 15, [X35, X36, X37, X38, X39]),
solve(5, 26, [X40, X41, X42, X43, X44]),
solve(2, 16, [X45, X46]),
solve(2, 10, [X47, X48]),
solve(5, 25, [X49, X50, X51, X52, X53]),
solve(5, 25, [X54, X55, X56, X57, X58]),
solve(3, 18, [X59, X60, X61]),
solve(3, 9, [X62, X63, X64]),
solve(5, 31, [X65, X66, X67, X68, X69]),
solve(5, 18, [X70, X71, X72, X73, X74]),
solve(3, 7, [X75, X76, X77]),
solve(3, 6, [X78, X79, X80]),
solve(3, 14, [X81, X82, X83]),
solve(3, 8, [X84, X85, X86]),
solve(3, 9, [X87, X88, X89]),
solve(3, 13, [X90, X91, X92]),
solve(3, 10, [X1, X10, X19]),
solve(3, 17, [X35, X45, X49]),
solve(3, 10, [X65, X75, X84]),
solve(3, 9, [X2, X11, X20]),
solve(3, 14, [X36, X46, X50]),
solve(3, 12, [X66, X76, X85]),
solve(5, 17, [X3, X12, X21, X29, X37]),
solve(5, 24, [X51, X59, X67, X77, X86]),
solve(3, 11, [X22, X30, X38]),
solve(3, 21, [X52, X60, X68]),
solve(5, 18, [X4, X13, X23, X31, X39]),
solve(5, 15, [X53, X61, X69, X78, X82]),
solve(2, 17, [X5, X14]),
solve(2, 6, [X79, X88]),
solve(5, 24, [X6, X15, X24, X32, X40]),
solve(5, 15, [X54, X62, X70, X80, X89]),
solve(3, 13, [X25, X33, X41]),
solve(3, 12, [X55, X63, X71]),
solve(5, 16, [X7, X16, X26, X34, X42]),
solve(5, 17, [X56, X64, X72, X81, X90]),
solve(3, 17, [X8, X17, X27]),
solve(3, 19, [X43, X47, X57]),
solve(3, 21, [X73, X82, X91]),
solve(3, 18, [X9, X18, X28]),
solve(3, 8, [X44, X48, X58]),
solve(3, 7, [X74, X83, X92]).

constrain(A, B, C, D, E):-
A =< 5,
A >= 1,
B =< 5,
B >= 1,
C =< 5,
C >= 1,
D =< 5,
D >= 1,
E =< 5,
E >= 1.