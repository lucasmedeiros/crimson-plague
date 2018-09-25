#include <iostream>
#include "item.h"

using namespace std;

int getDano(Item item){return item.atrb.dano;}
int getArmadura(Item item){return item.atrb.armadura;}
string getNome(Item item){return item.nome;}
int getRecHPMax(Item item){return item.recHPMax;}
int getRecMPMax(Item item){return item.recMPMax;}
Atributos getAtributos(Item item){return item.atrb;}

void setTipo(Atributos atributo, string *atrb){
      switch(stoi(atrb[10])){
            case 1:
                  atributo.tipoEquipavel = ARMA;
                  break;
            case 2:
                  atributo.tipoEquipavel = ARMADURA;
                  break;
            case 3:
                  atributo.tipoEquipavel = BOTAS;
                  break;
            case 4:
                  atributo.tipoEquipavel = CAPACETE;
            case 5:
                  atributo.tipoEquipavel = ESCUDO;
      }
}


Atributos setAtributos(string *atrb){
      Atributos atributos;
      atributos.dano = stoi(atrb[1]);
      atributos.armadura = stoi(atrb[2]);
      atributos.forca = stoi(atrb[3]);
      atributos.vitalidade = stoi(atrb[4]);
      atributos.sorte = stoi(atrb[5]);
      atributos.destreza = stoi(atrb[6]);
      atributos.carisma = stoi(atrb[7]);
      atributos.inteligencia = stoi(atrb[8]);
      switch (stoi(atrb[9])){
            case 1:
                  atributos.classe = GUERREIRO;
                  break;
            case 2:
                  atributos.classe = MAGO;
                  break;
            case 3:
                  atributos.classe = LADINO;
            default:
                  atributos.classe = TODOS;
      }
      setTipo(atributos,atrb);
      return atributos;
};


Item* carregarTdsItens(){
      string** informacoes = importarTodos("../../db/item.txt",9,27,3);
      string** atributos = importarTodos("../../db/atrbItens.txt",11,28,4);
      Item item;
      Item* itens;
      for(int i = 0; i < 24; i++){
            item = getItem(informacoes[i],atributos[i]);
            itens[i] = item;
      }
      return itens;
};

Item getItem(string *informacoes, string *atributos){
      Item item;
      item.id = stoi(informacoes[0]);
      item.nome = informacoes[1];
      item.descricao = informacoes[2];

      if(stoi(informacoes[3]) == 1){
            item.consumivel = true;
      }else{
            item.consumivel = false;
      }
      if(stoi(informacoes[7]) == 1){
            item.buff = true;
      }else{
            item.buff = false;
      }

      if(item.buff || item.consumivel == false){
            item.atrb = setAtributos(atributos);
      }

      item.valorVenda = stoi(informacoes[6]);
      return item;
};








