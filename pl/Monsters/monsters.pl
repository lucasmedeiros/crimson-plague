:- module(monsters, [build_monster/2, takeDmgMonster/3, getHp/2,
                        getName/2, getXp/2, getDrop/2, getCa/2, getAtk/2]).

:- use_module("../util").

% FATOS

% configuração: id, nome, hp, divisor, somador, xp, id correspondente ao item de drop, CA, dano de ataque.
monster(1, "Kobolds", "2d8", 2, -1, 500, 1, 15, 4).
monster(2, "Arminho atroz", "4d8", 1, 0, 500, 5, 16,9).
monster(3, "Ratos", "1d8", 4, -1, 500, 7, 14, -1).
monster(4, "M'dok", "3d8", 1, 0, 500, 15, 15, 4).
monster(5, "Zumbi dos Mineiros", "3d12", 1, 3, 500, 2, 11, 7).
monster(6, "Kobolds Zumbis", "1d12", 1, 3, 500, 4, 11, 4).
monster(7, "Jack Garra Despedaçante", "4d10", 1, 10, 500, 6, 18, 11).

% PREDICADOS

isMonster(Id):-
    monster(Id,_,_,_,_,_,_,_,_).

build_monster(Id, Monster):-
    isMonster(Id),
    monster(Id, Name, StrHp, Div, Som, Xp, Drop, Ca, Atk),
    generateHp(StrHp, Hp),
    Monster = monster(id(Id), name(Name), hp(Hp), div(Div), som(Som), xp(Xp), drop(Drop), ca(Ca), atk(Atk)).

generateHp(StrHp, Hp):-
    sub_atom(StrHp,0,1,_,First),
    atom_number(First, FirstNumber),
    atom_length(StrHp, Length),
    LastNumberSize is Length - 2,
    sub_atom(StrHp, 2, LastNumberSize, _, Last),
    atom_number(Last, LastNumber),
    util:rollDices(FirstNumber, LastNumber, RollResult),
    Hp = RollResult, !.

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

takeDmgMonster(Monster, Amount, NewMonster):-
    Monster = monster(id(_Id), name(_Name), hp(_Hp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)),
    NewHp is _Hp - Amount,
    NewMonster = monster(id(_Id), name(_Name), hp(NewHp), div(_Div), som(_Som), xp(_Xp), drop(_Drop), ca(_Ca), atk(_Atk)).
