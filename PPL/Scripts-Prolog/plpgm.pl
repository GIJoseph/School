mylist([1,2,3,4,5]).

mylast([X], X).
mylast([H|T], L) :- mylast(T,L).

removelast([X],[]).
removelast([X|T],Result) :- removelast(T,Temp), Result = [X|Temp].

count([],0).
count([X|T], Total) :- count(T,C), Total is C + 1.

mycat([], L, L).
mycat([X|T], SecondList, Result) :- mycat(T, SecondList, Temp), Result = [X|Temp].

mytree([a, [b], [c]]).

smallestintree([X], X).
smallestintree([Node,[],Right], Node).
smallestintree([Node, Left, Right], Smallest) :- smallestintree(Left, Smallest).

sub(X, Y, [], []).
sub(X, Y, [Y|T], [X|T]).
sub(X, Y, [H | T], Result) :- sub(X, Y, T, Temp), atom(H), Result = [H|Temp].
sub(X, Y, [H | T], Result) :- sub(X, Y, T, Temp), sub(X, Y, H, T1), Result = [T1|Temp].




simpair([],[],[]).
simpair([X],[Y],[X,Y]).
simpair([H1|T1], [H2|T2], Result) :- simpair(T1,T2, Temp), Result = [H1|[H2|Temp]].

listPairs([],[],[]).
listPairs([X],[Y],[[X,Y]]).
listPairs([H1|T1], [H2|T2], Result) :- listPairs(T1,T2, Temp), Result = [[H1,H2]|Temp].


treeHeight([], 0).
treeHeight([X], 1).
treeHeight([Node, Left, Right], Ht) :- treeHeight(Left, Lht), treeHeight(Right, Rht), larger(Lht, Rht, L), Ht is L + 1.
treeHeight([Node, Left], Ht) :- treeHeight(Left, Lht), Ht is Lht + 1.

larger(A, B, C) :- A > B, C is A.
larger(A, B, B).
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


