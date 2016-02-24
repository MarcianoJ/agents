% The use of the 'maintain' predicate ensures that the goal will never be dropped.
on(a,b), on(b,c), on(c,table), on(d,e), on(e,f), on(f,table), maintain.
% on(a,b) on(b,c), on(c,table).
% on(a,b), on(b,c), on(c,d), on(d,table).
% on(d,c), on(c,b), on(b,a), on(a,table).
% on(a,b), on(b,table).
% on(a,b), on(b,c), on(c,table), on(d,e), on(e,f), on(f,table).
% on(a,b), on(b,c), on(c,d), on(d,table), on(e,f), on(f,g), on(g,table), on(h,i), on(i,j), on(j,table).