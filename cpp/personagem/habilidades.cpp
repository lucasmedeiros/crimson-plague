#include <iostream>
#include "habilidades.h"
using namespace std;

Habilidade getHabilidade(int id) {
	string* informacoes = importar(id, "../../db/habilidades_db.txt", 5, 2);
	Habilidade habilidade;
	habilidade.id = id;
	habilidade.nome = informacoes[1];
	habilidade.descricao = informacoes[2];
	habilidade.circulo = stoi(informacoes[3].c_str());
	habilidade.dado = stoi(informacoes[4].c_str());
	return habilidade;
}

int calculaDano(int id, int nivelPersonagem) {
	Habilidade habilidade = getHabilidade(id);
	int dano = 0;

	// Escala com o nível se for uma hab de circulo 0
	if (habilidade.circulo == 0 && nivelPersonagem >= 5) {
		int qtdDados;
		
		if (nivelPersonagem >= 5 && nivelPersonagem < 11) {
			qtdDados = 2;
		} else if (nivelPersonagem >= 11 && nivelPersonagem < 17) {
			qtdDados = 3;
		} else {
			qtdDados = 4;
		}

		int *valores = rolarDados(habilidade.dado, qtdDados);
		for(int i = 0; i < qtdDados; i++) dano += valores[i];
	} else {
		dano = rolarDado(habilidade.dado);
	}

	return dano;
}