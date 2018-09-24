#include <iostream>
#include <string>
#include "main.h"
#include "personagem/criaPersonagem.h"
#include "personagem/habilidades.h"
using namespace std;

Ficha ficha;
Habilidade* habilidades;

void imprimeInformacoes(Ficha ficha) {
  printf("Informações\n");
  printf("Nome: %s\n", getNome(ficha).c_str());
  printf("HP: %d/%d\n", getHP(ficha), getMaxHP(ficha));
  printf("MP: %d/%d\n", getMP(ficha), getMaxMP(ficha));
  printf("\n");
}

void selecionarHabilidade() {
  int qtdHabs = qtdHabilidadesDisponiveis(ficha);
  printf("Habilidades:\n");
  for(int i = 0; i < qtdHabs; i++)
    printf("%d. %s\n", i + 1, habilidades[i].nome.c_str());

  printf("\nSelecione uma habilidade: ");
  int opcao;
  cin >> opcao;
  if (opcao > 0 && opcao <= qtdHabs) {
    int dano = usarHabilidade(habilidades[opcao - 1], ficha);
    printf("Você causou %d de dano com %s\n", dano, habilidades[opcao-1].nome.c_str());
  }
}

void carregarInformacoes() {
  habilidades = carregarHabilidades();
}

int main() {
  carregarInformacoes();
  ficha = criarPersonagem();
  imprimeInformacoes(ficha);

  if (ficha.personagem.classe == Classe::MAGO)
    selecionarHabilidade();
  
  return 0;
}
