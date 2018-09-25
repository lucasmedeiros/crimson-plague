#include<iostream>
#include"inventario.h"

using namespace std;

int getDano(Inventario inventario){return getDano(inventario.equipados.arma);}
int getDinheiro(Inventario inventario){return inventario.dinheiro;}
Item getArm(Inventario inventario){return inventario.equipados.armadura;}
Item getArma(Inventario inventario){return inventario.equipados.arma;}
Item getCapacete(Inventario inventario){return inventario.equipados.capacete;}
Item getBotas(Inventario inventario){return inventario.equipados.botas;}
Item getEscudo(Inventario inventario){return inventario.equipados.escudo;}

int getArmadura(Inventario inventario){
    int armaduraTotal = 0;
    armaduraTotal += getArmadura(inventario.equipados.armadura);
    armaduraTotal += getArmadura(inventario.equipados.capacete);
    armaduraTotal += getArmadura(inventario.equipados.botas);
    return armaduraTotal;
}

void droparItens(int id,Inventario inventario){
    Item* itens = inventario.inventario; 
    for(int i = 0; i < 20; i++){
    }
}

void equiparItem(int id,Inventario inventario){
    Item* itens = inventario.inventario;
    bool existe = false;
     for(int i = 0; i < 20; i++){
         if(itens[i].id == id){
            existe = true;
            Item* item;
            switch(getTipo(itens[i])){
                case ARMA:
                    item = &inventario.equipados.arma;
                    inventario.equipados.arma = itens[i];
                    itens[i] = *item;
                    break;
                case ARMADURA:
                    item = &inventario.equipados.armadura;
                    inventario.equipados.armadura = itens[i];
                    itens[i] = *item;
                    break;
                case CAPACETE:
                    item = &inventario.equipados.capacete;
                    inventario.equipados.capacete = itens[i];
                    itens[i] = *item;
                    break;
                case BOTAS:
                    item = &inventario.equipados.botas;
                    inventario.equipados.botas = itens[i];
                    itens[i] = *item;
                    break;
                default:
                    item = &inventario.equipados.escudo;
                    inventario.equipados.escudo = itens[i];
                    itens[i] = *item;
                    break;
            }
        }  
    }
    if(!existe){
        cout << "item não encontrado" << endl;
    }
}

