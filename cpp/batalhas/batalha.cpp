#include <iostream>
#include "batalha.h"
#include "../util.h"
using namespace std;

#define ZERO_HP 0

// definições fixas enquanto ainda não temos dados dos monstros.
#define MAX_HP_MONSTRO 50
#define DANO_MONSTRO 10
#define DEFESA_MONSTRO 10
#define RESULTADO_DEFESA_MAGIA 10
#define D20 20

int hpMonstro = MAX_HP_MONSTRO;
Habilidade* habilidades;

void carregaHabilidades() {
    habilidades = carregarHabilidades();
}

int getDanoHabilidade(Ficha &ficha) {
    int qtdHabs = qtdHabilidadesDisponiveis(ficha);
    cout << endl;

    cout << "==================================================" << endl;
    cout << "Habilidades:" << endl;

    for(int i = 0; i < qtdHabs; i++) {
        cout << "| " << (i + 1) << ". " << habilidades[i].nome.c_str() << endl;
    }
    cout << "==================================================" << endl;

    int opcao = 0;

    while (true) {
        cout << endl << "Escolha uma habilidade... -> ";
        cin >> opcao;

        if (opcao > 0 && opcao <= qtdHabs) {
            break;
        }
    }

    cout << endl << "-> você usa " << habilidades[opcao-1].nome.c_str() << "...\n\n";

    return usarHabilidade(habilidades[opcao - 1], ficha);
}

void ataquePersonagem(Ficha &ficha) {
    int danoInfligido = 0;

    if (ficha.personagem.classe == Classe::MAGO) {
        danoInfligido = getDanoHabilidade(ficha)*2;

        if (rolarDado(D20) < RESULTADO_DEFESA_MAGIA) {
            danoInfligido /= 2;
        }
    } else {
        danoInfligido = getDano(ficha) + rolarDado(D20);

        if (danoInfligido < DEFESA_MONSTRO) {
            danoInfligido = 0;
        }
    }

    cout << endl << "RESULTADO DO ATAQUE:" << endl;

    if (danoInfligido > 0) {
        hpMonstro = max (hpMonstro - danoInfligido, 0);

        cout << "==================================================" << endl;
        cout << " Você infligiu um total de " << danoInfligido;
        cout << " danos no monstro." << endl;
        cout << "==================================================" << endl;
    } else {
        cout << "==================================================" << endl;
        cout << " Você errou o ataque..." << endl;
        cout << " O monstro ri de você..." << endl;
        cout << "==================================================" << endl;
    }
}

void ataqueMonstro(Ficha &ficha) {
    int defesaPersonagem = getDefesa(ficha);
    int danoInfligido = max((DANO_MONSTRO - defesaPersonagem), 0);
    int novoHP = getHP(ficha);
    novoHP -= danoInfligido;
    ficha.personagem.hp = max(novoHP, 0);

    cout << "O monstro infligiu um total de " << danoInfligido;
    cout << " danos a você." << endl;
}

int menuCombate(Ficha &ficha) {
    cout << "O que você faz? (Digite a opção...)" << endl;
    int op = -1;

    while(true) {
        if (ficha.personagem.classe == Classe::MAGO) {
            cout << "(1) -> Lançar Magia? " << endl;
        } else {
            cout << "(1) -> Atacar? " << endl;
        }

        //TODO cout << "(2) -> Abrir Inventário? " << endl;
        cout << "(2) -> Tentar fugir?" << endl;

        cin >> op;

        if (op < 1 && op > 2) {
            cout << "Opcao Invalida!" << endl;
        } else {
            break;
        }
    }

    return op;
}

bool venceu() {
    return hpMonstro == ZERO_HP;
}

bool personagemFugiu() {
    int rolagem = rolarDado(20);
    return rolagem >= 15;
}

void tentaFugir(bool fugiu) {
    cout << endl << "Você tenta fugir e..." << endl;

    (fugiu) ? cout << "Escapou..." : cout << "Não consegue... O monstro está rindo de você...";

    cout << endl << endl;
}

void iniciaBatalha(Ficha &ficha) {
    carregaHabilidades();
    cout << "==================================================" << endl;
    cout << " Um desafio se aproxima, um monstro te ataca..." << endl;
    cout << "==================================================" << endl;
    bool batalhaFinalizada = false;
    bool fugiu = false;

    while (!batalhaFinalizada and !fugiu) {
        int op = menuCombate(ficha);

        if (op == OpcoesBatalha::ATACAR) {
            ataquePersonagem(ficha);
        } else if (op == OpcoesBatalha::FUGIR) {
            fugiu = personagemFugiu();

            tentaFugir(fugiu);
        }

        if (!fugiu) {
            cout << endl << "==================================================" << endl;
            cout << endl << "Turno do monstro..." << endl;
            ataqueMonstro(ficha);
            cout << endl << "==================================================" << endl;

            cout << endl << "==================================================" << endl;
            cout << "-> Seu HP: " << getHP(ficha) << endl;
            cout << "-> Seu MP: " << getMP(ficha) << endl;
            cout << "==================================================" << endl;

            cout << endl << "HP monstro: " << hpMonstro << endl << endl;

            batalhaFinalizada = (hpMonstro == ZERO_HP or getHP(ficha) == ZERO_HP);
        }
    }

    if (venceu()) {
        cout << "Parabéns pela vitória!" << endl;
    } else if (!fugiu){
        cout << "Morreu..." << endl;
    }
}
