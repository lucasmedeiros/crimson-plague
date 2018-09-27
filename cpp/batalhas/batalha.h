#ifndef BATALHA_H
#define BATALHA_H
#include <iostream>
#include "../personagem/personagem.h"
#include "../personagem/habilidades.h"
#include "../monstros/monstros.h"
#include "../itens/inventario.h"
using namespace std;

// definições fixas
#define ZERO_HP 0
#define RESULTADO_DEFESA_MAGIA 10
#define D20 20

/**
* Enumeração das opções das batalhas
*/
enum OpcoesBatalha{
    ATACAR = 1, FUGIR
};


/**
* Função que inicia uma batalha.
* @param ficha ficha do personagem
* @param monstro o inimigo que será enfrentado
*/
void iniciaBatalha(Ficha &ficha, Monstro monstro);

/**
* Função que diz se o personagem venceu a batalha.
*/
bool venceu();

/**
* Função que diz se o personagem fugiu.
*/
bool personagemFugiu();

/**
* Função que retorna o id do drop do monstro.
* se for -1, quer dizer que o monstro não dropou nada.
*/
int dropMonstro();
#endif
