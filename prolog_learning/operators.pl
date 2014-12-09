equal(X,Y) :- X =:= Y.
gcd(X, 0, X):- !.
gcd(0, X, X):- !.
gcd(X, Y, D):- X =< Y, !, Z is Y - X, gcd(X, Z, D).
gcd(X, Y, D):- gcd(Y, X, D).

len([],0).
len([_|Tail], N) :- len(Tail, N1), N is 1 + N1.
