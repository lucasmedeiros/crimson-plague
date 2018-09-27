#include<iostream>
#include"inventario.h"
#include "../util.h"

using namespace std;

int getDanoItens(Inventario inventario){return getDanoArma(inventario.equipados.arma);}

void iniciarItensBasicos(Inventario &inventario){
    Item* tdsItens = inventario.tdsItens;
    if(inventario.classe == 1){
        inventario.equipados.arma = tdsItens[29];
        inventario.equipados.armadura = tdsItens[35];
        inventario.equipados.botas = tdsItens[24];
        inventario.equipados.capacete = tdsItens[39];
        inventario.equipados.escudo = tdsItens[46];
    }else if(inventario.classe == 2){
        inventario.equipados.arma = tdsItens[36];
        inventario.equipados.armadura = tdsItens[38];
        inventario.equipados.botas = tdsItens[24];
        inventario.equipados.capacete = tdsItens[40];    
    }else{
        inventario.equipados.arma = tdsItens[37];
        inventario.equipados.armadura = tdsItens[44];
        inventario.equipados.botas = tdsItens[24];
        inventario.equipados.capacete = tdsItens[42]; 
    }
    
}

int getArmadura(Inventario inventario){
    int armaduraTotal = 0;
    armaduraTotal += inventario.equipados.armadura.atrb.armadura;    
    armaduraTotal += inventario.equipados.capacete.atrb.armadura;
    armaduraTotal += inventario.equipados.botas.atrb.armadura;
    if(inventario.classe == GUERREIRO){
        armaduraTotal += inventario.equipados.escudo.atrb.armadura;
    }
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

void droparItem(int numero,Inventario &inventario){
    Item* itens = inventario.inventario;
    if(itens[numero - 1].id != 34){
         if(inventario.quantidade[numero - 1] == 1){
            itens[numero - 1] = inventario.tdsItens[33];
            inventario.quantidade[numero - 1] = 0;
        }else{
            inventario.quantidade[numero - 1] -= 1;
        }
        
    }else{
        cout << "Posição Vazia!" << endl;
    }
}


int qtdVazios(Inventario inventario){
  int vazio  = 0;
  Item* itens = inventario.inventario;
  for(int i = 0; i < inventario.tamInvent;i++){
    if(itens[i].id == 34){
      vazio +=1;
    }
  }
  return vazio;
}

bool contemItem(int id, Inventario inventario){
    Item* itens = inventario.inventario;
    bool contem = false;
    for(int i = 0; i < inventario.tamInvent; i++){
        if(itens[i].id == inventario.tdsItens[id- 1].id){
            contem = true;
        }
    }
    return contem;
}

void adicionarItem(int id, Inventario &inventario){
    Item* itens = inventario.inventario;
    if(contemItem(id, inventario)){
        for(int i = 0; i < inventario.tamInvent; i++){
            if(itens[i].id == id){
                inventario.quantidade[i] += 1;
                break;
            }
        }

    }else{
        if(qtdVazios(inventario) > 0){
           for(int i = 0; i < inventario.tamInvent; i++){
                if(itens[i].id == 34){
                    itens[i] = inventario.tdsItens[id - 1];
                    inventario.quantidade[i] = 1; 
                    break;
            }
        } 
        }else{
            cout << "Inventário cheio" << endl;
        }
    }

}



void equiparItem(int numero, Inventario &inventario){
    Item* itens = inventario.inventario;
    Item item = inventario.inventario[numero -1];
    if(contemItem(item.id,inventario)){
     for(int i = 0; i < inventario.tamInvent; i++){
         if(itens[i].id == item.id){
            if(itens[i].atrb.classe == TODOS || itens[i].atrb.classe == inventario.classe){
                Item nEquipado;
                switch(getTipo(itens[i])){
                    case ARMA:
                        nEquipado = inventario.equipados.arma;
                        inventario.equipados.arma = item;
                        itens[i] = nEquipado;
                        break;
                    case ARMADURA:
                        nEquipado = inventario.equipados.armadura;
                        inventario.equipados.armadura = item;
                        itens[i] = nEquipado;
                        break;
                    case CAPACETE:
                        nEquipado = inventario.equipados.capacete;
                        inventario.equipados.capacete = item;
                        itens[i] = nEquipado;
                        break;
                    case BOTAS:
                        nEquipado = inventario.equipados.botas;
                        inventario.equipados.botas = item;
                        itens[i] = nEquipado;
                        break;
                    default:
                        nEquipado = inventario.equipados.escudo;
                        inventario.equipados.escudo = item;
                        itens[i] = nEquipado;
                        break;
                }
            }
        }
    }

    }else{
        cout << "item não encontrado" << endl;
    }
}


void imprimeInventario(Inventario inventario){
    cout << "======================== Inventário ========================" << endl << endl;
    cout << "====== Equipados ======" << endl;
    cout << "| Arma: " << inventario.equipados.arma.nome << endl;
    cout << "| Armadura: " << inventario.equipados.armadura.nome << endl;
    cout << "| Capacete: " << inventario.equipados.capacete.nome << endl;
    cout << "| Botas: " << inventario.equipados.botas.nome << endl;
    cout << "| Escudo: " << inventario.equipados.escudo.nome << endl << endl;
    cout << "======= Mochila =======" << endl;
    for(int i = 0; i < inventario.tamInvent; i++){
        if(inventario.inventario[i].id != 34){
            cout << "| " << i + 1 << '.' << inventario.inventario[i].nome << " (" << inventario.quantidade[i] << "x)" <<  endl; 
        }else{
           cout << "| " << i + 1 << '.' << inventario.inventario[i].nome  <<  endl; 
        }
    }
    cout << "=======================" << endl;

}