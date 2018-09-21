#include <iostream>
#include <string>
#include "main.h"
#include "personagem/criaPersonagem.h"

using namespace std;

int main() {
  Ficha ficha = criarPersonagem();
  printf("[Informações]\n");
  printf("Nome: %s\n", getNome(ficha).c_str());
  printf("HP: %d/%d\n", getHP(ficha), getMaxHP(ficha));
  printf("MP: %d/%d\n", getMP(ficha), getMaxMP(ficha));
  printf("Dano: %d\n", getDano(ficha));
  return 0;
}
