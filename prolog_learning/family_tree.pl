female(jasmina).
female(alicja).
parent(alicja, jasmina).
parent(alicja, jasiek).
parent(piotr, jasmina).
parent(piotr, jasiek).
parent(apollonia, alicja).


different(X,X) :- !,fail.
different(_,_).

offspring(Y,X) :- parent(X,Y).
mother(x,Y) :- parent(X,Y), female(X).
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), different(X,Y).

predecessor(X,Z) :- parent(X,Z).
predecessor(X,Z) :- parent(X,Y), predecessor(Y,Z).
