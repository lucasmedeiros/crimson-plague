#include <iostream>
#include <cmath>
#include "monstros.h"
using namespace std;

Monstro getMonstro(string* informacoes) {
	Monstro monstro;
	monstro.id = stoi(informacoes[0].c_str());
	monstro.nome = informacoes[1];
	string* infoDado = split(informacoes[2],'d', 2);
	monstro.numDado = stoi(infoDado[0].c_str());
	monstro.tipoDado = stoi(infoDado[1].c_str());
	monstro.divisorDado = stoi(informacoes[3].c_str());
	monstro.somadorDado = stoi(informacoes[4].c_str());
	monstro.xp = stoi(informacoes[5].c_str());
	monstro.drop = stoi(informacoes[6].c_str());
	monstro.ca = stoi(informacoes[7].c_str());
	monstro.danoAtaque = stoi(informacoes[8].c_str());
	return monstro;
}

Monstro* carregarAtributos() {
	string** atributos = importarTodos("../db/atrMonstros.txt",QTD_COLUNAS, QTD_LINHAS, QTD_COMENTARIOS);
	Monstro* monstros = new Monstro[QTD_LINHAS];
	for(int i = 0; i < QTD_LINHAS; i++)
		monstros[i] = getMonstro(atributos[i]);
	return monstros;
};

int calcularHP(Monstro monstro) {

};
