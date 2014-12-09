% ending condition at the top of the file
% we always want to check if the last step can be applied
move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has)).
% defintion of climb action
move(state(P, onfloor, P, H), climb, state(P, onbox, P, H)).
% definition of pushing action
move(state(P1, onfloor, P1, H), push(P1, P2), state(P2, onfloor, P2, H)).
% definition of walking action
move(state(P1, onfloor, B, H), walk(P1, P2), state(P2, onfloor, B, H)).
% check if we can get to has banana
canget(state(_,_,_,has)).
canget(State1) :- move(State1, Move, State2), canget(State2).



