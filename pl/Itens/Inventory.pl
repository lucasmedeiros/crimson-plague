setup_Itens:-
	consult('itens.pl').


% --------------------- FACTS ----------------------------
:- dynamic(equipped/1).
equipped([34,34,34,34,34]).

:- dynamic(bag/1).
bag([34,34,34,34,34]).

:- dynamic(qtd/1).
qtd([0,0,0,0,0]).

getBag(X):-
	bag(X).

getQtd(Y):-
	qtd(Y).

getEquipped(Z):-
	equipped(Z).

% -------------------- PREDICATES --------------------------

% ------------------- MANIPULATE ITENS ---------------------

% Equip Item

% Add item in Bag (CHECKED).

addItem(Id):-
	setup_Itens,
	isItem(Id),
	getBag(A),
	nth0(X,A,Id) ->
		isConsumible(Id),
		addQtdItem(Id);

	retract(bag(X)),
	replaceItem(Id,34,X,Y),
	asserta(bag(Y)),
	addQtdItem(Id).


% Remove item in Bag (CHECKED)

removeItem(Id):-
	getBag(X),
	getQtd(Y),
	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Qtd > 1 -> removeNoSoloItem(Id);
	removeSoloItem(Id).  	

% Consume item in bag and return Mp and Hp

consumeItem(Id,MP,HP):-
	removeItem(Id),
	setup_Itens,
	getAtrbConsumable(Id,MP,HP).


% ------------------- GET ATRIBUTES (ALL CHECKED) ---------------------

% Sum damage of the equipped itens 

sumDamage(Dam):-
	equipped(X),
	sumDAM(X,Dam).

% Sum armor of the equipped itens

sumArmor(Arm):-
	equipped(X),
	sumARM(X,Arm).

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

replaceItem(_,_,[],[]):- !.
replaceItem(NewValue,OldValue,[OldValue|T],[NewValue|T]).
replaceItem(NewValue,OldValue,[H|T],[H|T1]):- replaceItem(NewValue,OldValue,T,T1).

% CHECK
findIndexByValue(E,[E|_],0):- !.
findIndexByValue(E,[_|T],I):- findIndexByValue(E,T,X), I is X + 1.

% CHECK
findValueByIndex(0, [H|_], H):- !.
findValueByIndex(I, [_|T], E):- X is I - 1, findValueByIndex(X, T, E).

replace(_,_,[],_,_).
replace(V,0,[_|T],E,U):- append(E,[V],Y), append(Y,T,U).
replace(V,I,[X|T],E,U):- In is I - 1,append(E,[X],Y),replace(V,In,T,Y,U).


removeSoloItem(Id):-
	getQtd(Y),
	getBag(X),

	findIndexByValue(Id,X,Index),

	retract(bag(X)),
	retract(qtd(Y)),
	
	replace(34,Index,X,[],NewBag),
	replace(0,Index,Y,[],NewQtd),

	asserta(bag(NewBag)),
	asserta(qtd(NewQtd)).


removeNoSoloItem(Id):-
	getQtd(Y),
	getBag(X),

	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Nq is Qtd - 1,

	retract(qtd(Y)),
	replace(Nq,Index,Y,[],NewQtd),
	asserta(qtd(NewQtd)).


addQtdItem(Id):-
	retract(qtd(Y)),
	getBag(X),

	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Nq is Qtd +1,

	replace(Nq,Index,Y,[],NewQtd),
	asserta(qtd(NewQtd)).



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

sumARM([],0).
sumARM([X|T],Y):-
	setup_Itens,
	getArmor(X,ARM),
	sumARM(T,Z), Y is Z+ARM.

% ------------------------------------ PRINT --------------------------------------

printInBag(Index,X):-
	setup_Itens,
	qtd(C),
	bag(A),
	findValueByIndex(Index,A,Id),
	getName(Id,Name),
	findValueByIndex(Index,C,Qtd),
	Ind is Index+1,
	string_concat(Ind,".",Indice),
	string_concat(Indice,Name,String1),
	string_concat(String1,"(x",String2),
	string_concat("|",String2,String3),
	string_concat(String3,Qtd,String4),
	string_concat(String4,")",X).

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
 
