leftTopCorner("┌").
rightTopCorner("┐").
rightBottonCorner("┘").
leftBottonCorner("└").
longLine("─").
longLine2("│").
blankLine("│                                                                                                                                                    │").
:- dynamic(heigth/1).
heigth(38).
:- dynamic(width/1).
width(150).

textExemplo(['Em uma manha ensolarada, voce se encontra em Passagem de Duvik, uma pequena cidade',
	'situada em um dos pequenos vales que cruzam as Montanhas Serpente.',
	'Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros',
	'procurando descansar membros doloridos e afogar memorias ruins dentro de seus portoes.',
	'E voce nao e uma excecao. No entanto algo te parece estranho, a cidade parece bem vazia',
    'voce nao consegue encontrar, os inumeros animais que existiam ao redor da cidade.',
    '']).


printTela:-
	atualizaSize,
	heigth(Y),
	width(X),
	textExemplo(Text),
	length(Text,Size),
	K is (Y div 2),
	CSize is 20 - Size,
	cleanScreen,
	topLine,
	compensaSize(Text),
	completeSpaces(CSize),
	bottonLine.

topLine:-
	width(W),
	Horizontal is W - 3,
	atualizaSize,
	rightTopCorner(X),
	leftTopCorner(Y),
	longLine(Z),
	generateLine(Horizontal,Z,String1),
	string_concat(Y,String1,StringR1),
	string_concat(StringR1,X,Line),
	write(Line).

bottonLine:-
	width(W),
	Horizontal is W - 3,
	atualizaSize,
	rightBottonCorner(X),
	leftBottonCorner(Y),
	longLine(Z),
	generateLine(Horizontal,Z,String1),
	string_concat(Y,String1,StringR1),
	string_concat(StringR1,X,Line),
	write(Line).


compensaSize([]).
compensaSize([X|T]):-
	width(W),
	Horizontal is W - 3,
	atualizaSize,
	longLine2(L),
	string_length(X,String_length),
	string_concat(L,X,Prov1),

	QtdBlank is Horizontal - String_length,

	generateBlank(QtdBlank,Blanks),
	string_concat(Prov1,Blanks,Prov2),
	string_concat(Prov2,L,Saida),
	write(Saida),
	compensaSize(T).

completeSpaces(0).
completeSpaces(I):-
	blankLine(X),
	K is I - 1,
	write(X),
	completeSpaces(K).


% Size do terminal 150x38: 
cleanScreen :- write('\e[H\e[2J').

generateLine(0,T,T).
generateLine(I,T,NSTR):- K is I - 1, generateLine(K,T,NTR), string_concat(T,NTR,NSTR).

generateBlank(0," ").
generateBlank(I,STR):- K is I - 1, generateBlank(K, NTR), string_concat(" ",NTR,STR).

atualizaSize:-
	heigth(Y),
	width(X),
	asserta(heigth(_)),
	asserta(width(_)),

	tty_size(_Y,_X),
	asserta(heigth(_Y)),
	asserta(width(_X)).
