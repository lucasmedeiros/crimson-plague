:- module(util,
    [rollDice/2, cls/0, printList/1]).

rollDice(L, O) :-
    random(1, L, RollResult),
    O = RollResult.

printList([]) :-
    write("").

printList([Head| Tail]) :-
    writeln(Head),
    printList(Tail).

cls :- write('\33\[2J').