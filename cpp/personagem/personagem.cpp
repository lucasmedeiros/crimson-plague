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
	distribuiPontos(ficha);
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

void distribuiPontos(Ficha &ficha) {
	int pontos = 8;
	char opcao = 'n';
	int atr, addPontos;

	string atributos[6] = {"Força", "Vitalidade", "Inteligência", "Sorte", "Destreza", "Carisma"};
	int* valores[6] = { &ficha.atributos.forca, &ficha.atributos.vitalidade,
						&ficha.atributos.inteligencia, &ficha.atributos.sorte,
						&ficha.atributos.destreza, &ficha.atributos.carisma };

	cout << endl << "Você pode distribuir " << pontos << " pontos pelos seus atributos:" << endl;

	while(pontos > 0){
		string entrada;

		cout << "1. Força\t(" << ficha.atributos.forca << ")" << endl;
		cout << "2. Vitalidade\t(" << ficha.atributos.vitalidade << ")" << endl;
		cout << "3. Inteligência\t(" << ficha.atributos.inteligencia << ")" << endl;
		cout << "4. Sorte\t(" << ficha.atributos.sorte << ")" << endl;
		cout << "5. Destreza\t(" << ficha.atributos.destreza << ")"<< endl;
		cout << "6. Carisma\t(" << ficha.atributos.carisma << ")" <<  endl;
		cout << "Pontos disponiveis: " << pontos << endl << endl;;

		cout << "Deseja adicionar pontos a qual atributo? ";

		cin >> entrada;
		while(!isdigit(entrada[0])){
			cout << "Entrada inválida" << endl;
			cout << "Deseja adicionar pontos a qual atributo? ";
			cin >> entrada;
		}

		atr = stoi(entrada);

		if(0 < atr && atr < 7){
			cout << "Adicionar quantos pontos ao atributo " << atributos[atr - 1] << " ? ";
			cin >> entrada;
			while(!isdigit(entrada[0])){
				cout << "Entrada inválida!" << endl;
				cout << "Adicionar quantos pontos ao atributo " << atributos[atr - 1] << " ? ";
				cin >> entrada;
			}

			cout << endl;

			addPontos = stoi(entrada);

			if(addPontos <= pontos){
				if(addPontos > 0){
					cout << atributos[atr - 1] << " (" << *valores[atr - 1] << " -> " << *valores[atr - 1] + addPontos << ")" << endl;
					cout << "Pontos restantes: " << pontos - addPontos << endl;
					cout << "Tem certeza? (S/N): ";
					cin >> opcao;

					if(tolower(opcao) == 's'){
						*valores[atr - 1] += addPontos;
						pontos -= addPontos;
					}
				} else {
					cout << "Quantidade de pontos inválida, adicione uma quantidade válida" << endl << endl;
				}
			} else {
				cout << "Pontos insuficientes" << endl << endl;
			}
		} else {
			cout << "Opção inválida!" << endl << endl;
		}
	}
	
	cout << endl;
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