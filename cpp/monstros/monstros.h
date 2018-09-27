#include <iostream>
#include "../util.h"
#define QTD_COMENTARIOS 2
#define QTD_LINHAS 7
#define QTD_COLUNAS 9

struct Monstro {
	int id;
	string nome;
	int tipoDado;
	int numDado;
	int divisorDado;
	int somadorDado;
	int xp;
	string drop;
	int ca;
	int danoAtaque;
};

/**
 * @return todos os atributos dos monstros
 */
Monstro* carregarAtributos();

/**
 * Recebe um monstro como argumento. Calcula o HP do monstro a partir dos dados rolados;
 * @param monstro
 * @return hp do monstro
 */
int calcularHP(Monstro monstro);