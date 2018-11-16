:- module(util,
    [rollDice/1, cls/0]).

rollDice(O) :-
    random(0, 21, RollResult),
    O = RollResult.

cls :- write('\33\[2J').