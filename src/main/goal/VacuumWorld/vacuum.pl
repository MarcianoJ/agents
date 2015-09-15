possiblemove(left).
possiblemove(right).
possiblemove(back).
possiblemove(forward).

% we can't see backwards. We assume it's free. May cause occasional bumps.
square(back,empty).

% contents of squares that we can't go to.
obstruction(vac). % a bot is there
obstruction(obstacle).
