#include <iostream>
#include "../util.h"

using namespace std;

enum Classe{
    GUERREIRO = 1,MAGO,LADINO,TODOS
};

struct Atributos{
    // valores relacionado a equipaveis, tambem aos valores do buff
    int dano;
    int armadura;
    int forca;
    int inteligencia;
    int sorte;
    int destreza;
    int carisma;
    int vitalidade;
    Classe classe;
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

Item getItem(string* informacoes, string* atributos);
Atributos setAtributos(string* atributos);
Item* carregarTdsItens();
int getDano(Item item);
int getArmadura(Item item);
int getRecHPMax(Item item);
int getRecMPMax(Item item);
string getNome(Item item);
Atributos getAtributos(Item item);
