#ifndef PERSONAGEM_H
#define PERSONAGEM_H
#include <iostream>
#include "../util.h"
#include "../itens/inventario.h"
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
void levelUp(Ficha &ficha);

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
 * @param ficha
 * @param xp
 */
void aumentarXP(Ficha &ficha, int xp);
#endif
