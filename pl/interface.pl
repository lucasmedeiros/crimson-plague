:- module(interface,[textDisplay/1,printLogo/0]).

leftTopCorner("┌").
rightTopCorner("┐").
rightBottonCorner("┘").
leftBottonCorner("└").
longLine("─").
longLine2("│").

:- dynamic(emptyLine/1).
emptyLine("│                                                                                                                                                                                 │").
:- dynamic(heigth/1).
heigth(38).
:- dynamic(width/1).
width(150).

title(" Crimson Plague ").

textDisplay(Text):-
	updateSize,
	length(Text,Text_Size),
	Real_Text_Size is 19 - Text_Size,
	cleanScreen,
	title(Title),
	displayTitle(Title),
	topLineDisplay,	
	displayText(Text),
	completeSpaces(Real_Text_Size),
	bottonLineDisplay.

displayTitle(Title):-
	longLine2(LL),
	string_length(Title,Title_length),
	topTitleLineDisplay(Title_length,Title_TopLine_Display),

	writeln(Title_TopLine_Display),

	string_concat(LL,Title,P1),
	string_concat(P1,LL,Display_Title),
	writeln(Display_Title).


topTitleLineDisplay(Title_Length,Title_topLine_Display):-
	longLine(LL),
	rightTopCorner(RT),
	leftTopCorner(LT),
	Real_Title_Length is Title_Length - 1,

	generateLine(Real_Title_Length,LL,P1),
	string_concat(LT,P1,P2),
	string_concat(P2,RT,Title_topLine_Display).

topLineDisplay:-
	updateSize,
	width(W),
	rightTopCorner(RT),
	leftTopCorner(LT),
	longLine(LL),
	Horizontal_Length is W - 3,

	generateLine(Horizontal_Length,LL,P1),
	string_concat(LT,P1,P2),
	string_concat(P2,RT,Top_Line_Display),
	write(Top_Line_Display).

bottonLineDisplay:-
	updateSize,
	width(W),
	rightBottonCorner(RB),
	leftBottonCorner(LB),
	longLine(LL),
	Horizontal_Length is W - 3,

	generateLine(Horizontal_Length,LL,P1),
	string_concat(LB,P1,P2),
	string_concat(P2,RB,Botton_Line_Display),
	write(Botton_Line_Display).

displayText([]).
displayText([X|T]):-
	width(W),
	longLine2(LL),
	Horizontal_Length is W - 3,

	string_length(X,Text_length),
	string_concat(LL,X,P1),

	Qtd_Blank is (Horizontal_Length - Text_length),

	generateLine(Qtd_Blank," ",Blank_Line),
	string_concat(P1,Blank_Line,P2),
	string_concat(P2,LL,Display_Text),
	write(Display_Text),

	displayText(T).


completeSpaces(0).
completeSpaces(I):-
	emptyLine(X),
	K is I - 1,
	writeln(X),
	completeSpaces(K).


cleanScreen :- write('\e[H\e[2J').

generateBlank(I,Blanks):- generateLine(I," ",Blanks).

generateLine(0,T,T).
generateLine(I,T,NSTR):- K is I - 1, (I >= 0) -> (generateLine(K,T,NTR), string_concat(T,NTR,NSTR)).

updateSize:-
	retract(heigth(_)),
	retract(width(_)),
	retract(emptyLine(_)),

	tty_size(Size_Y, Size_X),
	Horizontal_Length is Size_X - 3,

	generateBlank(Horizontal_Length,Blank_Line),
	string_concat("│",Blank_Line,P1),
	string_concat(P1,"│",Empty_Line),

	asserta(emptyLine(Empty_Line)),
	asserta(heigth(Size_Y)),
	asserta(width(Size_X)).


readInt(Number) :-
    (read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number));
    Number is -1.

printLogo:-
	cleanScreen,
	logo(Logo),
	display(Logo).

display([]).
display([X|Z]):-
    writeln(X),
    display(Z).



logo(["┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│               ▄████▄   ██▀███   ██▓ ███▄ ▄███▓  ██████  ▒█████   ███▄    █     ██▓███   ██▓    ▄▄▄        ▄████  █    ██ ▓█████                    │",
"│               ▒██▀ ▀█  ▓██ ▒ ██▒▓██▒▓██▒▀█▀ ██▒▒██    ▒ ▒██▒  ██▒ ██ ▀█   █    ▓██░  ██▒▓██▒   ▒████▄     ██▒ ▀█▒ ██  ▓██▒▓█   ▀                   │",
"│               ▒▓█    ▄ ▓██ ░▄█ ▒▒██▒▓██    ▓██░░ ▓██▄   ▒██░  ██▒▓██  ▀█ ██▒   ▓██░ ██▓▒▒██░   ▒██  ▀█▄  ▒██░▄▄▄░▓██  ▒██░▒███                     │",
"│               ▒▓▓▄ ▄██▒▒██▀▀█▄  ░██░▒██    ▒██   ▒   ██▒▒██   ██░▓██▒  ▐▌██▒   ▒██▄█▓▒ ▒▒██░   ░██▄▄▄▄██ ░▓█  ██▓▓▓█  ░██░▒▓█  ▄                   │",
"│               ▒ ▓███▀ ░░██▓ ▒██▒░██░▒██▒   ░██▒▒██████▒▒░ ████▓▒░▒██░   ▓██░   ▒██▒ ░  ░░██████▒▓█   ▓██▒░▒▓███▀▒▒▒█████▓ ░▒████▒                  │",
"│               ░ ░▒ ▒  ░░ ▒▓ ░▒▓░░▓  ░ ▒░   ░  ░▒ ▒▓▒ ▒ ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒    ▒▓▒░ ░  ░░ ▒░▓  ░▒▒   ▓▒█░ ░▒   ▒ ░▒▓▒ ▒ ▒ ░░ ▒░ ░                  │",
"│                ░  ▒     ░▒ ░ ▒░ ▒ ░░  ░      ░░ ░▒  ░ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░   ░▒ ░     ░ ░ ▒  ░ ▒   ▒▒ ░  ░   ░ ░░▒░ ░ ░  ░ ░  ░                   │",
"│               ░          ░░   ░  ▒ ░░      ░   ░  ░  ░  ░ ░ ░ ▒     ░   ░ ░    ░░         ░ ░    ░   ▒   ░ ░   ░  ░░░ ░ ░    ░                     │",
"│               ░ ░         ░      ░         ░         ░      ░ ░           ░                 ░  ░     ░  ░      ░    ░        ░  ░                  │",
"│               ░                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                     INICIAR JOGO                                                                   │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"│                                                                                                                                                    │",
"└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"]).
