#include <iostream>
using namespace std;

string* importar(int id, string caminho, int qtdColuna, int qtdComentarios);
string getLinha(int numLinha, string caminhoArquivo);
string* split(string linha, char delimitator, int numColuna);
int rolarDado(int lados);
int* rolarDados(int lados, int vezes);