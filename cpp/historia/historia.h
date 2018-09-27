#include "../util.h"
#include "../personagem/personagem.h"
#include "../gui.h"

using namespace std;

struct EscolhasCidade {
	int ganchoAventura;
	int segundaChance;

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
char recepcaoCaverna(Ficha &ficha, WINDOW *janelaMenu);
char ConversaJakk(Ficha &ficha, Escolhas &escolhas);
void entradaMina(Ficha &ficha);
void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha);
void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha);
void contaHistoria(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu);
char depensaCaverna(Ficha &ficha);
void rampaCaverna(Ficha &ficha);
void acampamentoSecreto(Ficha &ficha);
void pioraCondicao (Ficha &ficha);
void fossoCadaveres(Ficha &ficha);
void imprimeFinalPacifico(Ficha &ficha, Escolhas &escolhas);
void imprimeFinalViolento(Ficha &ficha, Escolhas &escolhas);
