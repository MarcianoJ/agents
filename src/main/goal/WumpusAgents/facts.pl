:- dynamic(wumpusIsAlive/0).
:- dynamic(insideCave/0).

outsideCave :- not(insideCave).
