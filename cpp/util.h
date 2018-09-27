#ifndef UTIL_H
#define UTIL_H
#include <iostream>
using namespace std;


enum Classe{
    GUERREIRO = 1,MAGO, LADINO, TODOS
};

/**
 * @return um "array" de valores, que seria os atributos de uma linha do bd especificado, recebendo o id
 * da linha, o caminho do arquivo, a qtd de colunas (qtd de atributos) e a qtd linhas
 * de comentarios no txt
 */
string* importar(int id, string caminho, int qtdColuna, int qtdComentarios);
/**
 * @return retorna tipo uma matriz, já que é meio que um array de arrays (apontador de apontadores),
 * ele recebe o caminho do arquivo, a qtdColunas (que seria a qtd de atributos do bd), qtdLInhas 
 * (qtd de linhas total do arquivo) e qtComentarios (qtd de linhas no inicio do arquivo que são
 * comentarios)
 */
string** importarTodos(string caminhoArquivo, int qtdColuna, int qtdLinhas, int qtdComentarios);

/**
 * @return uma string que seria uma linha especifica do arquivo especificado, recebe o numero da linha
 * desejada e o caminho do arquivo
 */
string getLinha(int numLinha, string caminhoArquivo);

/**
 * @return um array (apontador, na verdade) de strings de todas as linhas do arquivo, ele recebe o numLinha
 * que seria a qtd de linhas totais do arquivo e o caminho do arquivo txt, alem da qtd de comentarios no txt 
 */
string* getAllLinhas(string caminhoArquivo,int qtdLinhas, int qtdComentarios);

/**
 *@return um "array" a partir de uma string,quebrando a string em um char especifico, recebe a linha
 *o delimitador a ser usado e a numColuna que seria a qtd de atributos no caso do banco de dados  
 */
string* split(string linha, char delimitator, int numColuna);
int rolarDado(int lados);
int* rolarDados(int lados, int vezes);

#endif

