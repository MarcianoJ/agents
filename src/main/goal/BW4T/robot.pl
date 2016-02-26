:-dynamic at/1,			% matches the at/1 percept
	atBlock/1,			% matches the atBlock/1 percept
	block/2,			% a belief that indicates which block is in what room
	color/2,			% matches the color/2 percept
	holding/1,			% matches the holding/1 percept
	in/1,				% matches the in/1 percept
	sequence/1,			% matches the sequence/1 percept
	sequenceIndex/1,	% matches the sequenceIndex/1 percept
	state/1,			% matches the state/1 percept
	visited/1,			% a belief that marks a room as visited when leaving it
	zone/5.				% matches the zone/5 percept

% A room is a place with exactly one neighbour, i.e., there is only one way to get to and from that place.
room(PlaceID) :- zone(_,PlaceID,_,_,Neighbours), length(Neighbours,1).

% Exercise 2.2: insert a definition of the predicate "nextColorInSeq(Color)".
