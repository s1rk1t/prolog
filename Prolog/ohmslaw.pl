%Ohm's law calculator
%Chris Aggeles


%assumes knowledge of at least two out of three of the following: (V=IR)
%where V is voltage in Volts, I is intensity in Amperes and R is resistance in Ohms.
:-write('Please type ''ohmslaw(V, I, R).'', where V is voltage in Volts,'),
nl,
write('I is intensity (current) in Amperes, and R is resistance in Ohms,'),
nl,
write('making sure to type the variable''s name when you don''t know it''s value.'),
nl,
write('For example: ohmslaw(3, 4, R) will return the resistance'),
nl,
write('for a voltage of 3 Volts and intensity of 4 Amps. Enjoy!').



ohmslaw(V, I, R):-
var(V),
nonvar(I),
nonvar(R),
V is I * R.

ohmslaw(V, I , R):-
nonvar(V),
var(I),
vnonvar(R),
I is V/R.

ohmslaw(V, I, R):-
nonvar(V),
nonvar(I),
var(R),
R is V/I.


