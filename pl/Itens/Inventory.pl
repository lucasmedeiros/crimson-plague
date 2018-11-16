% FUNCOES DO INVENTARIO:
	
	% start(Classe) - Inicia o inventário com os itens iniciais a partir da classe do personagem 
	% add(Id) - Adiciona um item a bag a partir do ID
	% remove(Pos) - Remove um item a partir da posição na bag
 	% equip(Pos) - Equipa um item da bag a partir da sua posicao  
	% getAtrbConsumable(Id,MP,HP) - Retorna o MP e HP de um item consumivel pelo id
	% sumDamage - Retorna o dano total dos itens equipados
	% sumAtrb - Retorna o valor total do atributo principal nos itens equipados
 


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
% --------------------    START   --------------------------

start(ClassCharacter):-
	ClassCharacter == "guerreiro" -> startEquipments([30,36,25,40,47]);
	ClassCharacter == "mago" -> startEquipments([37,39,25,41,48]);
	ClassCharacter == "ladino" -> startEquipments([32,45,25,44,49]);
	writeln("Classe inválida!").


% ------------------- MANIPULATE ITENS ---------------------


% Equipa item a partir da sua posicao na lista

equip(Pos):-
	getBag(X),
	RealPos is Pos - 1,
	findValueByIndex(RealPos,X,Id),
	equipItem(Id, RealPos),
	checkPosition(Pos).


% Add item in Bag (CHECKED).

add(Id):-
	setup_Itens,
	isItem(Id),
	getBag(A),
	nth0(_,A,Id) ->
		isConsumible(Id),
		addQtdItem(Id);

	retract(bag(X)),
	replaceItem(Id,34,X,Y),
	asserta(bag(Y)),
	addQtdItem(Id);
	write("Id inválido!").

% Remove item da bag pela posicao (CHECKED)

remove(Pos):-
	getBag(X),
	Index is Pos - 1,
	findValueByIndex(Index,X, Id),
	removeById(Id),
	checkPosition(Pos).
	

% Retorna atributos do item consumivel (MP E HP)

consumeItem(Id,MP,HP):-
	setup_Itens,
	getAtrbConsumable(Id,MP,HP);
	write("Id inválido!").

sumAtrb(ClassCharacter,Atrb):-
	ClassCharacter == "guerreiro" -> sumStreigth(Atrb);
	ClassCharacter == "ladino" -> sumAgility(Atrb);
	ClassCharacter == "mago" -> sumInteligence(Atrb);
	writeln("Classe inválida").


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

findIndexByValue(E,[E|_],0):- !.
findIndexByValue(E,[_|T],I):- findIndexByValue(E,T,X), I is X + 1.

% Encontra o valor pelo index na lista


findValueByIndex(0, [H|_], H):- !.
findValueByIndex(I, [_|T], E):- X is I - 1, findValueByIndex(X, T, E).

% substitui um valor no index especifico dentro de uma lista, retornando a mesma atualizada

replace(_,_,[],_,_).
replace(V,0,[_|T],E,U):- append(E,[V],Y), append(Y,T,U).
replace(V,I,[X|T],E,U):- In is I - 1,append(E,[X],Y),replace(V,In,T,Y,U).


% -------------------------- AUX PREDICATES ------------------------------


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


equipItem(IdBag, RealPos):-
	getBag(X),
	getEquipped(Y),
	setup_Itens,
	
	getTYP(IdBag,Type),
	PosType is Type - 1,

	findValueByIndex(PosType,Y,IdEquiped),

	retract(bag(X)),
	retract(equipped(Y)),

	replace(IdEquiped,RealPos,X,[],NewBag),
	replace(IdBag,PosType,Y,[],NewEquipped),

	asserta(bag(NewBag)),
	asserta(equipped(NewEquipped)).


removeById(Id):-
	getBag(X),
	getQtd(Y),
	findIndexByValue(Id,X,Index),
	findValueByIndex(Index,Y,Qtd),
	Qtd > 1 -> removeNoSoloItem(Id);
	removeSoloItem(Id). 

startEquipments(A):-
	getEquipped(X),
	retract(equipped(X)),
	asserta(equipped(A)).

checkPosition(Pos):-
	Pos > 5 -> write("Posição Inválida");
	write("Espaço vazio!").

% Função aux para somar o Dano total
sumDAM([],0).
sumDAM([X|T],Y):-
	 setup_Itens,
	 getDAM(X,Dam),
	 sumDAM(T,Z), Y is Z+Dam. 

% Função aux para somar a força total
sumSTR([],0).
sumSTR([X|T],Y):-
	 setup_Itens,
	 getSTR(X,STR),
	 sumSTR(T,Z), Y is Z+STR. 

% Função aux para somar a inteligência total
sumINT([],0).
sumINT([X|T],Y):-
	 setup_Itens,
	 getINT(X,INT),
	 sumINT(T,Z), Y is Z+INT. 

% Função aux para somar o a agilidade total
sumDEX([],0).
sumDEX([X|T],Y):-
	 setup_Itens,
	 getDEX(X,DEX),
	 sumDEX(T,Z), Y is Z+DEX.

% Função aux para somar o armadura total
sumARM([],0).
sumARM([X|T],Y):-
	setup_Itens,
	getARM(X,ARM),
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
	bagPrint,
	options.

bagPrint:-
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
	writeln("--------------------------------------").


getNameEquiped(Pos,Name):-
	setup_Itens,
	getEquipped(Y),
	findValueByIndex(Pos,Y,Item1),
	getName(Item1,Name).

options:-
	writeln(" 1) Equipar"),
	writeln(" 2) Voltar").

printInventory:-
	getNameEquiped(0,ARMA),
	getNameEquiped(1,ARMADURA),
	getNameEquiped(2,BOTAS),
	getNameEquiped(3,CAPACETE),
	getNameEquiped(4,ESCUDO),

	writeln("-------------------------------------------------------------------------  INVENTÁRIO ----------------------------------------------------------------"),
	writeln("|"),
	string_concat("| 1.Arma : ",ARMA,ArmaString),
	writeln(ArmaString),
	string_concat("| 2.Armadura : ",ARMADURA,ArmorString),
	writeln(ArmorString),
	string_concat("| 3.Bota : ",BOTAS,BootString),
	writeln(BootString),
	string_concat("| 4.Capacete : ",CAPACETE,HelmetString),
	writeln(HelmetString),
	string_concat("| 5.Escudo : ",ESCUDO,ShieldString),
	writeln(ShieldString),
	writeln("|"),
	writeln("|"),
	writeln("|"),
	writeln("|"),
	write("|"),
	bagPrint,
	writeln("|"),
	writeln("|"),
	writeln("|"),                                                                        
	writeln("|"),
	writeln("------------------------------------------------------------------------------------------------------------------------------------------------------").
	

 	
