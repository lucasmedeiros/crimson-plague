% Soma de todos os elementos da lista.
soma([],0).
soma([H|T],S):-soma(T,G),S is H+G.

% Quantidade de elementos de uma lista.
qtde([],0).
qtde([_|T],S):-qtde(T,G),S is 1+G.

% Tamanho de uma Lista
tamL([_], 1):- !.
tamL([_|L], T):- tamL(L, X), T is X + 1.

% Média aritmética de uma lista
mediaarit(L,M):- somaLista(L, S), tamL(L,T), M is S / T.

% Produto Vetorial de duas Listas ((x1 * x2) + (x3 * x4).....)
prodVetorial([H], [R], P):- P is H * R, !.
prodVetorial([H|T], [R|S], P):- prodVetorial([H],[R],M), prodVetorial(T,S,U), P is M + U.

% Média ponderada de uma lista
mediapond(L,P,M):- prodVetorial(L,P,PV), somaLista(P,S), M is PV / S.

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.

% Insere um elemento no fim de uma lista
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).

% Remove um elemento da lista
remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):- remove(X,T,T1).

% Encontra o índice de um elemento em uma lista
encontraind(E,[E|_],0):- !.
encontraind(E,[_|T],I):- encontraind(E,T,X), I is X + 1.

% Encontra o elemento de uma lista a partir do índice
encontraeElem(0, [H|_], H):- !.
encontraeElem(I, [_|T], E):- X is I - 1, encontraeElem(X, T, E).

% Remove um elemento da lista a partir do índice
removeind(0,[_|T],T):- !.
removeind(I,[H|T],R):- X is I - 1, removeind(X, T, Y), insereInicio(H, Y, R).

% Verifica se um número é par ou ímpar
par(N):- N mod 2 =:= 0.
impar(N):- N mod 2 =:= 1.

% Calcula a mediana de uma Lista
mediana(L, M):- tamL(L, T), par(T), X is (T / 2) - 1, encontraeElem(X, L, E1), X2 is X + 1, encontraeElem(X2, L, E2), M is (E1 + E2) / 2,!.
mediana(L, M):- tamL(L, T), impar(T), X is (T - 1) / 2, encontraeElem(X, L, M),!.

% Inverte uma Lista
concatenar([], L, L).
concatenar([H|T], L, [H|D]) :- concatenar(T, L, D).
inverte([], []).
inverte([H|T], L) :- inverte(T, X), concatenar(X, [H], L).