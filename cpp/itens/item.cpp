#include <iostream>
#include "item.h"

using namespace std;

Atributos getAtributos(int id){
      Atributos atributos;
      string* atrb = importar(id,"../../db/atrbItens.txt",10,3);
      atributos.dano = stoi(atrb[1].c_str());
      atributos.incrArm = stoi(atrb[2].c_str());
      atributos.incrForca = stoi(atrb[3].c_str());
      atributos.incrVital = stoi(atrb[4].c_str());
      atributos.incrSorte = stoi(atrb[5].c_str());
      atributos.incrDestr = stoi(atrb[6].c_str());
      atributos.incrCaris = stoi(atrb[7].c_str());
      atributos.incrInteli = stoi(atrb[8].c_str());
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

Item getItem(int id){
      string* informacoes = importar(id,"../../db/item.txt",9,3);
      Item item;
      item.id = id;
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
            item.atrb = getAtributos(id);
      }

      item.valorVenda = stoi(informacoes[6].c_str());
      return item;
};






