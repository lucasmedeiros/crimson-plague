:- module(util,
    [rollDice/1, cls/0, printList/1]).

rollDice(O) :-
    random(0, 21, RollResult),
    O = RollResult.

printList([]) :-
    write("").

printList([Head| Tail]) :-
    writeln(Head),
    printList(Tail).

cls :- write('\33\[2J').