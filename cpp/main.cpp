#include <iostream>
#include <string>
#include "main.h"
#include "personagem/criaPersonagem.h"
#include "historia/historia.h"
#include "batalhas/batalha.h"
#include <ctype.h>
#include "gui.h"
using namespace std;

Ficha ficha;
Item* itens;
Monstro* monstros;

// Variáveis referente a GUI
WINDOW *janelaDialogo;
WINDOW *janelaMenu;

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

void carregarMonstros() {
    monstros = carregarAtributosMonstros();
}

int* iniciaArrayZerado(int tamanho){
  int* qtd = new int[tamanho];
  for(int i = 0; i < tamanho; i++){
    qtd[i] = 0;
  }
  return qtd;
}

Item* iniciaArrayDeItens(int tamanho){
  Item* itensVazios = new Item[tamanho];
  for(int i = 0; i < tamanho; i++){
    itensVazios[i] = itens[33];
  }
  return itensVazios;
}

Inventario iniciaInventario(Ficha ficha){
  Inventario inventario;
  inventario.tdsItens = itens;
  inventario.dinheiro = 0;
  inventario.tamInvent = 10;
  inventario.mochila = iniciaArrayDeItens(inventario.tamInvent);
  inventario.quantidade = iniciaArrayZerado(inventario.tamInvent);
  inventario.classe = ficha.personagem.classe;
  iniciarItensBasicos(inventario);
  // imprimeMochila(inventario);
  return inventario;
}

int main() {
  iniciaGUI();
  janelaDialogo = criaJanelaDialogo();
  janelaMenu = criaJanelaMenu();

  Escolhas escolhas;
  carregarItens();
  carregarMonstros();
  ficha = criarPersonagem(janelaMenu, janelaDialogo);
  ficha.inventario = iniciaInventario(ficha);
  contaHistoria(ficha, escolhas, janelaDialogo, janelaMenu, monstros);
  getch();
  endwin();
  return 0;
}
