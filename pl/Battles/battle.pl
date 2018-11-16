:- ['../util'].

loopBattle(M, C) :- 
    cls,
    atom_concat("HP Monstro: ", M, MonsterHP),
    atom_concat("Seu HP: ", C, CharHP),
    writeln(MonsterHP),
    writeln(CharHP),
    M > 0,
    C > 0,
    M2 = M,
    C2 = C,
    menu(M, C, M2, C2).

menu(M, C, M2, C2) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("3) Fugir"),
    read_line_to_string(user_input, Option),
    evaluateOption(Option, M, C, M2, C2).

evaluateOption(O, M, C, M2, C2) :-
    O = "1" -> charAttack(M, C, M2, C2);
    O = "3" -> tryEscape(M, C, C2);
    (writeln("Opção inválida!"), menu(M, C, M2, C2)).

charAttack(M, C, M2, C2) :-
    rollDice(RollResult),
    M2 is (M - RollResult),
    C2 is C,
    monsterAttack(C, M2, C2).

monsterAttack(C, M2, C2) :-
    rollDice(RollResult),
    CharDef is 20,
    MonsterDMG is 10 + RollResult,
    writeln("O monstro se prepara para um ataque..."),
    MonsterDMG >= CharDef ->
        (
        write("E inflige um total de "),
        atom_concat(MonsterDMG, " danos em você...", Concat2),
        writeln(Concat2),
        C2 is C - MonsterDMG,
        loopBattle(M2, C2));
    (writeln("E falha miseravelmente..."), loopBattle(M2, C)).

tryEscape(M, C, C2) :-
    writeln("Você tenta fugir e..."),
    rollDice(RollResult),
    RollResult >= 12 -> 
        writeln("Escapou com sucesso...");
    (writeln("Não conseguiu... O monstro ri de você"), monsterAttack(C, M, C2)).
    