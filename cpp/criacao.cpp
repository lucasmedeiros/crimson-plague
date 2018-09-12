#include <iostream>
#include "jogador.h"

using namespace std;

int main() {

  Jogador jogador;
  string nomeJogador;

  char op = 'n';

  cout << "Bem-vindo ao universo de [INSERIR NOME DO UNIVERSO AQUI]." << endl;

  while (tolower(op) != 's') {
    cout << "Digite seu nome: ";
    cin >> nomeJogador;
    cout << "Tem certeza? (S/N): ";
    cin >> op;
  }

  jogador = {nomeJogador, 20, 1};

  cout << jogador.nomeJogador << endl;
  return 0;
}
