switch(X, [Val:Goal|Cases]) :-
    (X=Val -> call(Goal) ; switch(X, Cases)).

loopBattle(M, C) :- 
    atom_concat("HP Monstro: ", M, MonsterHP),
    atom_concat("Seu HP: ", C, CharHP),
    writeln(MonsterHP),
    writeln(CharHP),
    M > 0,
    writeln("chegou"),    
    C > 0,
    menu(M, C, Newmonsterhp, NewCharacterhp),
    loopBattle(Newmonsterhp, NewCharacterhp).

evaluateOption(O, M, C, M2, C2) :-
    switch(O, [
        "1": charAttack(M, C, M2, C2),
        "2": abrir(),
        "3": !
    ]).

menu(M, C, M2, C2) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("2) Abrir inventário"),
    writeln("3) Fugir"),
    read_line_to_string(user_input, Option),
    (evaluateOption(Option, M, C, M2, C2); menu(M, C, M2, C2)).

charAttack(M, C, M2, C2) :-
    random(1, 21, RollResult),
    M2 is (M - RollResult),
    C2 is C + 0.
