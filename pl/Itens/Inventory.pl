setup_Itens:-
	consult('itens.pl').


% --------------------- FACTS ----------------------------
:- dynamic(equipped/1).
equipped([34,34,34,34,34]).

:- dynamic(bag/1).
bag([34,34,34,34,34]).

:- dynamic(qtd/1).
qtd([0,0,0,0,0]).


% -------------------- PREDICATES --------------------------

% ------------------- MANIPULATE ITENS ---------------------
% Equip Item

equipItem(Id):-
	setup_Itens,
	isEquipable(Id),
	retract(equipped(X)),
	replaceItem(Id,34,X,Y),
	asserta(equipped(Y)).

% Add item in Bag

addItem(Id):-
	retract(bag(X)),
	replaceItem(Id,34,X,Y),
	asserta(bag(Y)).


% Remove item in Bag

removeItem(Id):-
	retract(bag(X)),
	replaceItem(34,Id,X,Y),
	asserta(bag(Y)).

% Consume item in bag and return Mp and Hp

consumeItem(Id,MP,HP):-
	removeItem(Id),
	setup_Itens,
	getAtrb(Id,MP,HP).

% ------------------- GET ATRIBUTES ---------------------

% Sum damage of the equipped itens 

sumDamage(Dam):-
	equipped(X),
	sumDAM(X,Dam).

% Sum streigth of the equipped itens

sumStreigth(Str):-
	equipped(X),
	sumSTR(X,Str).

% Sum inteligence of the equipped itens

sumInteligence(Int):-
	equipped(X),
	sumINT(X,Int).

% Sum agility of the equipped itens

sumAgility(Dex):-
	equipped(X),
	sumDEX(X,Dex).



% ------------------ AUX PREDICATES ------------------------

replaceItem(NewValue,OldValue,[],[]).
replaceItem(NewValue,OldValue,[OldValue|T],[NewValue|T]).
replaceItem(NewValue,OldValue,[H|T],[H|T1]):- replaceItem(NewValue,OldValue,T,T1).


sumDAM([],0).
sumDAM([X|T],Y):-
	 setup_Itens,
	 getDamage(X,Dam),
	 sumDAM(T,Z), Y is Z+Dam. 

sumSTR([],0).
sumSTR([X|T],Y):-
	 setup_Itens,
	 getStrength(X,STR),
	 sumSTR(T,Z), Y is Z+STR. 

sumINT([],0).
sumINT([X|T],Y):-
	 setup_Itens,
	 getIntelig(X,INT),
	 sumINT(T,Z), Y is Z+INT. 

sumDEX([],0).
sumDEX([X|T],Y):-
	 setup_Itens,
	 getAgility(X,DEX),
	 sumDEX(T,Z), Y is Z+DEX.


printInventory:-

	writeln("-------------------------------------------------------------------------  INVENTÁRIO ----------------------------------------------------------------"),
	writeln("| "),
	% atom_concat("| 1.Arma : ", "Ola",X),
	% writeln(X),
	% writeln("| 2.Armadura : "++ Item.getName (armor)).
	% writeln("| 3.Bota : "++ Item.getName (boots)).
	% writeln("| 4.Capacete : " ++ Item.getName (helmet)).
	% writeln("| 5.Escudo : " ++ Item.getName (shield)).
	writeln("|"),
	writeln("|"),
	writeln("|"),
	writeln("|"),
	writeln("|------------- Slots -----------------"),
	writeln("|"),
	writeln("|"),
	% writeln("|1. " ++ Item.getName (slot1) ++ "(x" ++  (show (nQtd !!0)) ++ ")") 
	% writeln("|2. " ++ Item.getName (slot2) ++ "(x" ++ (show (nQtd !!1)) ++ ")")
	% writeln("|3. " ++ Item.getName (slot3) ++ "(x" ++  (show (nQtd !!2)) ++ ")")
	% writeln("|4. " ++ Item.getName (slot4) ++ "(x" ++  (show (nQtd !!3)) ++ ")")
	% writeln("|5. " ++ Item.getName (slot5) ++ "(x" ++ (show (nQtd !!4)) ++ ")")
	writeln("|"),
	writeln("|"),
	writeln("|"),
	writeln("|"), 
	writeln("|"),
	writeln("------------------------------------------------------------------------------------------------------------------------------------------------------").

printBag:-
	printInBag(0,Item1),
	printInBag(1,Item2),
	printInBag(2,Item3),
	printInBag(3,Item4),
	printInBag(4,Item5),

	writeln("------------- Mochila ----------------"),
	writeln("|"),
	writeln("|"),
	writeln("|------------- Slots -----------------"),
	writeln("|"),
	writeln("|"),
	writeln(Item1), 
	writeln(Item2),
	writeln(Item3),
	writeln(Item4),
	writeln(Item5),
	writeln("|"),
	writeln("| "),
	writeln("--------------------------------------"),
	writeln(" 1) Equipar"),
	writeln(" 2) Voltar").


% Format Item for output

printInBag(Index,X):-
	setup_Itens,
	qtd(C),
	bag(A),
	getItemInList(Index,A,Id),
	getName(Id,Name),
	getItemInList(Index,C,Qtd),
	Ind is Index+1,
	string_concat(Ind,".",Indice),
	string_concat(Indice,Name,String1),
	string_concat(String1,"(x",String2),
	string_concat("|",String2,String3),
	string_concat(String3,Qtd,String4),
	string_concat(String4,")",X).


% Get item in a especific position in a list

getItemInList(0,[H|_],H).
getItemInList(I,[_|T],E):- Z is I - 1, getItemInList(Z,T,E).

% Add item in a index of a list

addItemInIndex(0,Value,[H|_],[Value|_]).
addItemInIndex(I,Value,[_,T], E):- Z is I - 1, addItemInIndex(Z,Value,T,E).
 