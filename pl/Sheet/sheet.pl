:- module(sheet, [createCharacter/0, getHP/1, getMaxHP/1, getMP/1, getMaxMP/1, 
    setHP/1, setMaxHP/1, setMP/1, setMaxMP/1, getSTR/1, setSTR/1, getINT/1, setINT/1,
    getDEX/1, setDEX/1, getVIT/1, setVIT/1, getLUK/1, setLUK/1, getCHR/1, setCHR/1,
    getStrModifier/1, getIntModifier/1, getDexModifier/1, getLukModifier/1, 
    getChrModifier/1, getVitModifier/1, getName/1, getLevel/1, getClass/1, getXP/1, getMaxXP/1]).

:- use_module("../util").

class(1, "guerreiro").
class(2, "mago").
class(3, "ladino").

showClassInfo :- 
    L = ["[Informações sobre classes]",
        "Guerreiros são exímios lutadores marciais, sempre prontos para lutar.",
        "Possuem extremas habilidades de combate corpo a corpo.",
        "",
        "Magos são pesquisadores das artes arcanas da Idade Média e utilizam-as em suas batalhas,",
        "porém são fisicamente fracos e não possuem habilidades de combate com armas.",
        "",
        "Furtivos e escorregadios, ladinos, se não estão roubando algo, estão trabalhando numa busca por um tesouro.",
        "Possuem altas habilidades em combates de longa distância e armas de longo alcance."],

    printList(L).

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
getMaxHP(MHP) :- stats(_, MHP, _, _).
getMP(MP) :- stats(_, _, MP, _).
getMaxMP(MMP) :- stats(_, _, _, MMP).

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

getSTR(Str) :- attributes(Str, _, _, _, _, _).
getINT(Int) :- attributes(_, Int, _, _, _, _).
getDEX(Dex) :- attributes(_, _, Dex, _, _, _).
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

chooseClass(Class) :-
    L = ["Classes: ",
        "1) Guerreiro",
        "2) Mago",
        "3) Ladino",
        "4) Mais informações",
        "",
        "Selecione sua classe: "],

    printList(L),
    readInt(Number),
    ((Number > 0, Number < 4) -> (class(Number, Class));
    (Number == 4) -> (cls(), showClassInfo(), writeln(""), chooseClass(Class));
    (cls(), chooseClass(Class))).

createCharacter :-
    writeln("Qual seu nome? "),
    readString(Name),
    writeln(""),
    chooseClass(Class),
    asserta(sheet(Name, 1, Class, 0, 100)).