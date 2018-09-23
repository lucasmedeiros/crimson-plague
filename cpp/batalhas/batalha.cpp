#include <iostream>
#include "batalha.h"
#include "../util.h"
using namespace std;

#define ZERO_HP 0

// definições fixas enquanto ainda não temos dados dos monstros.
#define MAX_HP_MONSTRO 50
#define DANO_MONSTRO 15
#define DEFESA_MONSTRO 1

int hpMonstro = MAX_HP_MONSTRO;

void ataquePersonagem(Ficha &ficha) {
    int danoPersonagem = getDano(ficha);
    int danoInfligido = max((danoPersonagem - DEFESA_MONSTRO), 0);
    hpMonstro = max (hpMonstro - danoInfligido, 0);

    cout << "Você infligiu um total de " << danoInfligido;
    cout << " danos no monstro." << endl;
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

bool venceu() {
    return hpMonstro == ZERO_HP;
}

void iniciaBatalha(Ficha &ficha) {
    cout << "Um desafio se aproxima, um monstro te ataca..." << endl;
    bool batalhaFinalizada = false;

    while (!batalhaFinalizada) {
        char atacar = 'n';
        cout << "Atacar? (S/N) ";
        cin >> atacar;

        if (tolower(atacar) == 's') {
            ataquePersonagem(ficha);
        }

        cout << "Turno do monstro..." << endl;
        ataqueMonstro(ficha);

        cout << "Seu HP: " << getHP(ficha) << endl;
        cout << "Seu MP: " << getMP(ficha) << endl;

        cout << endl << "HP monstro: " << hpMonstro << endl << endl;

        batalhaFinalizada = (hpMonstro == ZERO_HP or getHP(ficha) == ZERO_HP);
    }

    if (venceu()) {
        cout << "Parabéns pela vitória!" << endl;
    } else {
        cout << "Morreu..." << endl;
    }
}
