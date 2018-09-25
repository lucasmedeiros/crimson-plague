#include<iostream>
#include"inventario.h"

using namespace std;

int getDano(Inventario inv){return inv.equipados.arma.atrb.dano;}
int getDinheiro(Inventario inv){return inv.dinheiro;}

int getArmadura(Inventario inv){
    int armaduraTotal = 0;
    armaduraTotal += inv.equipados.armadura.atrb.armadura;
    armaduraTotal += inv.equipados.capacete.atrb.armadura;
    armaduraTotal += inv.equipados.botas.atrb.armadura;
    return armaduraTotal;
}

void droparItens(int id,Inventario inv){
    Item* itens = inv.inventario; 
    for(int i = 0; i < 20; i++){
    }
}

void equiparItem(int id,Inventario inv){
    Item* itens = inv.inventario;
    bool existe = false;
     for(int i = 0; i < 20; i++){
         if(itens[i].id == id){
            existe = true;
            switch(itens[i].atrb.tipoEquipavel){
                case ARMA:
                    Item *item = &inv.equipados.arma;
                    inv.equipados.arma = itens[i];
                    itens[i] = *item;
                    break;
                case ARMADURA:
                    Item *item = &inv.equipados.armadura;
                    inv.equipados.armadura = itens[i];
                    itens[i] = *item;
                    break;
                case CAPACETE:
                    Item *item = &inv.equipados.capacete;
                    inv.equipados.capacete = itens[i];
                    itens[i] = *item;
                    break;
                case BOTAS:
                    Item *item = &inv.equipados.botas;
                    inv.equipados.botas = itens[i];
                    itens[i] = *item;
                    break;
                default:
                    Item *item = &inv.equipados.escudo;
                    inv.equipados.escudo = itens[i];
                    itens[i] = *item;
                    break;
            }
        }  
    }
    if(!existe){
        cout << "item não encontrado" << endl;
    }
}

