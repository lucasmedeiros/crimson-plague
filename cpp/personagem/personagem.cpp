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
int getMaxHP(Ficha ficha) { return (HP_BASE + round(ficha.atributos.vitalidade * MULT_VIT_HP)); }
int getMP(Ficha ficha) { return ficha.personagem.mp; }
int getMaxMP(Ficha ficha) { return (SP_BASE + round(ficha.atributos.inteligencia * MULT_INT_MP)); }

int getLevel(Ficha ficha) { return ficha.personagem.level; }
void levelUp(Ficha &ficha) { 
	ficha.personagem.level += 1;
	// distribuiPontos(window, ficha);
}

void usarItemConsumivel(int numeroListado,Ficha &ficha){
	Item item = ficha.inventario.mochila[numeroListado - 1];
	if(item.consumivel){
	if(item.recHPMax > 0){
		if(ficha.personagem.hp +item.recHPMax  - getMaxHP(ficha) >= 0)
			ficha.personagem.hp = getMaxHP(ficha);
		else
			ficha.personagem.hp += item.recHPMax;
	}else{
		if(ficha.personagem.mp +item.recMPMax  - getMaxMP(ficha) >= 0)
			ficha.personagem.mp = getMaxMP(ficha);
		else
			ficha.personagem.mp += item.recMPMax;
	}

	venderItem(numeroListado,ficha.inventario);

	}else{
		cout << "Item não é consumivel" << endl;
	} 
}

void aumentarXP(Ficha &ficha, int xp) {
	ficha.personagem.xpAtual += xp;
	if (ficha.personagem.xpAtual >= ficha.personagem.xpMaxima) {
		levelUp(ficha);
		ficha.personagem.xpAtual = ficha.personagem.xpAtual % ficha.personagem.xpMaxima;
	}
}

int getDano(Ficha ficha) {
	int modificador;

	if (ficha.personagem.classe == Classe::GUERREIRO)
		modificador = getModificadorFOR(ficha);
	else if (ficha.personagem.classe == Classe::MAGO)
		modificador = getModificadorINT(ficha);
	else
		modificador = getModificadorDES(ficha);

	return modificador + getDanoItens(ficha.inventario);
};

int getDefesa(Ficha ficha) {
	int armadura = getArmadura(ficha.inventario);
	return 10 + armadura + getModificadorDES(ficha);
};

void distribuiPontos(WINDOW *window, Ficha &ficha) {
	string atributos[6] = {"Força", "Vitalidade", "Inteligência", "Sorte", "Destreza", "Carisma"};
	int* valores[6] = { &ficha.atributos.forca, &ficha.atributos.vitalidade,
						&ficha.atributos.inteligencia, &ficha.atributos.sorte,
						&ficha.atributos.destreza, &ficha.atributos.carisma };

	int pontos = 8, pontosAdicionados = 0, opcaoQuantidade;
	string qtdLabel[8] = {"1","2","3","4","5","6","7","8"};
	string titulo;
	bool confirmou;
	while(pontos > 0) {
		confirmou = false;
		titulo = "Selecione um atributo para distribuir seus pontos";
		int escolhaAtributo = realizaPergunta(window, titulo, atributos, 6);
		opcaoQuantidade = realizaPergunta(window, "Selecione a quantidade",qtdLabel,8);

		if (opcaoQuantidade + 1 <= pontos) {
			confirmou = confirmacao(window);
		}

		if (confirmou) {
			pontosAdicionados = (opcaoQuantidade + 1);
			*valores[escolhaAtributo] += pontosAdicionados;
			pontos -= pontosAdicionados;
		}
	}
}

string getNome(Ficha ficha) { return ficha.personagem.nome; }
int getForcaTotal(Ficha ficha) { return ficha.atributos.forca + getForca(ficha.inventario); }
int getInteligenciaTotal(Ficha ficha) { return ficha.atributos.inteligencia + getInteligencia(ficha.inventario); }
int getDestrezaTotal(Ficha ficha) { return ficha.atributos.destreza + getDestreza(ficha.inventario); }
int getDinheiro(Inventario inventario) { return inventario.dinheiro; }
void alteraVitalidade(Ficha &ficha, int quantia) { ficha.atributos.vitalidade += quantia; }
int getModificadorDES(Ficha ficha) { return floor(getDestrezaTotal(ficha)/4); }
int getModificadorINT(Ficha ficha) { return floor(getInteligenciaTotal(ficha)/4); }
int getModificadorFOR(Ficha ficha) { return floor(getForcaTotal(ficha)/4); }