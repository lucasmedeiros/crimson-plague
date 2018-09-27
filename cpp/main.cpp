#include <iostream>
#include <string>
#include "main.h"
#include "personagem/criaPersonagem.h"
#include "historia/historia.h"
#include "batalhas/batalha.h"
using namespace std;

Ficha ficha;
Item* itens;

void imprimeInformacoes(Ficha ficha) {
  printf("Informações\n");
  printf("Nome: %s\n", getNome(ficha).c_str());
  printf("HP: %d/%d\n", getHP(ficha), getMaxHP(ficha));
  printf("MP: %d/%d\n", getMP(ficha), getMaxMP(ficha));
  printf("\n");
}

void carregarItens() {
  itens = carregarTdsItens();
}

Item* getAllItens(){
  return itens;
}

int* iniciaArrayZerado(){
  int* qtd = new int[20];
  for(int i = 0; i < 20; i++){
    qtd[i] = 0;
  }
  return qtd;
}

Item* iniciaArrayDeItens(){
  Item* itensVazios = new Item[20];
  for(int i = 0; i < 20; i++){
    itensVazios[i] = itens[33]; 
  }
  return itensVazios;
}

Inventario iniciaInventario(Ficha ficha){
  Inventario inventario;
  inventario.tdsItens = getAllItens();
  inventario.dinheiro = 0;
  inventario.inventario = iniciaArrayDeItens();
  inventario.quantidade = iniciaArrayZerado();
  inventario.classe = ficha.personagem.classe;
  iniciarItensBasicos(inventario);
  return inventario;
}

int main() {
  Escolhas escolhas;
  carregarItens();
  ficha = criarPersonagem();
  ficha.inventario = iniciaInventario(ficha);
  imprimeInformacoes(ficha);

  contaHistoria(ficha, escolhas);

  //iniciaBatalha(ficha);

  return 0;
}
