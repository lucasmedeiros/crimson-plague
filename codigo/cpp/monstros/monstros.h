#ifndef MONSTRO_H
#define MONSTRO_H
#include <iostream>
#include "../util.h"
#define QTD_COMENTARIOS_MONSTROS 2
#define QTD_LINHAS_MONSTROS 7
#define QTD_COLUNAS_MONSTROS 9

struct Monstro {
	int id;
	string nome;
	int tipoDado;
	int numDado;
	int divisorDado;
	int somadorDado;
	int xp;
	int drop;
	int ca;
	int danoAtaque;
};

/**
 * @return todos os atributos dos monstros
 */
Monstro* carregarAtributosMonstros();

/**
 * Recebe um monstro como argumento. Calcula o HP do monstro a partir dos dados rolados;
 * @param monstro
 * @return hp do monstro
 */
int calcularHPMonstro(Monstro monstro);
#endif
