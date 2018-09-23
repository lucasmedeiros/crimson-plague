#include "../util.h"
#include "../personagem/personagem.h"

using namespace std;

struct EscolhasCidade {
	char ganchoAventura;
	char segundaChance;

};

struct Escolhas {
	EscolhasCidade escolhasCidade;
};

void contaHistoria(Ficha &ficha);
