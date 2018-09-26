#ifndef INVENTARIO_H
#define INVENTARIO_H
#include<iostream>
#include "../main.h"
#include "item.h"

using namespace std;

struct Equipados{
    Item arma;
    Item armadura;
    Item botas;
    Item capacete;
    Item escudo;
};

struct Inventario{
    Item* inventario;
    Equipados equipados;
    int dinheiro;
    
};

void iniciarItensBasicos(Inventario Inventario);

/**
 *@return o dano total dos itens equipados 
 */
 
int getDano(Inventario inv);

/**
 * @return a armadura total equipada
 */
int getArmadura(Inventario inv);

/**
 * Dropa um item especifico pelo id 
 */
void droparItem(int id,Inventario inv);

/**
 * @return a armadura equipada
 */
Item getArm(Inventario inventario);

/**
 * @return a arma equipada
 */
Item getArma(Inventario inventario);

/**
 * @return a bota equipada
 */
Item getBotas(Inventario inventario);

/**
 * @return o capacete equipado
 */
Item getCapacete(Inventario inventario);

/**
 * @return o escudo equipado
 */
Item getEscudo(Inventario inventario);
/**
 * Adiciona um item ao inventario pelo id 
 */
void pegarItem(int id,Inventario inv);

/**
 * Equipa um item do inventario pelo id
 */
void equiparItem(int id,Inventario inv);

/**
 * @return o dinheiro total guardado do personagem
 */ 
int getDinheiro(Inventario inv);

/**
 *Adiciona certo valor ao dinheiro total do personagem 
 */
void addDinheiro(int dinheiro, Inventario inv);
#endif