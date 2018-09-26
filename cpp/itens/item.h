#ifndef ITEM_H
#define ITEM_H
#include <iostream>
#include "../util.h"
#define QTD_LINHAS_ITENS 36
#define QTD_LINHAS_EQUIPAVEIS 37
#define QTD_COMENTARIOS_ITENS 3
#define QTD_COMENTARIOS_EQUIPAVEIS 4
#define QTD_COLUNAS_ITENS 9
#define QTD_COLUNAS_EQUIPAVEIS 9
using namespace std;

enum ClasseItem{
    WARRIOR = 1,MAGE,ROGUE,ALL
};

enum Tipo{
    ARMA = 1,ARMADURA,BOTAS,CAPACETE,ESCUDO
};

struct AtributosItens{
    // valores relacionado a equipaveis, tambem aos valores do buff
    int dano;
    int armadura;
    int forca;
    int inteligencia;
    int destreza;
    int vitalidade;
    ClasseItem classe;
    Tipo tipoEquipavel;
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
    AtributosItens atrb;

};

/**
 * @return Constroi um item pelo array de informacoes e de atributos (usado localmente)
 */
Item getItem(string* informacoes, string* atributos);

/**
 * @return seta os atributos do item, usado localmente (usado localmente)
 */
AtributosItens setAtributos(string* atributos);

/**
 * @return todos os itens do banco de dados item.txt
 */
Item* carregarTdsItens();

/**
 * @return o dano do item
 */
int getDano(Item item);

/**
 * @return a armadura do item
 */
int getArmadura(Item item);

/**
 * @return a recuperacao maxima de hp do item (consumivel)
 */
int getRecHPMax(Item item);

/**
 * @return a recuperacao maxima de mp do item (consumivel)
 */
int getRecMPMax(Item item);

/**
 * @return o nome do item
 */
string getNome(Item item);

/**
 * @return os atributos do item
 */
AtributosItens getAtributos(Item item);

/**
 * seta o tipo do item (equipavel)
 */
void setTipo(AtributosItens atributo);

/**
 * @return o tipo do item (equipavel)
 */
Tipo getTipo(Item item);
#endif

