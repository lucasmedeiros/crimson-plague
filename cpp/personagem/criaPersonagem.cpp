#include <iostream>
#include "criaPersonagem.h"
#include <ctype.h>

using namespace std;

void informacoesClasses() {
  cout << "---INFORMAÇÕES---" << endl;
  cout << "(1) - Guerreiro:" << endl;
  cout << "Guerreiros são exímios lutadores marciais, sempre prontos para lutar. ";
  cout << "Possuem extremas habilidades de combate corpo a corpo." << endl << endl;

  cout << "(2) - Mago:" << endl;
  cout << "Magos são pesquisadores das artes arcanas da Idade Média e utilizam-as ";
  cout << "em suas batalhas, porém são fisicamente fracos e não possuem muitas habilidades ";
  cout << "de combate com armas." << endl << endl;

  cout << "(3) - Ladino:" << endl;
  cout << "Bem furtivos e escorregadios, ladinos, se não estão roubando algo, ";
  cout << "estão trabalhando numa busca por um tesouro. Possuem altas habilidades ";
  cout << "em combates de longa distância e armas de longo alcance." << endl << endl;
}


void ajustaAtributos(Ficha &ficha) {
  Classe classePersonagem = ficha.personagem.classe;

  switch (classePersonagem) {
    case GUERREIRO:
          ficha.atributos.forca += 2;
          ficha.atributos.vitalidade += 1;
          ficha.atributos.destreza -= 1;
          ficha.atributos.inteligencia -= 2;
          break;
    case MAGO:
          ficha.atributos.inteligencia += 2;
          ficha.atributos.sorte += 1;
          ficha.atributos.destreza -= 1;
          ficha.atributos.forca -= 2;
          break;
    case LADINO:
          ficha.atributos.destreza += 2;
          ficha.atributos.inteligencia += 1;
          ficha.atributos.carisma -= 1;
          ficha.atributos.vitalidade -= 2;
          break;
  }
}

string defineNomePersonagem() {
  printw("Insira o seu nome: ");
  string nome = getstring();
  clear();
  refresh();
  return nome;
}

Classe defineClassePersonagem(WINDOW *window) {
  string classes[3] = {"Guerreiro", "Mago", "Ladino"};
  bool confirmou = false;
  int classe;
  while (!confirmou) {
      classe = realizaPergunta(window, "Escolha sua classe", classes, 3);
      confirmou = confirmacao(window);
  }
  wclear(window);
  refresh();
  wrefresh(window);
  return (Classe) (classe + 1);
} 

Ficha criarPersonagem(WINDOW *window) {
  Ficha ficha;
  Personagem personagem;

  personagem.nome = defineNomePersonagem();
  personagem.classe = defineClassePersonagem(window);

  ficha.personagem = personagem;

  ajustaAtributos(ficha);
  // distribuiPontos(window, ficha);

  ficha.personagem.hp = getMaxHP(ficha);
  ficha.personagem.mp = getMaxMP(ficha);

  return ficha;
}
