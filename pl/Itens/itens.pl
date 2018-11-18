:- module(itens,[isItem/1, isConsumible/1, isEquipable/1, getAtrbConsumable/3,
				getName/2,getARM/2,getDAM/2,getSTR/2,getDEX/2,getINT/2,getTYP/2]).

setup_bd_itens:-
	consult('Itens/bd_Itens.pl').


% --------------- CHECK -------------------

isItem(Id):-
	setup_bd_itens,
	item(Id,_,_).

isConsumible(Id):-
	setup_bd_itens,
	consumivel(Id,_,_).


isEquipable(Id):-
	setup_bd_itens,
	equipavel(Id,_,_,_,_,_,_).

getAtrbConsumable(Id,HP,MP):-
	setup_bd_itens,
	consumivel(Id,HP,MP).

getName(Id,Name):-
	setup_bd_itens,
	item(Id,Name,_).

% --------------- GETS EQUIPABLES ATRB---------------------

getDAM(Id,Dam):-setup_bd_itens,equipavel(Id,Dam,_,_,_,_,_).
getARM(Id,Arm):-setup_bd_itens,equipavel(Id,_,Arm,_,_,_,_).
getSTR(Id,Str):-setup_bd_itens,equipavel(Id,_,_,Str,_,_,_).
getDEX(Id,Dex):-setup_bd_itens,equipavel(Id,_,_,_,Dex,_,_).
getINT(Id,Int):-setup_bd_itens,equipavel(Id,_,_,_,_,Int,_).
getTYP(Id,Typ):-setup_bd_itens,equipavel(Id,_,_,_,_,_,Typ).

