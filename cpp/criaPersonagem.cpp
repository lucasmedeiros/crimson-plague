#include <iostream>
#include "criaPersonagem.h"

using namespace std;

Ficha ficha;

void ajustaAtributos() {
  Classe classePersonagem = ficha.personagem.classe;

  switch (classePersonagem) {
    case Guerreiro:
          ficha.atributos.forca += 2;
          ficha.atributos.vitalidade += 1;
          ficha.atributos.destreza -= 1;
          ficha.atributos.inteligencia -= 2;
          break;
    case Mago:
          ficha.atributos.inteligencia += 2;
          ficha.atributos.sorte += 1;
          ficha.atributos.destreza -= 1;
          ficha.atributos.forca -= 2;
          break;
    case Ladino:
          ficha.atributos.destreza += 2;
          ficha.atributos.inteligencia += 1;
          ficha.atributos.carisma -= 1;
          ficha.atributos.vitalidade -= 2;
          break;
  }

  cout << "Força: " << ficha.atributos.forca << endl;
  cout << "Vitalidade: " << ficha.atributos.vitalidade << endl;
  cout << "Destreza: " << ficha.atributos.destreza << endl;
  cout << "Sorte: " << ficha.atributos.sorte << endl;
  cout << "Inteligência: " << ficha.atributos.inteligencia << endl;
  cout << "Carisma: " << ficha.atributos.carisma << endl;
}

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
  int classe;

  while (tolower(refazer) != 's') {
    classe = -1;
    cout << "Existem três tipos de classe:" << endl;
    while (classe < 1 or classe > 3) {
      cout << "(1) Guerreiro - (2) Mago - (3) Ladino - (0) Informações" << endl;
      cout << "Escolha sua classe: ";
      cin >> classe;

      if (classe < 0 or classe > 3) {
        cout << "Opção inválida!" << endl;
      }

      if (classe == 0) {
        cout << "---INFORMAÇÕES---" << endl;
        cout << "(1) - Guerreiro:" << endl;
        cout << "Guerreiros são exímios lutadores marciais, sempre prontos para lutar. ";
        cout << "Possuem extremas habilidades de combate." << endl << endl;

        cout << "(2) - Mago:" << endl;
        cout << "Magos são pesquisadores das artes arcanas da Idade Média, porém são ";
        cout << "fisicamente fracos e não possuem muitas habilidades de combate" << endl << endl;

        cout << "(3) - Ladino:" << endl;
        cout << "Bem furtivos e escorregadios, ladinos, se não estão roubando algo, ";
        cout << "estão trabalhando numa busca por um tesouro, que antes de repartir ";
        cout << "o lucro com seus parceiros, ele já os roubou." << endl << endl;
      }
    }

    personagem.classe = (Classe) classe;

    cout << "Tem certeza? (S/N): ";
    cin >> refazer;
  }

  ficha.personagem = personagem;
  ajustaAtributos();

// TODO DEFINIR OS ATRIBUTOS
  return 0;
}
