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
}

struct Escolhas {
	EscolhasCidade escolhasCidade;
	EscolhasRecepcao escolhasRecepcao;
	EscolhasRefeitorio solucaoCombate;
};

char recepcaoCaverna(Ficha &ficha);
void entradaMina(Ficha &ficha);
void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha);
void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha);
void contaHistoria(Ficha &ficha, Escolhas &escolhas);
