#include <iostream>
#include "structs/personagem.h"

using namespace std;

// void testando(Personagem &personagem) {
//   personagem.nomePersonagem = "aaa";
// }

int main() {
  Personagem personagem;
  string nomeJogador;

  char refazer = 'n';

  while (tolower(refazer) != 's') {
    cout << "Digite um nome para seu personagem: ";
    cin >> nomeJogador;
    cout << "Tem certeza? (S/N): ";
    cin >> refazer;
  }

  personagem.nomePersonagem = nomeJogador;
  refazer = 'n';
  int classe = -1;

  while (tolower(refazer) != 's') {
    while (classe < 1 or classe > 3) {
      cout << "Existem três tipos de classe:" << endl;
      cout << "(1) Bárbaro - (2) Mago - (3) Ladino - (0) Informações" << endl;
      cout << "Digite sua classe: ";
      cin >> classe;

      switch (classe) {
        case 0: informacoes();
        case Barbaro: personagem.classe = Barbaro; break;
        case Mago: personagem.classe = Mago; break;
        case Ladino: personagem.classe = Ladino; break;
        default: cout << "Opção inválida!" << endl;
      }
    }

    cout << "Tem certeza? (S/N): ";
    cin >> refazer;
  }

// TODO DEFINIR OS ATRIBUTOS
  return 0;
}
