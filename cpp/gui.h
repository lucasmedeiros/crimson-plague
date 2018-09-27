#ifndef GUI_H
#define GUI_H
#include <iostream>
#include <ncurses.h>
using namespace std;

void iniciaGUI();

WINDOW* criaJanelaDialogo();
WINDOW* criaJanelaMenu();

string getstring();

void mostraDialogo(WINDOW* window, string title, string linhas[], int numLinhas);
void proximoDialogo(WINDOW* window, string title, string linhas[], int numLinhas);
int realizaPergunta(WINDOW* window, string title, string *opcoes, int numOpcoes);
bool confirmacao(WINDOW* window);
#endif