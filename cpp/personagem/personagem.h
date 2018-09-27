#ifndef PERSONAGEM_H
#define PERSONAGEM_H
#include <iostream>
#include "../util.h"
#include "../itens/inventario.h"
#include "../gui.h"
using namespace std;

struct Personagem {
  string nome;
  Classe classe;
  int hp = 20;
  int mp = 10;
  int xpAtual = 0;
  int xpMaxima = 1000;
  int level = 1;
};

struct Atributos {
  int forca = 9;
  int vitalidade = 9;
  int sorte = 9;
  int destreza = 9;
  int carisma = 9;
  int inteligencia = 9;
};

struct Ficha {  
  Personagem personagem;
  Atributos atributos;
  Inventario inventario;
};

string getNome(Ficha ficha);
int getDano(Ficha ficha);
int getDefesa(Ficha ficha);
int getLevel(Ficha ficha);
int getMaxHP(Ficha ficha);
int getHP(Ficha ficha);
int getMaxMP(Ficha ficha);
int getMP(Ficha ficha);
void levelUp(WINDOW *window, Ficha &ficha);


void usarItemConsumivel(int numero,Ficha &ficha);
/**
 * Exibe opções de distribuições de pontos de atributos.
 * @param ficha
 * @param window
 */
void distribuiPontos(WINDOW *window, Ficha &ficha);

/**
 * Retorna o total de destreza do personagem dividido por 4 (arredondado pra baixo)
 * @param ficha
 * @return modificador de destreza
 */
int getModificadorDES(Ficha ficha);

/**
 * Retorna o total de força do personagem dividido por 4 (arredondado pra baixo)
 * @param ficha
 * @return modificador de força
 */
int getModificadorFOR(Ficha ficha);

/**
 * Retorna o total de inteligência do personagem dividido por 4 (arredondado pra baixo)
 * @param ficha
 * @return modificador de inteligência
 */
int getModificadorINT(Ficha ficha);

/**
 * Adiciona a quantia especificada à vitalidade do personagem.
 * @param ficha
 * @param quantia
 */
void alteraVitalidade(Ficha &ficha, int quantia);

/**
 * Retorna a quantidade atual de dinheiro do personagem
 * @param inventario
 * @return dinheiro
 */
int getDinheiro(Inventario inventario);  

/**
 * Retorna a força total do personagem.
 * @param ficha
 * @return soma da força base + força provinda dos itens
 */
int getForcaTotal(Ficha ficha);

/**
 * Retorna a inteligência total do personagem.
 * @param ficha
 * @return soma da inteligência base + inteligência provinda dos itens
 */
int getInteligenciaTotal(Ficha ficha);

/**
 * Retorna a destreza total do personagem.
 * @param ficha
 * @return soma da destreza base + destreza provinda dos itens
 */
int getDestrezaTotal(Ficha ficha);

/** 
 * Adiciona a quantia especificada de dinheiro ao inventário do personagem;
 * @param ficha
 * @param quantia
 */
void adicionaDinheiro(Ficha &ficha, int quantia);

/**
 * Incrementa a experiência do personagem.
 * @param window
 * @param ficha
 * @param xp
 */
// void aumentarXP(WINDOW *window, Ficha &ficha, int xp);
void aumentarXP(Ficha &ficha, int xp);
#endif
