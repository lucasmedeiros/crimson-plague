#include <iostream>
#include <cmath>
#include "personagem.h"
using namespace std;

// CONSTANTES
#define MULT_VIT_HP 2
#define MULT_INT_MP 2
#define HP_BASE 20
#define SP_BASE 20

int getHP(Ficha ficha) { return ficha.personagem.hp; }
int getMaxHP(Ficha ficha) {
	return (HP_BASE + round(ficha.atributos.vitalidade * MULT_VIT_HP));
}

int getMP(Ficha ficha) { return ficha.personagem.mp; }
int getMaxMP(Ficha ficha) {
	return (SP_BASE + round(ficha.atributos.inteligencia * MULT_INT_MP));
}

int getLevel(Ficha ficha) { return ficha.personagem.level; }
int levelUp(Ficha &ficha) { ficha.personagem.level += 1; }

int getDano(Ficha ficha) {
	int danoBase = 10;
	int atributoDeClasse;
	float multiplicador = 0.5;

	if (ficha.personagem.classe == Classe::GUERREIRO)
		atributoDeClasse = ficha.atributos.forca;
	else if (ficha.personagem.classe == Classe::MAGO)
		atributoDeClasse = ficha.atributos.inteligencia;
	else
		atributoDeClasse = ficha.atributos.destreza;

	return danoBase + round(multiplicador * atributoDeClasse);
};

int getDefesa(Ficha ficha) {
	return 0;
};

string getNome(Ficha ficha) { return ficha.personagem.nome; }