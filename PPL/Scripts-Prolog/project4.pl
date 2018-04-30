
/* start */
and([],true).
and([false|T], false).
and([true|T], R) :- and(T,R).

or([],false).
or([true|T], true).
or([false|T], R) :- or(T,R); R = false.

not(true, false).
not(false, true).

evaluate(and, E, R) :- and(E,R).
evaluate(or, E, R) :- or(E,R).
evaluate(not, [E], R) :- not(E,R).

returnBool([X,t], true).
returnBool([X,f], false).

scanTruth([],[],false).
scanTruth(X,[[H|T1]|T],R) :- scanTruth(X,T,R); =(X,H), returnBool([H|T1], R).


boolList([], X,[]).
boolList([H|T], Truth, R) :- is_list(H), boolList(T, Truth, Temp1) ,evalb(H, Truth, Temp), R = [Temp|Temp1].
boolList([H|T], Truth, R) :- boolList(T, Truth, Temp1),scanTruth(H, Truth, Temp), R = [Temp|Temp1].

/* evalb(expression, truthSet, Result) */

evalb([H1|T1], Truth, R) :- boolList(T1, Truth, Temp), evaluate(H1, Temp, R).

truthSet( [[a, t], [b, f], [c, t], [d, t]]).
expression([and, [or, b, c], [and, c, d], [not, a]]).
/* end */


