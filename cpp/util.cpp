#include <iostream>
#include <fstream>
#include "util.h"
using namespace std;

int rolar(int lados) {    	
	srand (time(NULL));
	return (rand() % (lados + 1)) + 1;
}

int* rolarDados(int lados, int vezes) {
	int *values = new int[vezes];
	srand (time(NULL));
    for (int i = 0; i < vezes; i++)
		values[i] = (rand() % (lados + 1)) + 1;
	return values;
}

string* split(string linha, char delimitator, int numColuna) {
	string* array = new string[numColuna];
	string palavra = "";
	int j = 0;
	
	for (int i = 0; i < linha.length(); i++) {
		if (linha[i] != ',') palavra = palavra + linha[i];
		if (linha[i] == ',' || i == linha.length() - 1 ) {
			array[j++] = palavra;
			palavra = ""; 
		}
	}

	return array;
}

string getLinha(int numLinha, string caminhoArquivo) {
	string linha;
	ifstream arquivo (caminhoArquivo);
	if(arquivo.is_open())
		for (int linhano = 0; getline (arquivo,linha) && linhano < numLinha; linhano++);
	else
		cout << "fail" << endl;
	arquivo.close();
	return linha;
}

string* importar(int id, string caminhoArquivo, int qtdColunas, int qtdComentarios) {
	string linha = getLinha(id + qtdComentarios, caminhoArquivo);
	return split(linha, ',', qtdColunas);
}