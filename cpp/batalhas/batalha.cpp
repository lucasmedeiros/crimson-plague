#include <iostream>
#include "batalha.h"
#include "../util.h"
using namespace std;

int hpMonstro;
int danoMonstro;
int defesaMonstro;
Habilidade* habilidades;

void carregaHabilidades() {
    habilidades = carregarHabilidades();
}

void defineAtributosMonstro(Monstro &monstro) {
    hpMonstro = calcularHPMonstro(monstro);
    danoMonstro = monstro.danoAtaque;
    defesaMonstro = monstro.ca;
}

bool temManaParaAlgumaHabilidade(Ficha ficha, int qtdHabs) {
    for (int i = 0; i <= qtdHabs; i++) {
        if (temManaSuficiente(habilidades[i],ficha)) {
            return true;
        }
    }
    return false;
}

int dropMonstro(Monstro monstro) {
    if (monstro.id != 2 && monstro.id != 4) {
        if (rolarDado(20) < 10) {
            return -1;
        }
    }
    return monstro.drop;
}

int getDanoHabilidade(WINDOW* janelaMenu, Ficha &ficha) {
    int qtdHabs = qtdHabilidadesDisponiveis(ficha);
    int dano = -2;

    if (temManaParaAlgumaHabilidade(ficha, qtdHabs)) {
        string opcoesHabilidade[qtdHabs];

        for(int i = 0; i < qtdHabs; i++) {
            int pos = i+1;
            opcoesHabilidade[i] = "| " + to_string((i + 1)) + ". " + habilidades[i].nome.c_str();
        }

        int opcao = realizaPergunta(janelaMenu, "Magias", opcoesHabilidade, qtdHabs);
        dano = usarHabilidade(habilidades[opcao], ficha);
    }

    return dano;
}

string ataquePersonagem(WINDOW* janelaMenu,Ficha &ficha) {
    int danoInfligido = 0;

    if (ficha.personagem.classe == Classe::MAGO) {
        danoInfligido = getDanoHabilidade(janelaMenu, ficha);

        if (rolarDado(D20) < RESULTADO_DEFESA_MAGIA) {
            danoInfligido /= 2;
        }
    } else {
        danoInfligido = getDano(ficha) + rolarDado(D20);

        if (danoInfligido < defesaMonstro) {
            danoInfligido = 0;
        }
    }

    string resultadoDoAtaque = "";

    if (danoInfligido > 0) {
        hpMonstro = max(hpMonstro - danoInfligido, 0);
        resultadoDoAtaque = "Você infligiu um total de " + to_string(danoInfligido) + " danos no monstro.";
    } else {
        if (danoInfligido == 0) {
            resultadoDoAtaque = "Você errou o ataque...";
        } else {
            resultadoDoAtaque = "Você não tem mana para habilidade alguma...";
        }
        resultadoDoAtaque += " O monstro ri de você...";
    }

    return resultadoDoAtaque;
}

string ataqueMonstro(Ficha &ficha) {
    int defesaPersonagem = getDefesa(ficha);
    int danoInfligido = max((danoMonstro - defesaPersonagem), 0);
    int novoHP = getHP(ficha);
    novoHP -= danoInfligido;
    ficha.personagem.hp = max(novoHP, 0);

    return "O monstro infligiu um total de " + to_string(danoInfligido) + " danos a você.";
}

void abrirMochila(Ficha &ficha) {
    imprimeMochila(ficha.inventario);
    int op = -1;

    while(true) {
        cout << "Quer usar qual? " << endl;
        cin >> op;

        if (op < 1 && op >= ficha.inventario.tamInvent) {
            Item itemSelecionado = ficha.inventario.mochila[op];
            int id = itemSelecionado.id;
            if (id != 34) {
                if (itemSelecionado.consumivel) {
                    usarItemConsumivel(op, ficha);
                } else {
                    equiparItem(op, ficha.inventario);
                }
                break;
            }
        } else {
            cout << "Opção INVÁLIDA!" << endl;
        }
    }
}

int menuCombate(WINDOW* janelaMenu, Ficha &ficha) {
    cout << "O que você faz? (Digite a opção...)" << endl;
    string opcaoATK = "";
    if (ficha.personagem.classe == Classe::MAGO) {
        opcaoATK = "Lançar magia?";
    } else {
        opcaoATK = "Atacar? ";
    }
    string opcoesMenu[3] = {opcaoATK, "Abrir mochila?", "Tentar fugir?"};
    int op = realizaPergunta(janelaMenu, "O que você faz?", opcoesMenu, 3);

    return op + 1;
}

bool venceu() {
    return hpMonstro == ZERO_HP;
}

bool personagemFugiu() {
    int rolagem = rolarDado(20);
    return rolagem >= 15;
}

string tentaFugir(WINDOW* janelaMenu, bool fugiu) {
    string str =  "Você tenta fugir e... ";

    (fugiu) ? str += "Escapou..." : str+= "Não consegue... O monstro está rindo de você...";

    return str;
}

void iniciaBatalha(WINDOW* janelaMenu, WINDOW* janelaDialogo, Ficha &ficha, Monstro monstro) {
    carregaHabilidades();
    defineAtributosMonstro(monstro);

    string falaIntroducaoBatalha[1] = {"Um desafio se aproxima, um monstro te ataca..."};
    mostraDialogo(janelaDialogo, "BATALHA", falaIntroducaoBatalha, 1);

    bool batalhaFinalizada = false;
    bool fugiu = false;

    while (!batalhaFinalizada and !fugiu) {
        int op = menuCombate(janelaMenu, ficha);

        string resultadoDaOpcao = "";
        if (op == OpcoesBatalha::ATACAR) {
            resultadoDaOpcao = ataquePersonagem(janelaMenu, ficha);
        } else if (op == OpcoesBatalha::ABRIR) {
            abrirMochila(ficha); // NAO USAR AINDA
        } else if (op == OpcoesBatalha::FUGIR) {
            resultadoDaOpcao = tentaFugir(janelaMenu, fugiu);
        }

        if (!fugiu) {
            string atkMonstro = ataqueMonstro(ficha);
            string strHP = "Seu HP: " + to_string(getHP(ficha));
            string strMP =  "Seu MP: " + to_string(getMP(ficha));
            string strHPMonstro = "HP monstro: " + to_string(hpMonstro);
            string resultadoDoTurno[5] = {resultadoDaOpcao, atkMonstro, strHP, strMP, strHPMonstro};

            mostraDialogo(janelaDialogo, "Resultado do turno", resultadoDoTurno, 5);
            batalhaFinalizada = (hpMonstro == ZERO_HP or getHP(ficha) == ZERO_HP);
        }
    }

    if (venceu()) {
        string parabens = "Parabéns pela vitória!";
        int drop = dropMonstro(monstro);
        if (drop != -1) {
            adicionarItem(drop, ficha.inventario);
            Item item = getItemPeloId(drop, ficha.inventario);
            string dropMonster = "O monstro deixou cair " + item.nome;

            string drops[] = {parabens, dropMonster};

            mostraDialogo(janelaDialogo, "DROP", drops, 5);

            bool infoDrop = false;
            infoDrop = confirmacao(janelaMenu);

            if (infoDrop) {
                string inforDrop[1] = {item.descricao};
                proximoDialogo(janelaDialogo, "VITORIA", inforDrop, 1);
            }
        } else {
            string arrayParabens[1] = {parabens};
            proximoDialogo(janelaDialogo, "VITORIA", arrayParabens, 1);
        }
    } else if (!fugiu){
        string derrota[1] = {"Morreu..."};
        proximoDialogo(janelaDialogo, "DERROTA", derrota, 1);
    }
}
