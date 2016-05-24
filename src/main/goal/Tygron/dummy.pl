
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic lands/1.
:- dynamic buildings/1.
:- dynamic requests/1.
:- dynamic offeredLand/0.
:- dynamic soldLand/0.

% we have a building if the building list has at least 1 element.
havebuilding :- buildings([X|Y]).
