member(X,[X|_]).
member(X, [_|Tail]) :- member(X, Tail).

conc([],L,L).
conc([X|L1], L2, [X|L3]) :- conc(L1,L2, L3).
% S is a sublist of L if we can put a list L1 before it and L3 after it
sublist(S,L) :- conc(L1,L2,L), conc(S,L3,L2).
% deleting item form head of the list is easy
delete(X,[X|L],L).
% we recursively delve deeper until our item will be at the head of sublist
delete(X,[A|L],[A|L1]):- delete(X,L,L1).
% insert is an inverse of delete
insert(X, L1, P) :- delete(X,P,L1).
% empty list is its own permutation
permutation([],[]).
% ok, how this works?
permutation([X|L], P) :- permutation(L,L1), insert(X,L1,P).
% permutation(L, [X|P]) :- delete(X,L,L1),permutation(L1,P).
% add at the beggining
add(X,L,[X|L]).
% delete all occurences
% nothing to delete from a single list
delMember(_, [], []).
% we found something to delete, but we keep on searching
delMember(X, [X|Xs], Y) :- delMember(X, Xs, Y),!.
% nothing found keep, searching
delMember(X, [T|Xs], [T|Y]) :-  delMember(X, Xs, Y).
% prolog is doing depth first search among the subgoals