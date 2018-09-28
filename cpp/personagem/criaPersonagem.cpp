#include <iostream>
#include "criaPersonagem.h"
#include <ctype.h>

using namespace std;

void informacoesClasses(WINDOW *janelaDialogo) {

    string linha1 = "Guerreiro:";
    string linha2 = "Guerreiros são exímios lutadores marciais, sempre prontos para lutar. Possuem extremas habilidades de combate corpo a corpo.";
    string linha3 = "";
    string linha4 = "Mago:";
    string linha5 = "Magos são pesquisadores das artes arcanas da Idade Média e utilizam-as em suas batalhas, porém são fisicamente fracos e não possuem habilidades de combate com armas.";
    string linha6 = "";
    string linha7 = "Ladino:";
    string linha8 = "Bem furtivos e escorregadios, ladinos, se não estão roubando algo, estão trabalhando numa busca por um tesouro. Possuem altas habilidades em combates de longa distância e armas de longo";
    string linha9 = "alcance.";

    string informacoes[9] = {
        linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8, linha9
    };

    mostraDialogo(janelaDialogo, "INFORMACOES", informacoes, 9);
}


void ajustaAtributos(Ficha &ficha) {
    Classe classePersonagem = ficha.personagem.classe;

    switch (classePersonagem) {
        case GUERREIRO:
        ficha.atributos.forca += 2;
        ficha.atributos.vitalidade += 1;
        ficha.atributos.destreza -= 1;
        ficha.atributos.inteligencia -= 2;
        break;
        case MAGO:
        ficha.atributos.inteligencia += 2;
        ficha.atributos.sorte += 1;
        ficha.atributos.destreza -= 1;
        ficha.atributos.forca -= 2;
        break;
        case LADINO:
        ficha.atributos.destreza += 2;
        ficha.atributos.inteligencia += 1;
        ficha.atributos.carisma -= 1;
        ficha.atributos.vitalidade -= 2;
        break;
    }
}

string defineNomePersonagem() {
    printw("Insira o seu nome: ");
    string nome = getstring();
    clear();
    refresh();
    return nome;
}

Classe defineClassePersonagem(WINDOW *janelaMenu, WINDOW *janelaDialogo) {
    string classes[4] = {"Guerreiro", "Mago", "Ladino", "INFORMACOES DAS CLASSES"};
    bool confirmou = false;
    int classe;
    while (!confirmou) {
        classe = realizaPergunta(janelaMenu, "Escolha sua classe", classes, 4);
        if (classe < 3) {
            confirmou = confirmacao(janelaMenu);
        } else {
            informacoesClasses(janelaDialogo);
        }
    }
    wclear(janelaMenu);
    refresh();
    wrefresh(janelaMenu);
    return (Classe) (classe + 1);
}

Ficha criarPersonagem(WINDOW *janelaMenu, WINDOW *janelaDialogo) {
    Ficha ficha;
    Personagem personagem;

    personagem.nome = defineNomePersonagem();
    personagem.classe = defineClassePersonagem(janelaMenu, janelaDialogo);

    ficha.personagem = personagem;

    ajustaAtributos(ficha);
    // distribuiPontos(window, ficha);

    ficha.personagem.hp = getMaxHP(ficha);
    ficha.personagem.mp = getMaxMP(ficha);

    return ficha;
}
