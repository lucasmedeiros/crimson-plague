/* FUNCOES DO INVENTARIO : */
	
	/* start(Classe) - Inicia o inventário com os itens iniciais a partir da classe do personagem */
	/* add(Id) - Adiciona um item a bag a partir do ID */
	/* remove(Pos) - Remove um item a partir da posição na bag */
 	/* equip(Pos) - Equipa um item da bag a partir da sua posicao */
	/* consumeItem(Id,MP,HP) - Retorna o MP e HP de um item consumivel pelo id */
	/* sumDamage(Dam) - Retorna o dano total dos itens equipados */
	/* sumAtrb(ClassCharacter,Atrb) - Retorna o valor total do atributo principal nos itens equipados */
	/* getItemDesc(Id,DescItem) - Retorna o nome e a descricao do item pelo ID, no formato nome: descricao */
 
/* -------------------DEFINITIONS AND IMPORTS -------------- */

:- module(inventory,[start/2,add/1,remove/1,equip/1,
			consumeItem/3,sumDamage/1,sumAtrb/1,printBag/0,printInventory/0,getItemDesc/2,sumArmor/1,
			sumStreigth/1,sumInteligence/1,sumAgility/1]).

:- use_module('Itens/itens.pl').


/* --------------------- LISTS AND GETS -------------------- */
:- dynamic(equipped/1).
equipped([34,34,34,34,34]).

:- dynamic(bag/1).
bag([34,34,34,34,34]).

:- dynamic(amount/1).
amount([0,0,0,0,0]).

:- dynamic(class/1).
class("guerreiro").

:- dynamic(nome/1).
nome("UNKNOW").


/* -------------------- PREDICATES -------------------------- */
/* --------------------    START   -------------------------- */

start(ClassCharacter,Name):-
	retract(nome(_)),
	asserta(nome(Name)),
	ClassCharacter == "guerreiro", updateClass(ClassCharacter) -> startEquipments([30,36,25,40,47]);
	ClassCharacter == "mago", updateClass(ClassCharacter) -> startEquipments([37,39,25,41,48]);
	ClassCharacter == "ladino", updateClass(ClassCharacter) -> startEquipments([32,45,25,44,49]);
	writeln("Classe inválida!").


/* ------------------- MANIPULATE ITENS --------------------- */


equip(Pos):-
	bag(X),
	checkPosition(Pos),
	nth0(RealPos,X,Id),
	RealPos is Pos - 1,
	equipAux(Id, RealPos). 


add(Id):-
	isItem(Id),
	bag(A),
	nth0(_,A,Id) ->
		isConsumible(Id),
		addAmountItem(Id), !;

	(retract(bag(X)),
	replaceItem(Id,34,X,Y),
	asserta(bag(Y)),
	addAmountItem(Id), !);

	writeln("Id inválido!").

remove(Pos):-
	bag(X),
	Index is Pos - 1,
	nth0(Index,X, Id),
	removeById(Id),
	checkPosition(Pos).
	

consumeItem(Id,MP,HP):-
	getAtrbConsumable(Id,MP,HP);
	writeln("Id inválido!").

sumAtrb(Atrb):-
	class(X),
	sumAux(Atrb,X).

sumDamage(Dam):-
	equipped(X),
	sumDAM(X,Dam).


getItemDesc(Id,DescItem):-
	getName(Id,Name),
	getDescription(Id,Desc),
	string_concat(Name,": ",Conc1),
	string_concat(Conc1,Desc,DescItem).



/* ------------------- GET SUM ATRIBUTES (ALL CHECKED) --------------------- */

/* Retorna a armadura total dos itens equipados */

sumArmor(Arm):-
	equipped(X),
	sumARM(X,Arm).

/* Retorna a força total dos itens equipados */

sumStreigth(Str):-
	equipped(X),
	sumSTR(X,Str).

/* Retorna a inteligência total dos itens equipados */

sumInteligence(Int):-
	equipped(X),
	sumINT(X,Int).

/* Retorna a agilidade total dos itens equipados */

sumAgility(Dex):-
	equipped(X),
	sumDEX(X,Dex).

/* -------------------------- UTIL PREDICATES ------------------------------ */


/* Troca um item pelo outro na lista (o primeiro no caso de existir mais de um) */

replaceItem(_,_,[],[]):- !.
replaceItem(NewValue,OldValue,[OldValue|T],[NewValue|T]).
replaceItem(NewValue,OldValue,[H|T],[H|T1]):- replaceItem(NewValue,OldValue,T,T1).

/* substitui um valor no index especifico dentro de uma lista, retornando a mesma atualizada */

replace(_,_,[],_,_).
replace(V,0,[_|T],E,U):- append(E,[V],Y), append(Y,T,U).
replace(V,I,[X|T],E,U):- In is I - 1,append(E,[X],Y),replace(V,In,T,Y,U).


/* -------------------------- AUX PREDICATES ------------------------------ */

updateClass(ClassCharacter):-
	(ClassCharacter == "mago";
	ClassCharacter == "guerreiro";
	ClassCharacter == "ladino") ->
	(class(X),
	retract(class(X)),
	asserta(class(ClassCharacter)));
	writeln("classe inválida").

removeSoloItem(Id):-
	amount(Y),
	bag(X),

	nth0(Index,X,Id),

	retract(bag(X)),
	retract(amount(Y)),
	
	replace(34,Index,X,[],NewBag),
	replace(0,Index,Y,[],NewAmount),

	asserta(bag(NewBag)),
	asserta(amount(NewAmount)).

removeNoSoloItem(Id):-
	amount(Y),
	bag(X),

	nth0(Index,X,Id),
	nth0(Index,Y,Amount),
	RealAmount is Amount - 1,

	retract(amount(Y)),
	replace(RealAmount,Index,Y,[],NewAmount),
	asserta(amount(NewAmount)).

addAmountItem(Id):-
	retract(amount(Y)),
	bag(X),

	nth0(Index,X,Id),
	nth0(Index,Y,Amount),

	RealAmount is Amount +1,

	replace(RealAmount,Index,Y,[],NewAmount),
	asserta(amount(NewAmount)).

sumAux(Atrb,ClassCharacter):-
	ClassCharacter == "guerreiro" -> sumStreigth(Atrb);
	ClassCharacter == "ladino" -> sumAgility(Atrb);
	ClassCharacter == "mago" -> sumInteligence(Atrb);
	writeln("Classe inválida").

equipAux(Id, RealPos):-
	bag(X),
	equipped(Y),
	
	getTYP(Id,Type),
	PosType is Type - 1,

	nth0(PosType,Y,IdEquipped),

	retract(bag(X)),
	retract(equipped(Y)),

	replace(IdEquipped,RealPos,X,[],NewBag),
	replace(Id,PosType,Y,[],NewEquipped),

	asserta(bag(NewBag)),
	asserta(equipped(NewEquipped)).

removeById(Id):-
	bag(X),
	amount(Y),

	nth0(Index,X,Id),
	nth0(Index,Y,Amount),

	Amount > 1 -> 
		removeNoSoloItem(Id);
	removeSoloItem(Id). 

startEquipments(A):-
	equipped(X),
	retract(equipped(X)),
	asserta(equipped(A)).

checkPosition(Pos):-
	Pos < 6, Pos > 0;
	writeln("Posição Inválida").

sumDAM([],0).
sumDAM([X|T],Y):-
	 getDAM(X,Dam),
	 sumDAM(T,Z), Y is Z+Dam. 

sumSTR([],0).
sumSTR([X|T],Y):-
	 getSTR(X,STR),
	 sumSTR(T,Z), Y is Z+STR. 

sumINT([],0).
sumINT([X|T],Y):-
	 getINT(X,INT),
	 sumINT(T,Z), Y is Z+INT. 

sumDEX([],0).
sumDEX([X|T],Y):-
	 getDEX(X,DEX),
	 sumDEX(T,Z), Y is Z+DEX.

sumARM([],0).
sumARM([X|T],Y):-
	getARM(X,ARM),
	sumARM(T,Z), Y is Z+ARM.

/* ------------------------------------ PRINT -------------------------------------- */

printInventory:-
	class(X),
	nome(Y),
	getNameEquiped(0,ARMA),
	getNameEquiped(1,ARMADURA),
	getNameEquiped(2,BOTAS),
	getNameEquiped(3,CAPACETE),
	getNameEquiped(4,ESCUDO),
	saida(X,PrintRightPage),

	concatAndPrint(" ┌─────────────────────────────────────┐ ",PrintRightPage,0),
	concatAndPrint("/│                                     │\\",PrintRightPage,1),
	concatAndPrint("││----------- INVENTÁRIO --------------││",PrintRightPage,2),
	concatAndPrint("││                                     ││",PrintRightPage,3),
	string_concat("││ NOME: ",Y,Name),
	compensaBlank(Name,PrintRightPage,4),
	string_concat("││ CLASSE: ",X,Class),
	compensaBlank(Class,PrintRightPage,5),
	concatAndPrint("││                                     ││",PrintRightPage,6),
	string_concat("││ 1.Arma : ",ARMA,Arma),
	compensaBlank(Arma,PrintRightPage,6),
	string_concat("││ 2.Armadura : ",ARMADURA,Armor),
	compensaBlank(Armor,PrintRightPage,7),
	string_concat("││ 3.Bota : ",BOTAS,Boots),
	compensaBlank(Boots,PrintRightPage,8),
	string_concat("││ 4.Capacete : ",CAPACETE,Helmet),
	compensaBlank(Helmet,PrintRightPage,9),
	string_concat("││ 5.Escudo : ",ESCUDO,Shield),
	compensaBlank(Shield,PrintRightPage,10),
	concatAndPrint("││                                     ││",PrintRightPage,11),
	printAtributes(X),
	concatAndPrint("││                                     ││",PrintRightPage,20),
	auxBagPrint(X), !.

concatAndPrint(String,Lista,Pos):-
	nth0(Pos,Lista,Linha),
	string_concat(String,Linha,LinhaCompleta),
	writeln(LinhaCompleta).


printAtributes(Classe):-
	sumAgility(DEX),
	sumInteligence(INT),
	sumStreigth(STR),
	sumArmor(ARM),
	sumDamage(DAM),
	saida(Classe,X),

	atom_concat("││ ARM: +",ARM,Armor),
	atom_concat("││-DANO PURO: ",DAM,Damage),
	atom_concat("││ INT: +",INT,Inteligence),
	atom_concat("││ DEX: +",DEX,Agility),
	atom_concat("││ STR: +",STR,Streigth),

	compensaBlank(Damage,X,12),
	concatAndPrint("││                                     ││",X,13),
	atom_concat("││"," Atributos Bônus: ",Title),
	compensaBlank(Title,X,14),
	concatAndPrint("││                                     ││",X,15),
	compensaBlank(Armor,X,16),
	compensaBlank(Inteligence,X,17),
	compensaBlank(Agility,X,18),
	compensaBlank(Streigth,X,19).

printItensInBag(Index,X):-
	amount(C),
	bag(A),
	nth0(Index,A,Id),
	nth0(Index,C,Amount),

	getName(Id,Name),
	Ind is Index + 1,

	string_concat(Ind,".",Indice),
	string_concat(Indice,Name,String1),
	string_concat(String1,"(x",String2),
	string_concat("││-",String2,String3),
	string_concat(String3,Amount,String4),
	string_concat(String4,")",X).

auxBagPrint(Classe):-
	saida(Classe,X),
	printItensInBag(0,Item1),
	printItensInBag(1,Item2),
	printItensInBag(2,Item3),
	printItensInBag(3,Item4),
	printItensInBag(4,Item5),

	concatAndPrint("││------------ Mochila ----------------││",X,21),
	concatAndPrint("││                                     ││",X,22),
	concatAndPrint("││------------- Slots -----------------││",X,23),
	concatAndPrint("││                                     ││",X,24),
	compensaBlank(Item1,X,25),
	compensaBlank(Item2,X,26), 
	compensaBlank(Item3,X,27),
	compensaBlank(Item4,X,28),
	compensaBlank(Item5,X,29),
	concatAndPrint("││                                     ││",X,30),
	concatAndPrint("││-------------------------------------││",X,31),
	concatAndPrint("││_____________________________________│/",X,32).




/*------------------------------ PRINT AUX ------------------------------------ */

generateBlack(0," ").
generateBlack(I,STR):- K is I - 1, generateBlack(K, NTR), string_concat(" ",NTR,STR).

compensaBlank(String,Lista,Index):-
	string_length(String, Length),
	BlanKQtd is 38 - Length,

	generateBlack(BlanKQtd,Blank),
	string_concat(String,Blank,StringAux),
	string_concat(StringAux,"││",NString),
	string_concat(NString,"",Saida),
	concatAndPrint(Saida,Lista,Index).

getNameEquiped(Pos,Name):-
	equipped(Y),
	nth0(Pos,Y,Item),
	getName(Item,Name).

options:-
	writeln(" 1) Equipar"),
	writeln(" 2) Voltar").
 	
printBag:-
	auxBagPrint,
	options.

/*-------------------------- MODELS ------------------------ */

saida("guerreiro",["  ┌─────────────────────────────────────┐",
			  "^/│                                     │\\",
			  "-││--------- MINHA HISTÓRIA ------------││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││-------------------------------------││",
			  "^\\│_____________________________________││"]).

saida("mago",["  ┌─────────────────────────────────────┐",
			  "^/│                                     │\\",
			  "-││--------- MINHA HISTÓRIA ------------││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││-------------------------------------││",
			  "^\\│_____________________________________││"]).

saida("ladino",["  ┌─────────────────────────────────────┐",
			  "^/│                                     │\\",
			  "-││--------- MINHA HISTÓRIA ------------││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││                                     ││",
			  "-││-------------------------------------││",
			  "^\\│_____________________________________││"]).