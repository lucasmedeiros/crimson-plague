#include <iostream>
#include "../util.h"

using namespace std;


struct Atributos{
    // valores relacionado a equipaveis, tambem aos valores do buff
    int dano;
    int incrArm;
    int increForca;
    int incrInteli;
    int incrSorte;
    int incrDestr;
    int incrCaris;
    int incrVital;
};

struct Item{
    //valores basicos de todo item
    int id;
    string nome;
    string descricao;
    int valorVenda;

    //valores relacionado ao buff
    bool buff;
    int turnDur;

    //valores relacionado a consumiveis
    bool consumivel;
    int recHPMax;
    int recMPMax;
    Atributos atrb;

};

Item getItem(int id);
Atributos getAtributos(int id);

