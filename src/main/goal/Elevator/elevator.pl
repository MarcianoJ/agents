:-dynamic atFloor/1, dir/1, fButtonOn/2, doorState/1.

onRoute(Level, Dir) :- atFloor(Here), dir(Dir), Diff is Level-Here, (Diff<0 -> Dir=down; Dir=up).