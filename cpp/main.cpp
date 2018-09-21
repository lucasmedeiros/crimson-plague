#include <iostream>
#include "main.h"
#include "personagem/criaPersonagem.h"

using namespace std;

int main() {
  Ficha ficha = criarPersonagem();
  cout << ficha.personagem.nomePersonagem << endl;
  return 0;
}
