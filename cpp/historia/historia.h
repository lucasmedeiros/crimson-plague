#include "../util.h"
#include "../personagem/personagem.h"

using namespace std;

struct EscolhasCidade {
	char ganchoAventura;
	char segundaChance;

};

struct EscolhasEntradaMina {
	char analisePorta;
};

struct Escolhas {
	EscolhasCidade escolhasCidade;
};

void primeiraEscolhaEntrada(int dadoObservar);
void segundaEscolhaEntrada(int dadoObservar);
void contaHistoria(Ficha &ficha);
