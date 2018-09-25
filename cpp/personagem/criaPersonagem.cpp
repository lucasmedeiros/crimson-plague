#include <iostream>
#include "criaPersonagem.h"

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
  string nomeJogador;

  char opcao = 'n';

  while (tolower(opcao) != 's') {
    cout << "Digite um nome para seu personagem: ";
    cin >> nomeJogador;
    cout << "Tem certeza? (S/N): ";
    cin >> opcao;
  }

  return nomeJogador;
}

Classe defineClassePersonagem() {
  char opcao = 'n';
  int classe;

  while (tolower(opcao) != 's') {
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
        informacoesClasses();
      }
    }

    cout << "Tem certeza? (S/N): ";
    cin >> opcao;
  }

  return (Classe) classe;
}

void distribuicaoPontos(Ficha &ficha) {
  int pontos = 8;
  char opcao = 'n';
  int atr, addPontos;

  string atributos[6] = {"Força", "Vitalidade", "Inteligência", "Sorte", "Destreza", "Carisma"};
  int* valores[6] = {&ficha.atributos.forca, &ficha.atributos.vitalidade,
                     &ficha.atributos.inteligencia, &ficha.atributos.sorte,
                     &ficha.atributos.destreza, &ficha.atributos.carisma};

  cout << "Você pode distribuir " << pontos << " pontos pelos seus atributos:" << endl;

  while(pontos > 0){

      cout << "(1) Força (" << ficha.atributos.forca << ")" << endl;
      cout << "(2) Vitalidade (" << ficha.atributos.vitalidade << ")" << endl;
      cout << "(3) Inteligência (" << ficha.atributos.inteligencia << ")" << endl;
      cout << "(4) Sorte (" << ficha.atributos.sorte << ")" << endl;
      cout << "(5) Destreza (" << ficha.atributos.destreza << ")"<< endl;
      cout << "(6) Carisma (" << ficha.atributos.carisma << ")" <<  endl;

      cout << "Pontos disponiveis: " << pontos << endl;
      cout << "Deseja adicionar pontos a qual atributo? " << endl;

      cin >> atr;

      if(atr < 7){
          cout << "Adicionar quantos pontos ao atributo " << atributos[atr - 1] << " ?" << endl;
          cin >> addPontos;

          if(addPontos <= pontos){
              if(addPontos < 0){
              cout << atributos[atr - 1] << " " << *valores[atr - 1] << " -- > " << *valores[atr - 1] + addPontos << endl;
              cout << "Pontos restantes: " << pontos - addPontos << endl;
              cout << "Tem certeza? (S/N): " << endl;
              cin >> opcao;

              if(tolower(opcao) == 's'){
                  *valores[atr - 1] += addPontos;
                  pontos -= addPontos;
              }
              }else{
                cout << "Qtd de pontos inválida, adicione alguma quantidade váida" << endl << endl;
              }
          }else{
            cout << "Pontos insuficientes" << endl << endl;
          }

      }else{
          cout << "Opção inválida!" << endl << endl;
      }
  }
  cout << endl;
}

Ficha criarPersonagem() {
  Ficha ficha;
  Personagem personagem;

  personagem.nome = defineNomePersonagem();
  personagem.classe = defineClassePersonagem();

  ficha.personagem = personagem;

  ajustaAtributos(ficha);
  distribuicaoPontos(ficha);

  ficha.personagem.hp = getMaxHP(ficha);
  ficha.personagem.mp = getMaxMP(ficha);

  return ficha;
}
