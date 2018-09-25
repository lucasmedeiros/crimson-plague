#include<iostream>
#include "../main.h"
#include "item.h"

using namespace std;

struct Equipados;

struct Inventario{
    Item* inventario = new Item[20];
    Equipados equipados;
    int dinheiro;
    
};

struct Equipados{
    Item arma;
    Item armadura;
    Item botas;
    Item capacete;
    Item escudo;
};

int getDano(Inventario inv);
int getArmadura(Inventario inv);
void droparItem(int id,Inventario inv);
void pegarItem(int id,Inventario inv);
void equiparItem(int id,Inventario inv);
int getDinheiro(Inventario inv);

