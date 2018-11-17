:- module(monsters, [isMonster/1, build_monster/2]).

setup_bd_monsters:-
	consult('bdMonsters.pl').

isMonster(Id):-
    setup_bd_monsters,
    monster(Id,_,_,_,_,_,_,_,_).

build_monster(Id, Monster):-
    setup_bd_monsters,
    monster(Id, Name, Hp, Div, Som, Xp, Drop, Ca, Atk),
    Monster = monster(id(Id), name(Name), hp(Hp), div(Div), som(Som), xp(Xp), drop(Drop), ca(Ca), atk(Atk)).

test(Monster):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)).