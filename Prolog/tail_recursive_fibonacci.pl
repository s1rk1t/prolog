%tail recursive fibonacci series
% Chris Aggeles


fib(N, Fib):-
fib_aux(N, 0, 0, 1, Fib).

fib_aux(0, _, _, _, 0).
fib_aux(1, _, _, _, 1).


fib_aux(N, Count, Xsub1, Xsub2, Fib):-
N \= Count,
TempCount is Count + 1,
Ysub1 is Xsub1 + Xsub2,
fib_aux(N, TempCount, Xsub2, Ysub1, Fib).


fib_aux(N, Count, Xsub1, Xsub2, Fib):-
N == Count,
Fib is Xsub1 + Xsub2.