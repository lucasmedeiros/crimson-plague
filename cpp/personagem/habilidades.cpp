#include <iostream>
#include <cmath>
#include "habilidades.h"
#include "personagem.h"
using namespace std;

Habilidade getHabilidade(string* informacoes) {
	Habilidade habilidade;
	habilidade.id = stoi(informacoes[0].c_str());
	habilidade.nome = informacoes[1];
	habilidade.descricao = informacoes[2];
	habilidade.circulo = stoi(informacoes[3].c_str());
	habilidade.dado = stoi(informacoes[4].c_str());
	habilidade.mp = stoi(informacoes[5].c_str());
	return habilidade;
}

Habilidade* carregarHabilidades() {
	string** linhas;
	linhas = importarTodos("../db/habilidades_db.txt", QTD_COLUNAS, QTD_HABILIDADES, QTD_COMENTARIOS);
	Habilidade* habilidades = new Habilidade[QTD_HABILIDADES];
	for(int i = 0; i < QTD_HABILIDADES; i++)
		habilidades[i] = getHabilidade(linhas[i]);
	return habilidades;
}

int usarHabilidade(Habilidade habilidade, Ficha &ficha) {
	int dano = 0;
	int levelPersonagem = ficha.personagem.level;
	if (ficha.personagem.mp >= habilidade.mp && ficha.personagem.classe == Classe::MAGO) {
		// Escala com o nível se for uma hab de circulo 0
		if (habilidade.circulo == 0 && levelPersonagem >= 5) {
			int qtdDados;
			
			if (levelPersonagem >= 5 && levelPersonagem < 11) {
				qtdDados = 2;
			} else if (levelPersonagem >= 11 && levelPersonagem < 17) {
				qtdDados = 3;
			} else {
				qtdDados = 4;
			}

			int *valores = rolarDados(habilidade.dado, qtdDados);
			for(int i = 0; i < qtdDados; i++) dano += valores[i];
		} else {
			dano = rolarDado(habilidade.dado);
		}

		ficha.personagem.mp -= habilidade.mp;
	}

	return dano;
}

int qtdHabilidadesDisponiveis(Ficha ficha) {
	int qtdHabilidades = 0;
	if (ficha.personagem.classe == Classe::MAGO) {
		int circulo = floor((ficha.personagem.level - 1) / 2);
		qtdHabilidades = (circulo + 1) * 4;
	}
	return qtdHabilidades; 
}
