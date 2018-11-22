:- module(interface,[printeTela/1]).

leftTopCorner("┌").
rightTopCorner("┐").
rightBottonCorner("┘").
leftBottonCorner("└").
longLine("─").
longLine2("│").

:- dynamic(blankLine/1).
blankLine("│                                                                                                                                                                                 │").
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

title("Terras misteriosas").

printeTela(Text):-
	atualizaSize,
	length(Text,Size),
	CSize is 15 - Size,
	cleanScreen,
	title(X),
	visuTitle(X),
	topLine,
	alocaTexto(Text),
	completeSpaces(CSize),
	bottonLine,
	confirmBreakLine.

visuTitle(Title):-
	longLine2(L),
	string_length(Title,Title_length),
	topTitleLine(Title_length,TitleTopLine),
	writeln(TitleTopLine),
	string_concat(L,Title,Title1),
	string_concat(Title1,L,Print),
	writeln(Print).


topTitleLine(Title_length,TitleTopLine):-
	longLine(L),
	rightTopCorner(RT),
	leftTopCorner(LT),
	Title_length1 is Title_length - 1,
	generateLine(Title_length1,L,LineP1),
	string_concat(LT,LineP1,LineP2),
	string_concat(LineP2,RT,TitleTopLine).

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

alocaTexto([]).
alocaTexto([X|T]):-
	width(W),
	Horizontal is W - 3,
	longLine2(L),
	string_length(X,Text_length),
	string_concat(L,X,Prov1),

	QtdBlank is (Horizontal - Text_length),

	generateLine(QtdBlank," ",Blanks),
	string_concat(Prov1,Blanks,Prov2),
	string_concat(Prov2,L,Saida),
	write(Saida),

	alocaTexto(T).


completeSpaces(0).
completeSpaces(I):-
	blankLine(X),
	K is I - 1,
	writeln(X),
	completeSpaces(K).


cleanScreen :- write('\e[H\e[2J').

generateBlank(I,Blanks):- generateLine(I," ",Blanks).

generateLine(0,T,T).
generateLine(I,T,NSTR):- K is I - 1, generateLine(K,T,NTR), string_concat(T,NTR,NSTR).

atualizaSize:-
	retract(heigth(_)),
	retract(width(_)),
	retract(blankLine(_)),

	tty_size(_Y,_X),
	Horizontal is _X - 3,
	generateBlank(Horizontal,Blanks),
	string_concat("│",Blanks,Aux),
	string_concat(Aux,"│",Blank_line),
	asserta(blankLine(Blank_line)),
	asserta(heigth(_Y)),
	asserta(width(_X)).


readInt(Number) :-
    (read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number));
    Number is -1.

confirmBreakLine:-
    writeln(""),
    writeln("Pressione algum botao para continuar"),
    readInt(_).
