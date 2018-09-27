#include<iostream>
#include"inventario.h"
#include "../util.h"

using namespace std;

int getDanoItens(Inventario inventario){return getDano(inventario.equipados.arma);}

void iniciarItensBasicos(Inventario inventario){
    Item* todosItens = inventario.tdsItens;
    if(inventario.classe == GUERREIRO){
        inventario.equipados.arma = todosItens[29];
        inventario.equipados.armadura = todosItens[35];
        inventario.equipados.botas = todosItens[24];
        inventario.equipados.capacete = todosItens[39];
    }else if(inventario.classe == MAGO){
        inventario.equipados.arma = todosItens[36];
        inventario.equipados.armadura = todosItens[38];
        inventario.equipados.botas = todosItens[24];
        inventario.equipados.capacete = todosItens[40];    
    }else{
        inventario.equipados.arma = todosItens[37];
        inventario.equipados.armadura = todosItens[44];
        inventario.equipados.botas = todosItens[24];
        inventario.equipados.capacete = todosItens[42]; 
    }
}

int getArmadura(Inventario inventario){
    int armaduraTotal = 0;
    armaduraTotal += inventario.equipados.armadura.atrb.armadura;
    armaduraTotal += inventario.equipados.capacete.atrb.armadura;
    armaduraTotal += inventario.equipados.botas.atrb.armadura;
    return armaduraTotal;
}

int getForca(Inventario inventario){
    int forcaTotal = 0;
    forcaTotal += inventario.equipados.arma.atrb.forca;
    forcaTotal += inventario.equipados.capacete.atrb.forca;
    forcaTotal += inventario.equipados.botas.atrb.forca;
    forcaTotal += inventario.equipados.armadura.atrb.forca;
    forcaTotal += inventario.equipados.escudo.atrb.forca;
    return forcaTotal;
}

int getInteligencia(Inventario inventario){
    int inteligenciaTotal = 0;
    inteligenciaTotal += inventario.equipados.arma.atrb.inteligencia;
    inteligenciaTotal += inventario.equipados.capacete.atrb.inteligencia;
    inteligenciaTotal += inventario.equipados.botas.atrb.inteligencia;
    inteligenciaTotal += inventario.equipados.armadura.atrb.inteligencia;
    inteligenciaTotal += inventario.equipados.escudo.atrb.inteligencia;
    return inteligenciaTotal;
}

int getDestreza(Inventario inventario){
    int DestrezaTotal = 0;
    DestrezaTotal += inventario.equipados.arma.atrb.destreza;
    DestrezaTotal += inventario.equipados.capacete.atrb.destreza;
    DestrezaTotal += inventario.equipados.botas.atrb.destreza;
    DestrezaTotal += inventario.equipados.armadura.atrb.destreza;
    DestrezaTotal += inventario.equipados.escudo.atrb.destreza;
    return DestrezaTotal;
}

void droparItens(int id,Inventario inventario){
    Item* itens = inventario.inventario;
    bool contem = false;
    for(int i = 0; i < 20; i++){
        if(itens[i].id == id){
            contem = true;
            if(inventario.quantidade[i] == 1){
                itens[i] = inventario.tdsItens[33];
                inventario.quantidade[i] = 0;
            }else{
                inventario.quantidade[i] -= 1;
            }
        }
    }
    if(!contem){
        cout << "Item não pertence ao inventário" << endl;
    }
}


int qtdVazios(Inventario inventario){
  int vazio  = 0;
  Item* itens = inventario.inventario;
  for(int i = 0; i < 20;i++){
    if(itens[i].id == 34){
      vazio +=1;
    }
  }
  return vazio;
}

bool contemItem(int id, Inventario inventario){
    Item* itens = inventario.inventario;
    bool contem = false;
    for(int i = 0; i < 20; i++){
        if(itens[i].id == inventario.tdsItens[id- 1].id){
            contem = true;
        }
    }
    return contem;
}

void adicionarItem(int id, Inventario inventario){
    Item* itens = inventario.inventario;
    if(contemItem(id, inventario)){
        for(int i = 0; i < 20; i++){
            if(itens[i].id == id){
                inventario.quantidade[i] += 1;
                break;
            }
        }

    }else{
        if(qtdVazios(inventario) > 0){
           for(int i = 0; i < 20; i++){
                if(itens[i].id == 34){
                    itens[i] = inventario.tdsItens[id - 1];
                    break;
            }
        } 
        }else{
            cout << "Inventário cheio" << endl;
        }
    }

}



void equiparItem(int id,Inventario inventario){
    Item* itens = inventario.inventario;
    bool existe = false;
     for(int i = 0; i < 20; i++){
         if(itens[i].id == id){
            existe = true;
            if(itens[i].atrb.classe == TODOS || itens[i].atrb.classe == inventario.classe){
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
    }
    if(!existe){
        cout << "item não encontrado" << endl;
    }
}

