:- module(battle, [startBattle/2]).

:- use_module("../util").
:- use_module("../Monsters/monsters").

startBattle(IdMonster, C) :-
    monsters:isMonster(IdMonster) ->
        monsters:build_monster(IdMonster, Monster),
        loopBattle(Monster, C).

loopBattle(Monster, C) :-
    monsters:getHp(Monster, MonsterHP),
    atom_concat("HP Monstro: ", MonsterHP, MonsterHPInfo),
    atom_concat("Seu HP: ", C, CharHPInfo),
    writeln(MonsterHPInfo),
    writeln(CharHPInfo),
    M2 = MonsterHP,
    C2 = C,
    menu(Monster, C).

menu(Monster, C) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("2) Abrir mochila"),
    writeln("3) Fugir"),
    util:readString(Option),
    evaluateOptionMenu(Option, Monster, C).

evaluateOptionMenu(O, Monster, C) :-
    util:cls,
    O = "1" -> charAttack(Monster, C);
    O = "2" -> openBag();
    O = "3" -> tryEscape(Monster, C);
    (writeln("Opção inválida!"), menu(Monster, C)).

charAttack(Monster, C) :-
    util:rollDice(20, RollResult),
    Damage is RollResult,
    monsters:getCa(Monster, CaMonster),
    writeln("Você se prepara para realizar um ataque corpo a corpo..."),
    Damage >= CaMonster ->
        (
            write("Você infligiu um total de "),
            atom_concat(Damage, " danos no monstro...", Concat),
            writeln(Concat),
            monsters:takeDmgMonster(Monster, Damage, NewMonster),
            monsters:getHp(NewMonster, NewMonsterHp),
            (NewMonsterHp =< 0 -> venceu; monsterAttack(NewMonster, C))
        );
    (writeln("E falha miseravelmente... O monstro ri de você!"), monsterAttack(Monster, C)).

monsterAttack(Monster, C) :-
    util:rollDice(20, RollResult),
    CharDef is 15,
    monsters:getAtk(Monster, Atk),
    MonsterDMG is Atk + RollResult,
    writeln("O monstro se prepara para um ataque..."),
    MonsterDMG >= CharDef ->
        (
            write("E inflige um total de "),
            atom_concat(MonsterDMG, " danos em você...", Concat),
            writeln(Concat),
            C2 is C - MonsterDMG,
            (C2 =< 0 -> perdeu; loopBattle(Monster, C2))
        );
    (writeln("E falha miseravelmente..."), loopBattle(Monster, C)).

openBag() :-
    writeln("abriu o inventário").

tryEscape(Monster, C) :-
    writeln("Você tenta fugir e..."),
    util:rollDice(20, RollResult),
    RollResult >= 12 -> 
        writeln("Escapou com sucesso...");
    (writeln("Não conseguiu... O monstro ri de você"), monsterAttack(Monster, C)).

venceu :-
    writeln("Parabéns, você venceu!").

perdeu :-
    writeln("Que pena, você perdeu!").