#include "../enums/classes.h"
using namespace std;

struct Personagem {
  string nomePersonagem;
  Classe classe;
  int hp;
  int mp;
  int level;
};

struct Atributos {
  int forca;
  int vitalidade;
  int sorte;
  int destreza;
  int carisma;
  int inteligencia;
};

struct Ficha {
  Personagem personagem;
  Atributos atributos;
};

//void testando()
