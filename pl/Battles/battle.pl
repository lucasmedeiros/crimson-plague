/*
 * startBattle/1:
 *      O único atributo que precisa ser passado é o ID do monstro que será chamado, para
 *      saber qual o ID do monstro com o qual o personagem batalhará, basta consultar os
 *      fatos em monsters.pl
 * */

:- module(battle, [startBattle/2]).

:- use_module("util").
:- use_module("Monsters/monsters").
:- use_module("Sheet/sheet").

:- dynamic(imageBattle/1).
imageBattle(1).


% inicia a batalha entre o personagem e um monstro
startBattle(IdMonster,Image) :-
    util:cls,
    retract(imageBattle(_)),
    asserta(imageBattle(Image)),
    printMonstersDisplay,
    monsters:isMonster(IdMonster) ->
        monsters:build_monster(IdMonster, Monster),
        write("Um desafio se aproxima, um "),
        monsters:getName(Monster, MonsterName),
        atom_concat(MonsterName, " te ataca...", ChallengeInfo),
        writeln(ChallengeInfo),
        loopBattle(Monster).

% predicado criado para representar um "loop"
loopBattle(Monster) :-
    monsters:getHp(Monster, MonsterHP),
    monsters:getName(Monster, MonsterName),
    atom_concat("HP ", MonsterName, MonsterNameInfo),
    atom_concat(": ", MonsterHP, MonsterHPInfo),
    atom_concat(MonsterNameInfo, MonsterHPInfo, MonsterInfo),
    sheet:getHP(CharHP),
    atom_concat("Seu HP: ", CharHP, CharHPInfo),
    writeln(MonsterInfo),
    writeln(CharHPInfo),
    menu(Monster).

% predicado criado para representar o menu principal de ações na batalha
menu(Monster) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("2) Abrir mochila"),
    writeln("3) Fugir"),
    util:readString(Option),
    evaluateOptionMenu(Option, Monster).

% avalia opção escolhida pelo usuário no menu e toma uma decisão a partir dela
evaluateOptionMenu(O, Monster) :-
    util:cls,
    O = "1" -> evaluateCharAttackOption(Monster);
    O = "2" -> openInventory(Monster);
    O = "3" -> tryEscape(Monster);
    (printMonstersDisplay, writeln("Opção inválida!"), menu(Monster)).

% define se o ataque será mágico (caso seja mago), ou físico.
evaluateCharAttackOption(Monster) :-
    sheet:getClass(Class),
    Class == "mago" ->
        magicalAttack(Monster);
        phisicalAttack(Monster).

% gancho para o ataque mágico, no caso do personagem ser mago
magicalAttack(Monster) :-
    sheet:getLevel(Level),
    spells:getUsableSpells(Level, IDs),
    menuSpells(IDs, Monster).

% menu para escolha das habilidades possíveis que o mago tem, baseado no
% seu level.
menuSpells(IDs, Monster) :-
    printMonstersDisplay,
    writeln("HABILIDADES: "),
    sheet:getMP(Mana),
    atom_concat("Mana disponível: ", Mana, ManaInfo),
    writeln(ManaInfo),
    printSpells(IDs, 1),
    writeln("Informe o número da magia que você quer lançar: "),
    util:readString(Option),
    atom_number(Option, NumOption),
    evaluateSpellOption(NumOption, IDs, Monster).

% predicado que serve para imprimir as magias disponíveis.
printSpells([], _).
printSpells([Head|Tail], Pos) :-
    atom_concat(Pos, "- ", ConcatPos),
    write(ConcatPos),
    spells:printSpellLabel(Head),
    AuxPos is Pos + 1,
    printSpells(Tail, AuxPos).

% avalia a opção de magia escolhida, verificando se é válida ou não.
evaluateSpellOption(Option, IDs, Monster) :-
    length(IDs, ListSize),
    (Option > ListSize; Option =< 0) ->
        (
            util:cls,
            write(Option),
            write(" - "),
            writeln("Opção inválida..."),
            menuSpells(IDs, Monster)
        ); (util:cls, executeMagicalAttack(Monster, Option)).

% finalmente, executa o ataque mágico.
executeMagicalAttack(Monster, ID) :-
    printMonstersDisplay,
    sheet:useSpell(ID, CharDamage) ->
        (
            sheet:recoverMP(5),
            writeln("Você se prepara para realizar um ataque mágico..."),
            util:rollDice(20, RollResult),
            AuxDmg is RollResult + CharDamage,
            AuxDmg >= 12 -> successfullAttack(CharDamage, Monster);
            (writeln("E falha miseravelmente... O monstro ri de você!"), monsterAttack(Monster))
        );
        (
            sheet:recoverMP(5),
            writeln("Sem mana..."),
            monsterAttack(Monster)
    ).

% executa um ataque físico.
phisicalAttack(Monster) :-
    printMonstersDisplay,
    sheet:calculateDamage(CharDamage),
    monsters:getCa(Monster, CaMonster),
    write("Você se prepara para realizar um ataque corpo a corpo..."),
    util:rollDice(20, RollResult),
    AuxDmg is RollResult + CharDamage,
    AuxDmg >= CaMonster -> successfullAttack(CharDamage, Monster);
    (write("E falha miseravelmente... O monstro ri de você!"), monsterAttack(Monster)).

% predicado para infligir dano ao monstro, caso o ataque seja bem sucedido.
successfullAttack(CharDamage, Monster) :-
    write("Você infligiu um total de "),
    atom_concat(CharDamage, " danos no monstro...", Concat),
    writeln(Concat),
    monsters:takeDmgMonster(Monster, CharDamage, NewMonster),
    monsters:getHp(NewMonster, NewMonsterHp),
    (NewMonsterHp =< 0 -> venceu(Monster); (monsterAttack(NewMonster))).

% predicado que representa o ataque do monstro.
monsterAttack(Monster) :-
    printMonstersDisplay,
    util:rollDice(20, RollResult),
    sheet:calculateDefense(CharDef),
    monsters:getAtk(Monster, Atk),
    MonsterDMG is Atk + RollResult,
    writeln("O monstro se prepara para um ataque..."),
    MonsterDMG >= CharDef ->
        (
            write("E inflige um total de "),
            atom_concat(MonsterDMG, " danos em você...", Concat),
            writeln(Concat),
            sheet:takeDamage(MonsterDMG),
            sheet:getHP(C2),
            (C2 =< 0 -> perdeu; loopBattle(Monster))
        );
    (writeln("E falha miseravelmente..."), loopBattle(Monster)).

% predicado para caso o usuário tenha escolhido abrir o inventário durante a batalha
openInventory(Monster) :-
    inventory:printInventory,
    evaluateInventoryOption(Monster).


% verificar o pq a linha 185 da erro
% avalia a opção escolhida pelo usuário na mochila.
evaluateInventoryOption(Monster) :-
    writeln("[1 - 5] -> Equipar/Consumir item da mochila"),
    writeln("[0] -> Voltar ao menu"),
    readInt(Option),
    ((Option == 0) ->
        (
            util:cls,
            printMonstersDisplay,
            loopBattle(Monster)
        );
    (Option > 0, Option =< 5) ->
    (
        useItem(Option),
        evaluateInventoryOption(Monster)
    );
    (
        writeln("Opcão inválida!"),
        evaluateInventoryOption(Monster)
    )).


% predicado chamado ao escolher a opção de fuga
% avalia e exibe mensagens dependendo (se conseguiu fugir ou não)
tryEscape(Monster) :-
    writeln("Você tenta fugir e..."),
    util:rollDice(20, RollResult),
    RollResult >= 8 ->
        printMonstersDisplay,
        writeln("Escapou com sucesso...");
    (printMonstersDisplay,writeln("Não conseguiu... O monstro ri de você"), monsterAttack(Monster)).

% caso o personagem vença a batalha, esse predicado será chamado.
% imprime informações do drop do monstro e adiciona XP ao personagem.
venceu(Monster) :-
    writeln("Parabéns, você venceu!"),
    monsters:getDrop(Monster, Drop),
    itens:getDescription(Drop, Desc),
    itens:getName(Drop, Name),
    writeln(""),
    write("O monstro deixou cair uma "),
    writeln(Name),
    writeln("Informações do drop: "),
    writeln(Desc),
    inventory:add(Drop),
    monsters:getXp(Monster, Xp),
    writeln(""),
    write("Você ganhou "),
    atom_concat(Xp, " pontos de experiência.", XpInfo),
    writeln(XpInfo),
    sheet:increaseXP(Xp).

% predicado chamado caso o personagem perca a batalha contra algum monstro.
perdeu :-
    writeln("Que pena, você perdeu!").

printMonstersDisplay:-
    imageBattle(X),
    getImage(X,Image),
    printMonsters(Image).

printMonsters([]).
printMonsters([X|Z]):-
    writeln(X),
    printMonsters(Z).
