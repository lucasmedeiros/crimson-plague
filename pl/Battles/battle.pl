:- use_module("../util").

loopBattle(M, C) :-
    M =< 0 -> (venceu);
    C =< 0 -> (perdeu);
    (
        atom_concat("HP Monstro: ", M, MonsterHP),
        atom_concat("Seu HP: ", C, CharHP),
        writeln(MonsterHP),
        writeln(CharHP),
        M2 = M,
        C2 = C,
        menu(M, C, M2, C2)
    ).

menu(M, C, M2, C2) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("3) Fugir"),
    read_line_to_string(user_input, Option),
    evaluateOption(Option, M, C, M2, C2).

evaluateOption(O, M, C, M2, C2) :-
    cls,
    O = "1" -> charAttack(M, C);
    O = "3" -> tryEscape(M, C);
    (writeln("Opção inválida!"), menu(M, C, M2, C2)).

charAttack(M, C) :-
    rollDice(RollResult),
    M2 is M - RollResult,
    monsterAttack(C, M2).

monsterAttack(C, M) :-
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
            loopBattle(M, C2)
        );
    (writeln("E falha miseravelmente..."), loopBattle(M, C)).

tryEscape(M, C) :-
    writeln("Você tenta fugir e..."),
    rollDice(RollResult),
    RollResult >= 12 -> 
        writeln("Escapou com sucesso...");
    (writeln("Não conseguiu... O monstro ri de você"), monsterAttack(C, M)).

venceu :-
    writeln("Parabéns, você venceu!").

perdeu :-
    writeln("Que pena, você perdeu!").