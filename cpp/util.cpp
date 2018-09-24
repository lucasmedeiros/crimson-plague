#include <iostream>
#include <fstream>
#include "util.h"
using namespace std;

int rolarDado(int lados) {
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
		if (linha[i] != delimitator) palavra = palavra + linha[i];
		if (linha[i] == delimitator || i == linha.length() - 1 ) {
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
		cout << "O arquivo não está aberto!" << endl;
	arquivo.close();
	return linha;
}


string* getAllLinhas(int qtdLinhas, int qtdComentarios, string caminhoArquivo){
	string linha;
	string *linhas = new string[qtdLinhas];

	ifstream arquivo(caminhoArquivo);
	if(arquivo.is_open()){
		for(int i = 0, j = 0; i < qtdLinhas + qtdComentarios; i++) {
			getline(arquivo, linha);
			if (linha[0] != '/')
				linhas[j++] = linha;
		}
	} else {
		cout << "O arquivo não está aberto!" << endl;
	}

	arquivo.close();
	return linhas;
}

string** importarTodos(string caminho, int qtdColunas, int qtdLinhas, int qtdComentarios){
	string *linhas = getAllLinhas(qtdLinhas, qtdComentarios, caminho);
	string **valores = new string*[qtdLinhas];
	for(int i = 0; i < qtdLinhas; i++)
		valores[i] = split(linhas[i],';',qtdColunas);
	return valores;
}

string* importar(int id, string caminhoArquivo, int qtdColunas, int qtdComentarios) {
	string linha = getLinha(id + qtdComentarios, caminhoArquivo);
	return split(linha, ';', qtdColunas);
}
