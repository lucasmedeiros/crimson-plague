setup_Itens:-
	consult('itens.pl').


% --------------------- FACTS ----------------------------
:- dynamic(equipped/1).
equipped([34,34,34,34,34]).

:- dynamic(bag/1).
bag([34,34,34,34,34]).


% -------------------- PREDICATES --------------------------

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




% ------------------ AUX PREDICATES ------------------------

replaceItem(NewValue,OldValue,[],[]).
replaceItem(NewValue,OldValue,[OldValue|T],[NewValue|T]).
replaceItem(NewValue,OldValue,[H|T],[H|T1]):- replaceItem(NewValue,OldValue,T,T1).



