#ifndef INVENTARIO_H
#define INVENTARIO_H
#include<iostream>
#include "item.h"
#include "../util.h"

using namespace std;

struct Equipados{
    Item arma;
    Item armadura;
    Item botas;
    Item capacete;
    Item escudo;
};

struct Inventario{
    Item* tdsItens;
    Item* inventario;
    Classe classe;
    int* quantidade;
    Equipados equipados;
    int dinheiro;

};

void printarInventario(Inventario inventario);

/**
*@return o numero de espacos vazios no inventario
*/
int qtdVazios(Inventario inventario);

/**
 * inicia o inventario com os itens basicos
 */
void iniciarItensBasicos(Inventario Inventario);

/**
 *@return o dano total dos itens equipados
 */

int getDanoItens(Inventario inv);

/**
 * @return a armadura total equipada
 */
int getArmadura(Inventario inv);

/**
 * Dropa um item especifico pelo id
 */
void droparItem(int id,Inventario inv);

/**
 * Adiciona um item ao inventario pelo id
 */
void pegarItem(int id,Inventario inv);

/**
 * Equipa um item do inventario pelo id
 */
void equiparItem(int id,Inventario inv);

/**
 * adiciona um item ao inventario pelo id
 */
void adicionarItem(int id,Inventario inv);

/**
 * @return a quantidade de espacos vazios no inventario
 */
int qtdVazios(Inventario inv);

/**
 * @return se contem ou não um item especifico no inventario pelo id 
 */
bool contemItem(int id, Inventario inv);
/**
 * @return o total de inteligencia dos itens equipados
 */
int getInteligencia(Inventario inv);

/**
 * @return o total de Força dos itens equipados
 */
int getForca(Inventario inv);

/**
 * @return o total de Destreza dos itens equipados
 */
int getDestreza(Inventario inv);
#endif
