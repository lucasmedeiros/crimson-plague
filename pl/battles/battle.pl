loopBattle(M, C) :- 
    atom_concat("HP Monstro: ", M, MonsterHP),
    atom_concat("Seu HP: ", C, CharHP),
    writeln(MonsterHP),
    writeln(CharHP),
    M > 0,
    writeln("chegou"),    
    C > 0,
    menu(M, C, Newmonsterhp, NewCharacterhp).

menu(M, C, M2, C2) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("3) Fugir"),
    read_line_to_string(user_input, Option),
    (evaluateOption(Option, M, C, M2, C2); menu(M, C, M2, C2)).

evaluateOption(O, M, C, M2, C2) :-
    O = "1" -> 
        charAttack(M, C, M2, C2);
    O = "3" ->
        tryEscape(M, C, M2, C2);
    (writeln("Opção inválida!"), loopBattle(M2, C2)).

charAttack(M, C, M2, C2) :-
    random(1, 21, RollResult),
    M2 is (M - RollResult),
    C2 is C + 0.

tryEscape(M, C, M2, C2) :-
    writeln("Você tenta fugir e..."),
    random(0, 21, RollResult),
    RollResult >= 12 -> 
        writeln("Escapou com sucesso...");
    (writeln("Não conseguiu... O monstro ri de você"), loopBattle(M2, C2)).