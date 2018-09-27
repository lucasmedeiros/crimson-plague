#ifndef GUI_H
#define GUI_H
#include <iostream>
#include <ncurses.h>
using namespace std;

void iniciaGUI();

WINDOW* criaJanelaDialogo();
WINDOW* criaJanelaMenu();

string getstring();

/**
 * Exibe um dialogo. 
 * @param window, passe aqui a variável janelaDialogo do arquivo main.cpp
 * @param title, titulo do dialogo
 * @param linhas[], array de linhas que o dialogo vai conter
 * @param numLinhas, quantidade de linhas do dialogo
 */
void mostraDialogo(WINDOW* window, string title, string linhas[], int numLinhas);

/**
 * Exibe um dialogo após o anterior.
 * @param window, passe aqui a variável janelaDialogo do arquivo main.cpp
 * @param title, titulo do dialogo
 * @param linhas[], array de linhas que o dialogo vai conter
 * @param numLinhas, quantidade de linhas do dialogo
 */
void proximoDialogo(WINDOW* window, string title, string linhas[], int numLinhas);

/**
 * Exibe uma pergunta. E retorna um inteiro representando a posição
 * da opção selecionada (iniciando em 0) 
 * @param window, passe aqui a variável janelaMenu do arquivo main.cpp
 * @param title, a pergunta
 * @param opcoes*, array de strings que representam as opções
 * @param numOpcoes, quantidade de opções
 * @return index da opção selecionada
 */
int realizaPergunta(WINDOW* window, string title, string *opcoes, int numOpcoes);

/**
 * Exibe uma confirmação e retorna true para Sim,
 * false para não.
 * @param window, variável janelaMenu do main.cpp
 * @return True para sim, False para não.
 */
bool confirmacao(WINDOW* window);
#endif