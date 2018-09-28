#include "../util.h"
#include "../personagem/personagem.h"
#include "../gui.h"
#include "../batalhas/batalha.h"
#include "../monstros/monstros.h"
#include "../itens/inventario.h"
#include "../itens/item.h"

using namespace std;

struct EscolhasCidade {
	char ganchoAventura;
	char segundaChance;

};

struct EscolhasRecepcao {
	char ativouArmadilha;
};

struct EscolhasRefeitorio {
	char solucaoCombate;
};

struct CombateDespensa {
	char contiminado;
};

struct ConversaFinal {
	bool interpretouSimbolos;
	char resultadoConversa;
}; 

struct Escolhas {
	EscolhasCidade escolhasCidade;
	EscolhasRecepcao escolhasRecepcao;
	EscolhasRefeitorio escolhasRefeitorio;
	CombateDespensa combateDespensa;
	ConversaFinal conversaFinal;
};

char perguntaSimNao(WINDOW *janelaMenu);
void introducaoCidade(WINDOW *janelaDialogo);
int ganchoAventura(WINDOW *janelaDialogo, WINDOW *janelaMenu);
bool segundaChance(Personagem &personagem, WINDOW *janelaDialogo, WINDOW *janelaMenu);
char recepcaoCaverna(Ficha &ficha, WINDOW *janelaMenu);
char ConversaJakk(Ficha &ficha, Escolhas &escolhas,WINDOW *janelaDialogo, WINDOW *janelaMenu);
void entradaMina(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo);
void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha, WINDOW *janelaDialogo);
void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha, WINDOW *janelaDialogo);
char verificarCarroca(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu);
int dialogoCombateRefeitorio(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro monstro);
char refeitorioCaverna(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu);
string checkOuvirConhecimento(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo);

void contaHistoria(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro *monstro);

char depensaCaverna(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo);
void rampaCaverna(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo);
void acampamentoSecreto(Ficha &ficha,WINDOW *janelaDialogo, WINDOW *janelaMenu);
void pioraCondicao (Ficha &ficha, WINDOW *janelaDialogo);
void fossoCadaveres(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo);
void imprimeVarianciasFinal(Ficha &ficha, Escolhas &escolhas,WINDOW *janelaDialogo);

void finalJakk(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo);
void imprimePrimeiroFinal(WINDOW *janelaDialogo);
void imprimeFinalPacifico(WINDOW *janelaDialogo);
void imprimeFinalViolento(WINDOW *janelaDialogo);
void imprimeFuturoVila(WINDOW *janelaDialogo);
void imprimeCreditos(WINDOW *janelaDialogo);