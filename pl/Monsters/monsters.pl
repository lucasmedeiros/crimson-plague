:- module(monsters, [isMonster/1, build_monster/2]).

:- use_module("../util").

setup_bd_monsters:-
	consult('bdMonsters.pl').

isMonster(Id):-
    setup_bd_monsters,
    monster(Id,_,_,_,_,_,_,_,_).

build_monster(Id, Monster):-
    setup_bd_monsters,
    monster(Id, Name, StrHp, Div, Som, Xp, Drop, Ca, Atk),
    generateHp(StrHp, Hp),
    Monster = monster(id(Id), name(Name), hp(Hp), div(Div), som(Som), xp(Xp), drop(Drop), ca(Ca), atk(Atk)).

generateHp(StrHp, Hp):-
    sub_atom(StrHp,0,1,_,First),
    atom_number(First, FirstNumber),
    sub_atom(StrHp,_,1,0,Last),
    atom_number(Last, LastNumber),
    util:rollDices(FirstNumber, LastNumber, RollResult),
    Hp = RollResult, !.

rolling(Bound, Hp) :-
    util:rollDice(Bound, RollResult),
    Hp is Hp + RollResult.

getHp(Monster, Hp):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    Hp = _Hp.

getName(Monster, Name):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    Name = _Name.

getXp(Monster, Xp):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    Xp = _Xp.

getDrop(Monster, Drop):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    Drop = _Drop.

getCa(Monster, Ca):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    Ca = _Ca.

getAtk(Monster, Atk):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    Atk = _Atk.