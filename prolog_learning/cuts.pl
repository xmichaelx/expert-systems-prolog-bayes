max(X,Y,X) :- X >= Y,!.
max(X,Y,Y).
% add element to list without duplication
% if X is member of L then cut, otherwise prepend
add(X,L,L) :- member(X, L),!.
add(X, L,[X|L]).
% negation as failure, Frodo likes all jewellery except rings
jewellery(goblet).
ring(nenya).
likes(frodo, X) :- ring(X), !, fail.
likes(frodo, X) :- jewellery(X).

different(X,X) :- !, fail.
different(X,Y).

quicksort([],[]).

quicksort([X|Tail], sorted) :-
	split(X, Tail, Small, Big),
	quicksort(Small, SortedSmall),
	quicksort(Big, SortedBig),
	conc(SortedSmall, [X|SortedBig], Sorted).

% more splitting