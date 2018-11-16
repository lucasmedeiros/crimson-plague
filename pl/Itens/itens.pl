setup_bd_itens:-
	consult('bd_Itens.pl').

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

getARM(Id,Arm):-setup_bd_itens,equipavel(Id,_,Arm,_,_,_,_).
getDAM(Id,Dam):-setup_bd_itens,equipavel(Id,Dam,_,_,_,_,_).
getSTR(Id,Str):-setup_bd_itens,equipavel(Id,_,_,Str,_,_,_).
getDEX(Id,Dex):-setup_bd_itens,equipavel(Id,_,_,_,Dex,_,_).
getINT(Id,Int):-setup_bd_itens,equipavel(Id,_,_,_,_,Int,_).
getTYP(Id,Typ):-setup_bd_itens,equipavel(Id,_,_,_,_,_,Typ).

