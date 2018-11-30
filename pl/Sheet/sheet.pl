:- module(sheet, [createCharacter/0, getHP/1, getMaxHP/1, getMP/1, getMaxMP/1,
    setHP/1, setMaxHP/1, setMP/1, setMaxMP/1, getSTR/1, setSTR/1, getINT/1,
    setINT/1, getDEX/1, setDEX/1, getVIT/1, setVIT/1, getLUK/1, setLUK/1,
    getCHR/1, setCHR/1, getStrModifier/1, getIntModifier/1, getDexModifier/1,
    getLukModifier/1, getChrModifier/1, getVitModifier/1, getName/1, getLevel/1,
    getClass/1, getXP/1, getMaxXP/1, takeDamage/1, increaseXP/1, recoverMP/1,
    calculateDamage/1, calculateDefense/1, useSpell/2, recoverHP/1, useItem/1, addItem/1]).

:- use_module('interface').
:- use_module("util").
:- use_module("Itens/inventory").
:- use_module("Sheet/spells").

class(1, "guerreiro").
class(2, "mago").
class(3, "ladino").

getModifier("guerreiro", Mod) :- getStrModifier(Mod).
getModifier("mago", Mod) :- getIntModifier(Mod).
getModifier("ladino", Mod) :- getDexModifier(Mod).


:- dynamic(stats/4).
% stats(hp, maxHP, mp, maxMP)
stats(100, 100, 30, 30).

:- dynamic(attributes/6).
% attributes(str, int, dex, vit, luk, chr)
attributes(9, 9, 9, 9, 9, 9).

% sheet(Name, level, Class, XP, MaxXP)
:- dynamic(sheet/5).

% Informações
getHP(HP) :- stats(HP, _, _, _).
getMaxHP(Value) :- stats(_, MHP, _, _), getVIT(Vit), Value is MHP + Vit.
getMP(MP) :- stats(_, _, MP, _).
getMaxMP(Value) :- stats(_, _, _, MMP), getINT(Int), Value is MMP + (Int // 2).

fillHP() :-
    stats(_, MHP, MP, MMP),
    getMaxHP(RealMHP),
    retract(stats(_, _, _, _)),
    asserta(stats(RealMHP, MHP, MP, MMP)).

fillMP() :-
    stats(HP, MHP, _, MMP),
    getMaxMP(RealMMP),
    retract(stats(_, _, _, _)),
    asserta(stats(HP, MHP, RealMMP, MMP)).

setHP(HP) :-
    stats(_, MHP, MP, MMP),
    retract(stats(_, _, _, _)),
    asserta(stats(HP, MHP, MP, MMP)).

setMaxHP(MHP) :-
    stats(HP, _, MP, MMP),
    retract(stats(_, _, _, _)),
    asserta(stats(HP, MHP, MP, MMP)).

setMP(MP) :-
    stats(HP, MHP, _, MMP),
    retract(stats(_, _, _, _)),
    asserta(stats(HP, MHP, MP, MMP)).

setMaxMP(MMP) :-
    stats(HP, MHP, MP, _),
    retract(stats(_, _, _, _)),
    asserta(stats(HP, MHP, MP, MMP)).

takeDamage(Damage) :-
    getHP(HP),
    NewHP is HP - Damage,
    (NewHP > 0) -> (setHP(NewHP));
    setHP(0).

recoverMP(Amount) :-
    getMP(MP),
    getMaxMP(MMP),
    K is Amount + MP,
    ((K =< MMP) -> setMP(K);
    setMP(MMP)).

recoverHP(Amount) :-
    getHP(HP),
    getMaxHP(MHP),
    K is Amount + HP,
    ((K =< MHP) -> setHP(K);
    setMP(MHP)).

getBaseSTR(Value) :- attributes(Value, _, _, _, _, _).
getBaseINT(Value) :- attributes(_, Value, _, _, _, _).
getBaseDEX(Value) :- attributes(_, _, Value, _, _, _).

getSTR(Str) :- sumStreigth(Bonus), getBaseSTR(Base), Str is Base + Bonus.
getINT(Int) :- sumInteligence(Bonus), getBaseINT(Base), Int is Base + Bonus.
getDEX(Dex) :- sumAgility(Bonus), getBaseDEX(Base), Dex is Base + Bonus.
getVIT(Vit) :- attributes(_, _, _, Vit, _, _).
getLUK(Luk) :- attributes(_, _, _, _, Luk, _).
getCHR(Chr) :- attributes(_, _, _, _, _, Chr).

setSTR(Str) :-
    attributes(_, Int, Dex, Vit, Luk, Chr),
    retract(attributes(_, _, _, _, _, _)),
    asserta(attributes(Str, Int, Dex, Vit, Luk, Chr)).

setINT(Int) :-
    attributes(Str, _, Dex, Vit, Luk, Chr),
    retract(attributes(_, _, _, _, _, _)),
    asserta(attributes(Str, Int, Dex, Vit, Luk, Chr)).

setDEX(Dex) :-
    attributes(Str, Int, _, Vit, Luk, Chr),
    retract(attributes(_, _, _, _, _, _)),
    asserta(attributes(Str, Int, Dex, Vit, Luk, Chr)).

setVIT(Vit) :-
    attributes(Str, Int, Dex, _, Luk, Chr),
    retract(attributes(_, _, _, _, _, _)),
    asserta(attributes(Str, Int, Dex, Vit, Luk, Chr)).

setLUK(Luk) :-
    attributes(Str, Int, Dex, Vit, _, Chr),
    retract(attributes(_, _, _, _, _, _)),
    asserta(attributes(Str, Int, Dex, Vit, Luk, Chr)).

setCHR(Chr) :-
    attributes(Str, Int, Dex, Vit, Luk, _),
    retract(attributes(_, _, _, _, _, _)),
    asserta(attributes(Str, Int, Dex, Vit, Luk, Chr)).

addSTR(Num) :-
    getBaseSTR(Current),
    NewValue is Current + Num,
    setSTR(NewValue).

addINT(Num) :-
    getBaseINT(Current),
    NewValue is Current + Num,
    setINT(NewValue).

addDEX(Num) :-
    getBaseDEX(Current),
    NewValue is Current + Num,
    setDEX(NewValue).

addLUK(Num) :-
    getLUK(Current),
    NewValue is Current + Num,
    setLUK(NewValue).

addVIT(Num) :-
    getVIT(Current),
    NewValue is Current + Num,
    setVIT(NewValue).

addCHR(Num) :-
    getCHR(Current),
    NewValue is Current + Num,
    setCHR(NewValue).

addItem(Id):-
    add(Id).

getStrModifier(Value) :- getSTR(K), Value is K // 4.
getIntModifier(Value) :- getINT(K), Value is K // 4.
getDexModifier(Value) :- getDEX(K), Value is K // 4.
getVitModifier(Value) :- getVIT(K), Value is K // 4.
getLukModifier(Value) :- getLUK(K), Value is K // 4.
getChrModifier(Value) :- getCHR(K), Value is K // 4.

getName(Name) :- sheet(Name, _, _, _, _).
getLevel(Level) :- sheet(_, Level, _, _, _).
getClass(Class) :- sheet(_, _, Class, _, _).
getXP(XP) :- sheet(_, _, _, XP, _).
getMaxXP(MXP) :- sheet(_, _, _, _, MXP).

setXP(XP) :-
    sheet(Name, Level, Class, _, MXP),
    retract(sheet(_, _, _, _, _)),
    asserta(sheet(Name, Level, Class, XP, MXP)).

addLevel(Amount) :-
    sheet(Name, Level, Class, XP, MXP),
    NewLevel is Level + Amount,
    retract(sheet(_, _, _, _, _)),
    asserta(sheet(Name, NewLevel, Class, XP, MXP)).

increaseXP(Amount) :-
    getXP(XP),
    getMaxXP(MXP),
    K is XP + Amount,
    (K >= MXP -> (
        Remain is mod(K, MXP),
        Levels is (K // MXP),
        addLevel(Levels),
        setXP(Remain)
    );
    setXP(K)).

calculateDamage(Damage) :-
    inventory:sumDamage(Weapon),
    getClass(Class),
    getModifier(Class, Modifier),
    Damage is Modifier + Weapon.

calculateDefense(Defense) :-
    inventory:sumArmor(Armor),
    getDexModifier(Modifier),
    Defense is Modifier + Armor.

% Verifica se há mana suficiente
hasEnoughMana(MP) :- getMP(CurrentMP), MP =< CurrentMP.

% Gasta a mana especificada
spendMP(MP) :-
    hasEnoughMana(MP), getMP(CurrentMP), NewMP is CurrentMP - MP, setMP(NewMP).

% Retorna true caso a habilidade esteja disponível, false caso não.
spellAvaliable(ID) :-
    getClass(Class),
    Class == "mago",
    getLevel(Level),
    spells:getUsableSpells(Level, Spells),
    member(ID, Spells).

useItem(Pos) :-
    inventory:existItem(Pos),
    (consumeItem(Pos,MP,HP),recoverHP(HP),recoverMP(MP)); equip(Pos).

% Usa a habilidade de determinado ID e unifica o dano causado à variavel Damage,
% retorna True se conseguir usar a habilidade, false caso contrário.
% Possíveis motivos para false: Mana insuficiente, habilidade não disponível
useSpell(ID, Damage) :-
    spellAvaliable(ID),
    spells:getManaCost(ID, ManaCost),
    hasEnoughMana(ManaCost),
    spendMP(ManaCost),
    spells:calculateDamage(ID, Damage).

adjustAttributes(Class) :-
    ((Class == "guerreiro") -> (addSTR(2), addVIT(1), addDEX(-1), addINT(-2)));
    ((Class == "mago") -> (addSTR(-2), addLUK(1), addDEX(-1), addINT(2)));
    ((Class == "ladino") -> (addVIT(-2), addCHR(-1), addDEX(2), addINT(1))).

classSetup(Class) :-
  adjustAttributes(Class),
  fillHP(),
  fillMP().

chooseClass(Class, Name) :-
    L = ["Classes: ",
        "",
        "1) Guerreiro",
        "Guerreiros são exímios lutadores marciais, sempre prontos para lutar.",
        "Possuem extremas habilidades de combate corpo a corpo.",
        "",
        "2) Mago",
         "Magos são pesquisadores das artes arcanas da Idade Média e utilizam-as em suas batalhas,",
        "porém são fisicamente fracos e não possuem habilidades de combate com armas.",
        "",
        "3) Ladino",
        "Furtivos e escorregadios, ladinos, se não estão roubando algo, estão trabalhando numa busca por um tesouro.",
        "Possuem altas habilidades em combates de longa distância e armas de longo alcance.",
        ""],

    textDisplay(L),
    write("Selecione sua classe: "),
    readInt(Number),
    ((Number > 0, Number < 4) -> (
        class(Number, Class), classSetup(Class), inventory:start(Class, Name));
    (cls(), chooseClass(Class,Name))).

createCharacter :-
    Inicio = [""," Um Rpg é um tipo de jogo onde os jogadores criam personagens que ",
              " embarcam em aventuras em que eles enfrentam monstros, reúnem",
              " tesouros, interagem entre si e ganham pontos de experiência para se",
              " tornarem incrivelmente poderosos à medida que o jogo avança.",
              " os Rpgs de mesa, o foco do jogo está na interpretação da história descrita ao jogador",
              " Diferente de muitos jogos, na maioria dos Rpgs, suas escolhas têm consequencias na história e nas condições dos personagens da mesma,",
              " podendo alterar drasticamente o final do jogo","",
              " Outra mecânica muito importante é que suas ações nem sempre darão certo",
              " por exemplo, se você escolher escalar uma montanha há uma chance de você cair, assim como na vida real",
              " Espero que goste do jogo e boa sorte!",""," Mas antes de comecarmos, me diga:", ""," Qual seu nome, aventureiro? "],
    textDisplay(Inicio),
    write("Nome: "),
    readString(Name),
    chooseClass(Class, Name),
    writeln("Carregando..."),
    sleep(1),
    asserta(sheet(Name, 1, Class, 0, 100)).
