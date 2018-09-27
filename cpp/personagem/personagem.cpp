#include <iostream>
#include <cmath>
#include "personagem.h"
using namespace std;

// CONSTANTES
#define MULT_VIT_HP 2
#define MULT_INT_MP 2
#define HP_BASE 20
#define SP_BASE 20

void adicionaDinheiro(Ficha &ficha, int quantia) { ficha.inventario.dinheiro += quantia; }

int getHP(Ficha ficha) { return ficha.personagem.hp; }
int getMaxHP(Ficha ficha) {
	return (HP_BASE + round(ficha.atributos.vitalidade * MULT_VIT_HP));
}

int getMP(Ficha ficha) { return ficha.personagem.mp; }
int getMaxMP(Ficha ficha) {
	return (SP_BASE + round(ficha.atributos.inteligencia * MULT_INT_MP));
}

int getLevel(Ficha ficha) { return ficha.personagem.level; }
void levelUp(Ficha &ficha) { ficha.personagem.level += 1; }

void aumentarXP(Ficha &ficha, int xp) {
	ficha.personagem.xpAtual += xp;
	if (ficha.personagem.xpAtual >= ficha.personagem.xpMaxima) {
		levelUp(ficha);
		ficha.personagem.xpAtual = ficha.personagem.xpAtual % ficha.personagem.xpMaxima;
	}
}

int getDano(Ficha ficha) {
	int atributoDeClasse;

	if (ficha.personagem.classe == Classe::GUERREIRO)
		atributoDeClasse = getForcaTotal(ficha);
	else if (ficha.personagem.classe == Classe::MAGO)
		atributoDeClasse = getInteligenciaTotal(ficha);
	else
		atributoDeClasse = getDestrezaTotal(ficha);

	return floor(atributoDeClasse/4) + getDanoItens(ficha.inventario);
};

int getDefesa(Ficha ficha) {
	int armadura = getArmadura(ficha.inventario);
	return 10 + armadura + floor(getDestrezaTotal(ficha)/4);
};

string getNome(Ficha ficha) { return ficha.personagem.nome; }

int getForcaTotal(Ficha ficha) {
	return ficha.atributos.forca + getForca(ficha.inventario);
}

int getInteligenciaTotal(Ficha ficha) {
	return ficha.atributos.inteligencia + getInteligencia(ficha.inventario);
}

int getDestrezaTotal(Ficha ficha) {
	return ficha.atributos.destreza + getDestreza(ficha.inventario);
}

int getDinheiro(Inventario inventario) {
	return inventario.dinheiro;
}