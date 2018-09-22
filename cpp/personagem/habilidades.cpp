#include <iostream>
#include "habilidades.h"
using namespace std;

Habilidade getHabilidade(int id) {
	string* informacoes = importar(id, "../../db/habilidades_db.txt", 24, 2);
	Habilidade habilidade;
	habilidade.id = id;
	habilidade.nome = informacoes[1];
	habilidade.descricao = informacoes[2];
	habilidade.dado = stoi(informacoes[3].c_str());

	for(int i = 4; i <= 23; i++)
		habilidade.qtdDados[i - 4] = stoi(informacoes[i].c_str());

	return habilidade;
}

int calculaDano(int id, int nivelPersonagem) {
	Habilidade habilidade = getHabilidade(id);
	int qtdDados = habilidade.qtdDados[nivelPersonagem - 1];
	int dano = 0;

	int *valores = rolarDados(habilidade.dado, qtdDados);
	for(int i = 0; i < qtdDados; i++) dano += valores[i];
	return dano;
}