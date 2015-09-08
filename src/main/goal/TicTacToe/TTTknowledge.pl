:- dynamic(pos/2). % pos(Position, content) contains the board contents. 
:- dynamic(turn/1). % name of the player who has the turn.

% pos/1: pos(Pos) is true if Pos is in the range 1 to 9 where these numbers
% denote the corresponding square in Table \ref{table:nrtictactoe}.
pos(Pos) :- between(1, 9, Pos).

free(Pos) :- pos(Pos, empty).
free(List, Pos) :- member(Pos, List), pos(Pos,empty).


% definitions for 'corner', 'center', 'edge', and 'line'.
% A line is a diagonal, row, or column.
corner(1). corner(3). corner(7). corner(9). center(5).
% edge(2). edge(4). edge(6). edge(8).
line(A, B, C) :- pos(A), pos(B), pos(C), B is A+1, C is B+1, 0 is C mod 3.
line(A, B, C) :- pos(A), pos(B), pos(C), B is A+3, C is B+3.
line(1, 5, 9). line(3, 5, 7).
% a line is winning if all squares are occupied by me (player/1)
winning_line(Player,A,B,C) :- me(P), line(A, B, C), pos(A, P), pos(B, P), pos(C, P).
% a winning move can be made if there are already two squares occupied by me
% and the third one in line is still free.
winning_move(Player, Pos) :- line(A, B, C), pos(A, Pa), pos(B, Pb), pos(C, Pc),
	count([Pa,Pb,Pc], Player, 2), free([A, B, C], Pos).
% a possible winning combination consists of a line where only one position has been occupied by player
possible_winning_move(Player, [A, B, C], Pos) :- line(A, B, C), pos(A, Pa), pos(B, Pb), pos(C, Pc),
	count([Pa,Pb,Pc], Player, 1), count([Pa,Pb,Pc], empty, 2), free([A, B, C], Pos).
% a fork consists of two *different* lines which both have possible winning moves
fork(Player, Pos) :- possible_winning_move(Player, [A, B, C], Pos),
	possible_winning_move(Player, [D, E, F], Pos), intersection([A, B, C], [D, E, F], L), not(length(L, 3)).

% helper functions
count([], A, 0).
count([A|T], A, C) :- count(T, A, TC), C is TC+1.
count([B|T], A, C) :- not(A=B), count(T, A, C).
% my opponent is the player that I am not
% (i.e. if I am playing O's, then my opponent is playing X's, and vice versa.)
opponent(Opponent) :- agent(Opponent), not(me(Opponent)).
