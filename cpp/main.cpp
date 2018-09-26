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

Inventario iniciaInventario(){
  Inventario inventario;
  inventario.dinheiro = 0;
  inventario.inventario =  new Item[20];
  return inventario;
}

int main() {
  Escolhas escolhas;
  //carregarItens();
  ficha = criarPersonagem();
  ficha.inventario = iniciaInventario();
  imprimeInformacoes(ficha);

  //contaHistoria(ficha, escolhas);

  iniciaBatalha(ficha);

  return 0;
}
