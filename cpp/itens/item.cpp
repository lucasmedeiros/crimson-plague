#include <iostream>
#include "item.h"

using namespace std;

int getDano(Item item){return item.atrb.dano;}
int getArmadura(Item item){return item.atrb.armadura;}
string getNome(Item item){return item.nome;}
int getRecHPMax(Item item){return item.recHPMax;}
int getRecMPMax(Item item){return item.recMPMax;}
Atributos getAtributos(Item item){return item.atrb;}

Atributos setAtributos(string *atrb){
      Atributos atributos;
      atributos.dano = stoi(atrb[1].c_str());
      atributos.armadura = stoi(atrb[2].c_str());
      atributos.forca = stoi(atrb[3].c_str());
      atributos.vitalidade = stoi(atrb[4].c_str());
      atributos.sorte = stoi(atrb[5].c_str());
      atributos.destreza = stoi(atrb[6].c_str());
      atributos.carisma = stoi(atrb[7].c_str());
      atributos.inteligencia = stoi(atrb[8].c_str());
      switch (stoi(atrb[9].c_str())){
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
      return atributos;
};


Item* carregarTdsItens(){
      string** informacoes = importarTodos("../../db/item.txt",9,27,3);
      string** atributos = importarTodos("../../db/atrbItens.txt",10,27,3);
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
      item.id = stoi(informacoes[0].c_str());
      item.nome = informacoes[1];
      item.descricao = informacoes[2];

      if(stoi(informacoes[3].c_str()) == 1){
            item.consumivel = true;
      }else{
            item.consumivel = false;
      }
      if(stoi(informacoes[7].c_str()) == 1){
            item.buff = true;
      }else{
            item.buff = false;
      }

      if(item.buff || item.consumivel == false){
            item.atrb = setAtributos(atributos);
      }

      item.valorVenda = stoi(informacoes[6].c_str());
      return item;
};








