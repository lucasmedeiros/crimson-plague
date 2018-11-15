setup_bd_itens:-
	reconsult('bd_Itens.pl').


% --------------- GETS -------------------

getName(Id,Name):-
	setup_bd_itens,
	item(Id,Name,_).

getArmor(Id,Arm):-
	setup_bd_itens,
	equipavel(Id,_,Arm,_,_,_,_).

getDamage(Id,Dam):-
	setup_bd_itens,
	equipavel(Id,Dam,_,_,_,_,_).

getStrength(Id,Str):-
	setup_bd_itens,
	equipavel(Id,_,_,Str,_,_,_).

getAgility(Id,Dex):-
	setup_bd_itens,
	equipavel(Id,_,_,_,Dex,_,_).

getIntelig(Id,Intel):-
	setup_bd_itens,
	equipavel(Id,_,_,_,_,Intel,_).

getType(Id,Type):-
	setup_bd_itens,
	equipavel(Id,_,_,_,_,_,Type).