:- module(spells, [getName/2, getManaCost/2, calculateDamage/2]).

:- use_module("util").

% id, nome, descr, circulo, dado[qtd, lado], mp
spell(1, "Chicote Elétrico", "Você cria um açoite de energia elétrica que golpeia uma criatura", 0, [2, 8], 5).
spell(2, "Raio Adoecente", "Um raio adoecente de energia esverdeada chicoteia na direção de uma criatura dentro do alcance.", 1, [3, 8], 8).
spell(3, "Flecha Acida de Melf", "Uma flecha esverdeada cintilante voa em direção de um alvo dentro do alcance e explode em um jato de ácido.", 2, [6, 6], 9).
spell(4, "Bola de Fogo", "Um veio brilhante lampeja na ponta do seu dedo em direção a um ponto que você escolher, dentro do alcance, e então eclode com um estampido baixo, explodindo em chamas.", 3, [8,6], 12).
spell(5, "Esfera Cáustica", "Você aponta um lugar dentro do alcance, e uma bola brilhante de ácido esmeralda atinge o ponto e explode.", 4, [15, 4], 15).
spell(6, "Cone de Frio", "Uma criatura sofre dano de frio e se torna uma estátua de gelo caso morra.", 5, [8,8], 18).
spell(7, "Desintegrar", "Um fino raio esverdeado é lançado da ponta do seu dedo em um alvo que você possa ver dentro do alcance.", 6, [20,6], 21).
spell(8, "Dedo da Morte", "Você envia energia negativa na direção de uma criatura que você possa ver, dentro do alcance, causando dores severas nela.", 7, [10,8], 24).
spell(9, "Evaporação de Abi", "Você suga a humidade de todas as criaturas num cubo centrado em um ponto, à sua escolha, dentro do alcance.", 8, [12,8], 27).
spell(10, "Chuva de Meteoros", "Esferas de fogo incandescentes atingem o solo em quatro pontos diferentes que você possa ver, dentro do alcance.", 9, [50,6], 30).

getNumDices(ID, Num) :- spell(ID, _, _, _, [Num|_], _).
getSidesDice(ID, Sides) :- spell(ID, _, _, _, [_|[Sides|_]], _).

getName(ID, Name) :- spell(ID, Name, _, _, _, _).
getManaCost(ID, MP) :- spell(ID, _, _, _, _, MP).

% Aceita o nível do personagem como parâmetro e retorna uma lista de IDs
% das habilidades que podem ser usadas
getUsableSpells(CharacterLevel, SpellsID) :-
    N is ((CharacterLevel + 1) // 2),
    numlist(1, N, SpellsID).

% Calcula o dano da habilidade do ID determinado.
% Retorna o dano na variável Damage
calculateDamage(ID, Damage) :-
    getNumDices(ID, Num),
    getSidesDice(ID, Sides),
    rollDices(Num, Sides, Damage).

% Imprime um titulo de apresentação da habilidade de ID determinado.
% Formato: "NomeDaHabilidade (X MP)"
printSpellLabel(ID) :-
    getName(ID, Name),
    getManaCost(ID, MP),
    write(Name), write(" ("), write(MP), writeln(" MP)").
