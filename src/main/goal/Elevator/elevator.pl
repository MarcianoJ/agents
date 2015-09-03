:- dynamic(atFloor/1).
:- dynamic(dir/1).
:- dynamic(fButtonOn/2). 
:- dynamic(doorState/1).

onRoute(Level, Dir) :- atFloor(Here), dir(Dir), Diff is Level-Here, (Diff<0 -> Dir=down; Dir=up).