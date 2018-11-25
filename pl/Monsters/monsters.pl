:- module(monsters, [build_monster/2, takeDmgMonster/3, getHp/2,
                        getName/2, getXp/2, getDrop/2, getCa/2, getAtk/2,getImage/2]).

:- use_module("../util").

setup_bd_monster:-
	consult('Monsters/bd_monster').

% PREDICADOS

isMonster(Id):-
    setup_bd_monster,
    monster(Id,_,_,_,_,_,_,_,_).

build_monster(Id, Monster):-
    setup_bd_monster,
    isMonster(Id),
    monster(Id, Name, StrHp, Div, Som, Xp, Drop, Ca, Atk),
    generateHp(StrHp, Som, Hp),
    Monster = monster(id(Id), name(Name), hp(Hp), div(Div), som(Som), xp(Xp), drop(Drop), ca(Ca), atk(Atk)).

generateHp(StrHp, Som, Hp):-
    setup_bd_monster,
    sub_atom(StrHp,0,1,_,First),
    atom_number(First, FirstNumber),
    atom_length(StrHp, Length),
    LastNumberSize is Length - 2,
    sub_atom(StrHp, 2, LastNumberSize, _, Last),
    atom_number(Last, LastNumber),
    util:rollDices(FirstNumber, LastNumber, RollResult),
    Hp is RollResult + Som,
    !.

% GETS 
    
getId(Monster, Id):-setup_bd_monster, Monster = monster(id(Id), _, _, _, _, _, _, _, _).
getName(Monster, Name):-setup_bd_monster, Monster = monster(_, name(Name),_, _, _, _, _, _,_).
getHp(Monster, Hp):-setup_bd_monster, Monster = monster(_, _, hp(Hp), _, _, _, _, _,_).
getDiv(Monster, Div):-setup_bd_monster,Monster = monster(_, _, _, div(Div), _, _, _, _,_).
getSom(Monster, Som):-setup_bd_monster, Monster = monster(_, _, _, _, som(Som), _, _, _,_).
getXp(Monster, Xp):-setup_bd_monster,Monster = monster(_, _, _, _,_, xp(Xp), _, _,_).
getDrop(Monster, Drop):-setup_bd_monster,Monster = monster(_, _, _, _,_,_, drop(Drop), _,_).
getCa(Monster, Ca):-setup_bd_monster,Monster = monster(_, _, _, _,_,_,_, ca(Ca),_).
getAtk(Monster, Atk):-setup_bd_monster,Monster = monster(_, _, _, _,_,_,_, _,atk(Atk)).

getImage(Battle,X):- setup_bd_monster, battleImage(Battle,X).

takeDmgMonster(Monster, Amount, NewMonster):-
    getId(Monster, Id),
    getName(Monster, Name),
    getHp(Monster, Hp),
    getDiv(Monster, Div),
    getSom(Monster, Som),
    getXp(Monster, Xp),
    getDrop(Monster, Drop),
    getCa(Monster, Ca),
    getAtk(Monster, Atk),
    NewHp is Hp - Amount,
    NewMonster = monster(id(Id), name(Name), hp(NewHp), div(Div), som(Som), xp(Xp), drop(Drop), ca(Ca), atk(Atk)).
