#include <iostream>
#include "main.h"
#include "criaPersonagem.h"

using namespace std;

int main() {
  Ficha ficha = criarPersonagem();
  cout << ficha.personagem.nomePersonagem << endl;
  return 0;
}
