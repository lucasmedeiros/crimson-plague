#include <iostream>
#include <cmath>
#include "habilidades.h"
#include "personagem.h"
using namespace std;

#define HABILIDADES_POR_CIRCULO 1

Habilidade getHabilidade(string* informacoes) {
	Habilidade habilidade;
	habilidade.id = stoi(informacoes[0].c_str());
	habilidade.nome = informacoes[1];
	habilidade.descricao = informacoes[2];
	habilidade.circulo = stoi(informacoes[3].c_str());
	string* infoDado = split(informacoes[4], 'd', 2);
	habilidade.numDados = stoi(infoDado[0].c_str());
	habilidade.tipoDado = stoi(infoDado[1].c_str());
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
		int *valores = rolarDados(habilidade.tipoDado, habilidade.numDados);
		for(int i = 0; i < habilidade.numDados; i++) dano += valores[i];
		ficha.personagem.mp -= habilidade.mp;
	}

	return dano;
}

int qtdHabilidadesDisponiveis(Ficha ficha) {
	int qtdHabilidades = 0;
	if (ficha.personagem.classe == Classe::MAGO) {
		int circulo = floor((ficha.personagem.level - 1) / 2);
		qtdHabilidades = (circulo + 1) * HABILIDADES_POR_CIRCULO;
	}
	return qtdHabilidades; 
}

bool temManaSuficiente(Habilidade habilidade, Ficha ficha) {
	return getMP(ficha) >= habilidade.mp;
}