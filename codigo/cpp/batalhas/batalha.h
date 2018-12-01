#ifndef BATALHA_H
#define BATALHA_H
#include <iostream>
#include "../personagem/personagem.h"
#include "../personagem/habilidades.h"
#include "../monstros/monstros.h"
#include "../itens/inventario.h"
#include "../itens/item.h"
#include "../gui.h"
using namespace std;

// definições fixas
#define ZERO_HP 0
#define RESULTADO_DEFESA_MAGIA 10
#define D20 20

/**
* Enumeração das opções das batalhas
*/
enum OpcoesBatalha{
    ATACAR = 1, ABRIR, FUGIR
};


/**
* Função que inicia uma batalha.
* @param ficha ficha do personagem
* @param monstro o inimigo que será enfrentado
*/
void iniciaBatalha(WINDOW* janelaMenu, WINDOW* janelaDialogo, Ficha &ficha, Monstro monstro);

/**
* Função que diz se o personagem venceu a batalha.
*/
bool venceu();

/**
* Função que diz se o personagem fugiu da batalha.
*/
bool fugiuDaBatalha();

#endif
