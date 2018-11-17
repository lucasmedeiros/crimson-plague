:- module(battle, [startBattle/2]).

:- use_module("../util").
:- use_module("../Monsters/monsters").

startBattle(IdMonster, C) :-
    monsters:isMonster(IdMonster) ->
        monsters:build_monster(IdMonster, Monster),
        loopBattle(M, C).
    /* TODO pegar dados do monstro */

loopBattle(M, C) :-
    atom_concat("HP Monstro: ", M, MonsterHP),
    atom_concat("Seu HP: ", C, CharHP),
    writeln(MonsterHP),
    writeln(CharHP),
    M2 = M,
    C2 = C,
    menu(M, C, M2, C2).

menu(M, C, M2, C2) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("2) Abrir mochila"),
    writeln("3) Fugir"),
    read_line_to_string(user_input, Option),
    evaluateOption(Option, M, C, M2, C2).

evaluateOption(O, M, C, M2, C2) :-
    util:cls,
    O = "1" -> charAttack(M, C);
    O = "2" -> openBag();
    O = "3" -> tryEscape(M, C);
    (writeln("Opção inválida!"), menu(M, C, M2, C2)).

charAttack(M, C) :-
    util:rollDice(20, RollResult),
    Damage is RollResult - 0,
    write("Você infligiu um total de "),
    atom_concat(Damage, " danos no monstro...", Concat),
    writeln(Concat),
    M2 is M - Damage,
    (M2 =< 0 -> venceu; monsterAttack(C, M2)).

monsterAttack(C, M) :-
    util:rollDice(20, RollResult),
    CharDef is 20,
    MonsterDMG is 10 + RollResult,
    writeln("O monstro se prepara para um ataque..."),
    MonsterDMG >= CharDef ->
        (
            write("E inflige um total de "),
            atom_concat(MonsterDMG, " danos em você...", Concat),
            writeln(Concat),
            C2 is C - MonsterDMG,
            (C2 =< 0 -> perdeu; loopBattle(M, C2))
        );
    (writeln("E falha miseravelmente..."), loopBattle(M, C)).

openBag() :-
    writeln("abriu o inventário").

tryEscape(M, C) :-
    writeln("Você tenta fugir e..."),
    util:rollDice(20, RollResult),
    RollResult >= 12 -> 
        writeln("Escapou com sucesso...");
    (writeln("Não conseguiu... O monstro ri de você"), monsterAttack(C, M)).

venceu :-
    writeln("Parabéns, você venceu!").

perdeu :-
    writeln("Que pena, você perdeu!").