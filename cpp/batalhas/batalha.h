#include <iostream>
#include "../personagem/personagem.h"
#include "../personagem/habilidades.h"
using namespace std;

/**
* Função que inicia uma batalha.
*/
void iniciaBatalha(Ficha &ficha);

/**
* Função que diz se o personagem venceu a batalha.
*/
bool venceu();

/**
* Função que diz se o personagem fugiu.
*/
bool personagemFugiu();


/**
* Enumeração das opções das batalhas
*/
enum OpcoesBatalha{
    ATACAR = 1, FUGIR
};
