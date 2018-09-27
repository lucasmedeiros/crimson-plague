#include "../util.h"
#include "../personagem/personagem.h"

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

char perguntaSimNao();
char recepcaoCaverna(Ficha &ficha);
char ConversaJakk(Ficha &ficha, Escolhas &escolhas);
void entradaMina(Ficha &ficha);
void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha);
void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha);
void contaHistoria(Ficha &ficha, Escolhas &escolhas);
char depensaCaverna(Ficha &ficha);
void rampaCaverna(Ficha &ficha);
void acampamentoSecreto(Ficha &ficha);
void pioraCondicao (Ficha &ficha);
void fossoCadaveres(Ficha &ficha);
void imprimeFinalPacifico(Ficha &ficha, Escolhas &escolhas);
void imprimeFinalViolento(Ficha &ficha, Escolhas &escolhas);
