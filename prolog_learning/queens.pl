del(X,[X|L],L).
del(X,[A|L],[A|L1]):- del(X,L,L1).

insert(X, L1, P) :- del(X,P,L1).

permutation([],[]).
permutation([X|L], P) :- permutation(L,L1), insert(X,L1,P).

solution(Queens) :- permutation([1,2,3,4,5,6,7,8], Queens), safe(Queens).

safe([]).
safe([Queen|Others]) :- safe(Others), noattacks(Queen, Others, 1).

noattacks(_,[],_).
noattacks(Y,[Y1|Ylist], Xdist) :- 
	Y1 - Y =\= Xdist, 
	Y - Y1  =\= Xdist, 
	Dist1 is Xdist + 1, 
	noattacks(Y, Ylist, Dist1).