%animals
%the key objective of this program is to allow for an animal to be queried
%then, if the animal is not present, ask for it's characteristics and store those in kb for 
%reference. It does this once then returns the user to terminal prompt.
%Wider, more sophisticated predicates that combine characteristics
%are certainly possible and adding animals to the database is a relatively simple task.
%a later version might just take in the word instead of the number. 
%Chris Aggeles


:-dynamic animal/11.


%this prompts the user for various charctersitics for their animal

get_animal_characteristics(A, B, C, D, E, F, G, H, I, J):-

write('Please choose from one of the following characteristics below,'),
nl,
write(' by entering the number, then a period, then enter:'),
nl,
nl,
write('1) Hair  2) Scales  3) Invertebrate  4) Feathers  5) Swims'),
nl,
read(A),
nl,
write('Please choose another one of the following characteristics:'),
nl,
nl,
write('6) No Legs  7) Two Legs 8) Four Legs  9) Six Legs  10) Eight Legs'),
nl,
read(B),
nl,
write('Please choose the color of your animal:'),
nl,
nl,
write('11) Black  12) Brown 13) Gray  14) White  15) Multi-colored'),
nl,
write('16) Striped  17) Spotted  18) Varies'),
nl,
read(C),
nl,
write('Please choose how your animal eats:'),
nl,
nl,
write('19) Ungulate  20) Carnivore  21) Baleen  22) Herbivore'),
nl,
write('23) Insectivore  24) Omnivore'),
nl,
read(D),
nl,
write('Does your animal fly? Please enter 25 for yes or 26 for no:'),
nl,
read(E),
nl,
write('Does your animal give birth, or lay eggs? Please enter 27 for birth, or 28 for eggs:'),
nl,
read(F),
nl,
write('Does your animal have long legs (greater than a meter)? Please enter 29 for yes, or 30 for no:'),
nl,
read(G),
nl,
write('Does your animal have a long neck (greater than 1 foot)? Please enter 31 for yes, or 32 for no:'),
nl,
read(H),
nl,
write('Is your animal typically bigger than 2 meters? Enter 33 for yes, or 34 for no:'),
nl,
read(I),
nl,
write('Does your animal have pointed teeth (mandibles and tusks count)? Enter 35 for yes, or 36 for no:'),
nl,
read(J),
nl.


%this is where I've added the various choices for the animals, and write statements
%to print out the characteristics when I need to access them

animal_data(1):-
write('This animal has hair.').

animal_data(2):-
write('This animal has scales').

animal_data(3):-
write('This animal is an invertebrate.').

animal_data(4):-
write('This animal has feathers.').

animal_data(5):-
write('This animal swims.').

animal_data(6):-
write('This animal has no legs.').

animal_data(7):-
write('This enimal has two legs.').

animal_data(8):-
write('This animal has four legs.').

animal_data(9):-
write('This animal has six legs.').

animal_data(10):-
write('This animal has eight legs.').

animal_data(11):-
write('This animal is black.').

animal_data(12):-
write('This animal is brown.').

animal_data(13):-
write('This animal is gray.').

animal_data(14):-
write('This animal is white.').

animal_data(15):-
write('This animal is multi-colored.').

animal_data(16):-
write('This animal is striped.').

animal_data(17):-
write('This animal is spotted.').

animal_data(18):-
write('This animal''s color varies.').

animal_data(19):-
write('This animal is an ungulate.').

animal_data(20):-
write('This animal is a carnivore.').

animal_data(21):-
write('This animal filters food with baleen.').

animal_data(22):-
write('This animal is an herbivore.').

animal_data(23):-
write('This animal is an insectivore.').

animal_data(24):-
write('This animal is an omnivore.').

animal_data(25):-
write('This animal flies.').

animal_data(26):-
write('This animal does not fly.').

animal_data(27):-
write('This animal gives live birth.').

animal_data(28):-
write('This animal lays eggs.').

animal_data(29):- 
write('This animal has long legs.').

animal_data(30):-
write('This animal doesn''t have long legs.').

animal_data(31):-
write('This animal has a long neck.').

animal_data(32):-
write('This animal doesn''t have a long neck.').

animal_data(33):- 
write('This animal is typically bigger than 2 meters in size.').

animal_data(34):-
write('This animal is typically smaller than 2 meters.').

animal_data(35):-
write('This animal has pointed teeth.').

animal_data(36):-
write('This animal doesn''t have pointed teeth.').

check_mammal(A, F):-
A == 1,
F == 27,
write('This animal is a mammal').

check_reptile(A, F):-
A == 2,
F == 28,
write('This animal is a reptile.').



%this predicate takes the instantiated animal data and prints it out for the specified animal:'X'


describe_animal(X, A, B, C, D, E, F, G, H, I, J):-
write('Your animal is a '),
write(X),
nl,
write('It has the following characteristics: '),
nl,
nl,
animal_data(A),
nl,
animal_data(B),
nl,
animal_data(C),
nl,
animal_data(D),
nl,
animal_data(E),
nl,
animal_data(F),
nl,
animal_data(G),
nl,
animal_data(H),
nl,
animal_data(I),
nl,
animal_data(J),
nl,
check_mammal(A, F),
check_reptile(A, F),
header.






%here's where the data for the animals in the database are stored

animal(great_white, 5, 6, 13, 20, 26, 27, 30, 32, 33, 35).
animal(clown_fish, 5, 6, 15, 24, 26, 28, 30, 32, 34, 36).
animal(whale, 5, 6, 18, 21, 26, 27, 30, 32, 33, 36).
animal(tiger, 1, 8, 16, 20, 26, 27, 30, 32, 33, 35).
animal(horse, 1, 8, 18, 22, 26, 27, 30, 31, 33, 36).
animal(elephant, 1, 8, 13, 22, 26, 27, 29, 32, 33, 35).
animal(dog, 1, 8, 18, 24, 26, 27, 30, 32, 34, 35).
animal(snake, 2, 6, 18, 24, 26, 28, 30, 31, 34, 35).
animal(iguana, 2, 8, 15, 22, 26, 28, 30, 32, 34, 36).
animal(turtle, 2, 18, 22, 26, 28, 30, 32, 34, 36).
animal(butterfly, 3, 9, 15, 22, 25, 28, 30, 32, 34, 36).
animal(beetle, 3, 9, 18, 24, 25, 28, 30, 32, 34, 35).
animal(ant, 3, 9, 18, 22, 26, 28, 30, 32, 34, 35).
animal(penguin, 4, 7, 15, 20, 26, 28, 30, 32, 34, 36).
animal(albatross, 4, 7, 14, 20, 25, 28, 30, 32, 34, 36).
animal(robin, 4, 7, 18, 23, 25, 28, 30, 32, 34, 36).

%default if the animal is not known

animal_check(X, A, B, C, D, E, F, G, H, I, J):-
\+ (animal(X, _, _, _, _, _, _, _, _, _, _)),
nl,nl,
write('I don''t know that animal!'),
nl,
write('Please tell me it''s characteristics!'),
nl,
nl,
get_animal_characteristics(A, B, C, D, E, F, G, H, I, J),
assert(animal(X, A, B, C, D, E, F, G, H, I, J)),
nl,
nl,
header.

%necessary to prevent failure

animal_check(_,_,_,_,_,_,_,_,_,_,_).




%First screen of the animal database. This is called once a new animal has been entered,
%or a known animal has been described.

header:-
nl,
write('Welcome to the animal database!'),
nl,
nl,
write('Please enter the name of your animal using all lower case,'),
nl,
write('followed by a period, then press return.'),
nl,
nl,
write('Note: Use the underscore character if a space is necessary (ex: blue_whale).'),
nl,
read(X),
animal_check(X, A, B, C, D, E, F, G, H, I, J),
animal(X, A, B, C, D, E, F, G, H, I, J),
describe_animal(X, A, B, C, D, E, F, G, H, I, J),
nl,
header.


:-header.













