#include <iostream>
using namespace std;

enum Classe {
  Guerreiro = 1, Mago, Ladino
};

struct Personagem {
  string nomePersonagem;
  Classe classe;
  int hp = 20;
  int mp = 10;
  int level = 1;
};

struct Atributos {
  int forca = 9;
  int vitalidade = 9;
  int sorte = 9;
  int destreza = 9;
  int carisma = 9;
  int inteligencia = 9;
};

struct Ficha {
  Personagem personagem;
  Atributos atributos;
  int dinheiro = 0;
};

int getDano();
int getDefesa();
int getLevel();
int getHP();
int getMP();
void levelUp();
