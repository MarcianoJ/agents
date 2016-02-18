:-dynamic state/1, in/1, zone/5.

:-dynamic ownId/1.    % our BW4T ID.

:-dynamic associate/2.%associated GOAL agent name to BW4T ID.

% A room is a place with exactly one neighbour, i.e., there is only one way to get to and from that place.
room(PlaceID) :- zone(_,PlaceID,_,_,Neighbours), length(Neighbours,1).

% Exercise 2.2: insert a definition of the predicate "nextColorInSeq(Color)".

% Exercise 2.5 + 2.6: (optional) if needed, insert additional knowledge here.
