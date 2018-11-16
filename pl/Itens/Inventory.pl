setup_Itens:-
	consult('itens.pl').


% --------------------- LISTS AND GETS ---------------------
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

% Remove item da b0ag (CHECKED)

removeItem(Id):-
	getBag(X),
	getQtd(Y),
	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Qtd > 1 -> removeNoSoloItem(Id);
	removeSoloItem(Id).  	

% Retorna atributos do item consumivel (MP E HP)

consumeItem(Id,MP,HP):-
	removeItem(Id),
	setup_Itens,
	getAtrbConsumable(Id,MP,HP).


% ------------------- GET SUM ATRIBUTES (ALL CHECKED) ---------------------

% Retorna o dano total dos itens equipados 

sumDamage(Dam):-
	equipped(X),
	sumDAM(X,Dam).

% Retorna a armadura total dos itens equipados

sumArmor(Arm):-
	equipped(X),
	sumARM(X,Arm).

% Retorna a força total dos itens equipados

sumStreigth(Str):-
	equipped(X),
	sumSTR(X,Str).

% Retorna a inteligência total dos itens equipados

sumInteligence(Int):-
	equipped(X),
	sumINT(X,Int).

% Retorna a agilidade total dos itens equipados

sumAgility(Dex):-
	equipped(X),
	sumDEX(X,Dex).

% -------------------------- UTIL PREDICATES ------------------------------


% Troca um item pelo outro na lista (o primeiro no caso de existir mais de um)

replaceItem(_,_,[],[]):- !.
replaceItem(NewValue,OldValue,[OldValue|T],[NewValue|T]).
replaceItem(NewValue,OldValue,[H|T],[H|T1]):- replaceItem(NewValue,OldValue,T,T1).

% Encontra o index de um valor da lista
% CHECK
findIndexByValue(E,[E|_],0):- !.
findIndexByValue(E,[_|T],I):- findIndexByValue(E,T,X), I is X + 1.

% Encontra o valor pelo index na lista
% CHECK
findValueByIndex(0, [H|_], H):- !.
findValueByIndex(I, [_|T], E):- X is I - 1, findValueByIndex(X, T, E).

% substitui um valor no index especifico dentro de uma lista, retornando a mesma atualizada
replace(_,_,[],_,_).
replace(V,0,[_|T],E,U):- append(E,[V],Y), append(Y,T,U).
replace(V,I,[X|T],E,U):- In is I - 1,append(E,[X],Y),replace(V,In,T,Y,U).


% -------------------------- AUX PREDICATES ------------------------------

% Função aux para remover quando possuir apenas um item (qtd = 1)
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

% Função aux para remover quando possuir mais de um item (qtd > 1)
removeNoSoloItem(Id):-
	getQtd(Y),
	getBag(X),

	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Nq is Qtd - 1,

	retract(qtd(Y)),
	replace(Nq,Index,Y,[],NewQtd),
	asserta(qtd(NewQtd)).

% Função aux para adicionar a quantidade de um item 
addQtdItem(Id):-
	retract(qtd(Y)),
	getBag(X),

	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Nq is Qtd +1,

	replace(Nq,Index,Y,[],NewQtd),
	asserta(qtd(NewQtd)).


% Função aux para somar o Dano total
sumDAM([],0).
sumDAM([X|T],Y):-
	 setup_Itens,
	 getDamage(X,Dam),
	 sumDAM(T,Z), Y is Z+Dam. 

% Função aux para somar a força total
sumSTR([],0).
sumSTR([X|T],Y):-
	 setup_Itens,
	 getStrength(X,STR),
	 sumSTR(T,Z), Y is Z+STR. 

% Função aux para somar a inteligência total
sumINT([],0).
sumINT([X|T],Y):-
	 setup_Itens,
	 getIntelig(X,INT),
	 sumINT(T,Z), Y is Z+INT. 

% Função aux para somar o a agilidade total
sumDEX([],0).
sumDEX([X|T],Y):-
	 setup_Itens,
	 getAgility(X,DEX),
	 sumDEX(T,Z), Y is Z+DEX.

% Função aux para somar o armadura total
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
 
