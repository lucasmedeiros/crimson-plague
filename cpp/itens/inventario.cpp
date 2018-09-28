#include<iostream>
#include"inventario.h"
#include "../util.h"

using namespace std;

int getDanoItens(Inventario inventario){return getDanoArma(inventario.equipados.arma);}

void iniciarItensBasicos(Inventario &inventario){
    Item* tdsItens = inventario.tdsItens;
    if(inventario.classe == GUERREIRO){
        inventario.equipados.arma = tdsItens[29];
        inventario.equipados.armadura = tdsItens[35];
        inventario.equipados.botas = tdsItens[24];
        inventario.equipados.capacete = tdsItens[39];
        inventario.equipados.escudo = tdsItens[46];
    }else if(inventario.classe == MAGO){
        inventario.equipados.arma = tdsItens[36];
        inventario.equipados.armadura = tdsItens[38];
        inventario.equipados.botas = tdsItens[24];
        inventario.equipados.capacete = tdsItens[40];    
    }else if(inventario.classe == LADINO){
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

void venderItem(int numero,Inventario &inventario){
    Item* itens = inventario.mochila;
    if(itens[numero].id != 34){
        inventario.dinheiro += itens[numero].valorVenda;
        if(inventario.quantidade[numero] == 1){
            itens[numero] = inventario.tdsItens[33];
            inventario.quantidade[numero] = 0;
        }else{
            inventario.quantidade[numero] -= 1;
        }
    }
}


int qtdVazios(Inventario inventario){
  int vazio  = 0;
  Item* itens = inventario.mochila;
  for(int i = 0; i < inventario.tamInvent;i++){
    if(itens[i].id == 34){
      vazio +=1;
    }
  }
  return vazio;
}

int qtdItens(Inventario inv){
    return inv.tamInvent - qtdVazios(inv); 
}

bool contemItem(int id, Inventario inventario){
    Item* itens = inventario.mochila;
    bool contem = false;
    for(int i = 0; i < inventario.tamInvent; i++){
        if(itens[i].id == inventario.tdsItens[id- 1].id){
            contem = true;
        }
    }
    return contem;
}


Item getItemPeloId(int id, Inventario inventario){
    Item* itens = inventario.tdsItens;
    if(contemItem(id,inventario)){
        return itens[id - 1];
    }
    return itens[33];
}

void adicionarItem(int id, Inventario &inventario){
    Item* itens = inventario.mochila;
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
    Item* itens = inventario.mochila;
    Item itemEqp = itens[numero];
    if(contemItem(itemEqp.id,inventario)){
        if(itemEqp.atrb.classe == TODOS || itemEqp.atrb.classe == inventario.classe && itemEqp.atrb.tipoEquipavel != NEQUIPAVEL){
            Item nEquipado;
            switch(itemEqp.atrb.tipoEquipavel){
                case ARMA:
                    nEquipado = inventario.equipados.arma;
                    inventario.equipados.arma = itemEqp;
                    itens[numero] = nEquipado;
                    break;
                case ARMADURA:
                    nEquipado = inventario.equipados.armadura;
                    inventario.equipados.armadura = itemEqp;
                    itens[numero] = nEquipado;
                    break;
                case CAPACETE:
                    nEquipado = inventario.equipados.capacete;
                    inventario.equipados.capacete = itemEqp;
                    itens[numero] = nEquipado;
                    break;
                case BOTAS:
                    nEquipado = inventario.equipados.botas;
                    inventario.equipados.botas = itemEqp;
                    itens[numero] = nEquipado;
                    break;
                 case ESCUDO:
                    nEquipado = inventario.equipados.escudo;
                    inventario.equipados.escudo = itemEqp;
                    itens[numero] = nEquipado;
                    break;
            }
        }
    }
    else{
        cout << "item não encontrado" << endl;
    }
}
 void imprimeMochila(Inventario inventario){
    cout << "======= Mochila =======" << endl;
    for(int i = 0; i < inventario.tamInvent; i++){
        if(inventario.mochila[i].id != 34){
            cout << "| " << i + 1 << '.' << inventario.mochila[i].nome << " (" << inventario.quantidade[i] << "x)"<< endl; 
        }else{
           cout << "| " << i + 1 << '.' << inventario.mochila[i].nome  <<  endl; 
        }
    }
    cout << "| " << "Dinheiro: " << inventario.dinheiro << endl << endl; 
    cout << "=======================" << endl;
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
        if(inventario.mochila[i].id != 34){
            cout << "| " << i + 1 << '.' << inventario.mochila[i].nome << " (" << inventario.quantidade[i] << "x)" <<  endl; 
        }else{
           cout << "| " << i + 1 << '.' << inventario.mochila[i].nome  <<  endl; 
        }
    }
    cout << "| " << "Dinheiro: " << inventario.dinheiro << endl << endl; 
    cout << "=======================" << endl;

}