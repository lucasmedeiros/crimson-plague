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

Monstro* carregarAtributosMonstros() {
	string** atributos = importarTodos("../db/monstros_db.txt"
		,QTD_COLUNAS_MONSTROS, QTD_LINHAS_MONSTROS, QTD_COMENTARIOS_MONSTROS);
	Monstro* monstros = new Monstro[QTD_LINHAS_MONSTROS];
	for(int i = 0; i < QTD_LINHAS_MONSTROS; i++)
		monstros[i] = getMonstro(atributos[i]);
	return monstros;
};

int calcularHPMonstro(Monstro monstro) {
	int hp = 0;

	int *valores = rolarDados(monstro.tipoDado, monstro.numDado);
	for(int i = 0; i < monstro.numDado; i++) hp += valores[i];
	hp = max(((hp / monstro.divisorDado) + monstro.somadorDado), 3);

	return hp;
};
