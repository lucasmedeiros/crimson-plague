#include <iostream>
#include "../util.h"
#include "personagem.h"
#define QTD_HABILIDADES 4
#define QTD_COMENTARIOS 2
#define QTD_COLUNAS 6
using namespace std;

struct Habilidade {
	int id;
	string nome;
	string descricao;
	int circulo;
	int tipoDado;
	int numDados;
	int mp;
};

/**
 * @return todas as habilidades do jogo
 */
Habilidade* carregarHabilidades();

/**
 * Calcula a quantidade de habilidades disponiveis para o personagem usar
 * de acordo com o seu nível e classe
 * @param ficha
 * @return quantidade de habilidades disponiveis
 */
int qtdHabilidadesDisponiveis(Ficha ficha);

/**
 * Usa a habilidade passa como parâmetro. Consome MP e retorna o dano causado;
 * @param habilidade
 * @param ficha
 * @return dano causado
 */
int usarHabilidade(Habilidade habilidade, Ficha &ficha);

/**
 * Verifica se o personagem possui mana suficiente para usar uma habilidade.
 * @param habilidade
 * @param ficha
 * @return true, se houver mana suficiente. Caso contrário, false.
 */ 
bool temManaSuficiente(Habilidade habilidade, Ficha ficha);
