#include <iostream>
#include "historia.h"

void introducaoCidade() {

	
	cout << "" << endl;
	cout << "É uma manhã ensolarada, você se encontra em Passagem de Duvik, uma pequena cidade" << endl;
	cout << "situada em um dos pequenos vales que cruzam as Montanhas Serpente." << endl;
	cout << "Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros" << endl;
	cout << "procurando descansar membros doloridos e afogar memórias ruins dentro de seus portões." << endl;
	cout << "E você não é uma exceção. No entanto algo te parece estranho, a cidade parece bem vazia" << endl;
	cout << "Você não consegue encontrar, os inúmeros animais que existiam ao redor da cidade." << endl;
}

char ganchoAventura() {
	char escolhaGancho = 'z';
	char opcao = 'n';

	cout << "Você está na praça principal da cidade, você percebe algumas pessoas que te chamam a atenção:" << endl;
	cout << "Um homem com roupas nobres, não parece ser dessa cidade." << endl;
	cout << "Um grupo de pessoas com manchas de carvão no rosto e braços." << endl;
	cout << "Alguns moradores que estão claramente abatidos." << endl;

	// Escolha do gancho para a aventura
	
	cout << "Qual deles você irá se aproximar:" << endl;
	cout << "a) O homem aparentemente rico." << endl;
	cout << "b) As pessoas sujas de carvão." << endl;
	cout << "c) Os moradores da cidade." << endl;
	cout << "d) Ninguém." << endl;

	while (tolower(opcao) != 's') {

    	while(tolower(escolhaGancho) == 'z'){
    		cin >> escolhaGancho;

    		if(tolower(escolhaGancho) != 'a' and tolower(escolhaGancho) != 'b' and
    			tolower(escolhaGancho) != 'c' and tolower(escolhaGancho) != 'd') {

    			cout << "Opção inválida!" << endl;
    			escolhaGancho = 'z'; 
    		}

    	}

    }

    return escolhaGancho;

}

char segundoGancho(Personagem personagem) {
	char escolhaDialogo = 'z';
	char escolhaDialogo2 = 'z';
	char opcao = 'n';

	cout << "Uma pessoa se aproxima de você, ela te parece familiar" << endl;	
	cout << "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen." << endl;
	cout << "Um guerreiro que costumava lutar com você, alguns anos atrás. Ele está bem magro, comparado" << endl;
	cout << "ao tempo que ele lutava com você. Ele se aproxima e diz:" << endl;
	cout << "Meruen: Há quanto tempo, " << personagem.nome << ". Há algo de errado em uma mina próxima a essa região" << endl;
	cout << "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo" << endl;
	cout << "Meruen: é provável que ela esteja causando a praga que está assolando essa vila." << endl;

	while(true) {

		cin >> escolhaDialogo;

		if(tolower(escolhaDialogo) == 'a') {
			cout << "Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva" << endl;
			cout << "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana." << endl;
			cout << "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias..." << endl;
			cout << "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor." << endl;
			break;	
		} else if (tolower(escolhaDialogo) == 'b') {
			cout << "Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..." << endl;
			cout << "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor." << endl;
			break;
		} else if (tolower(escolhaDialogo) == 'c') {
			cout << "Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar" << endl;
			cout << "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..." << endl;
			cout << "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?" << endl;
			berak;
		} else {
			cout << "Opção inválida!" << endl;
		} 

	}

	while (tolower(opcao) != 's') {
    		cout << "Digite uma opção (S/N) ";
    		cin >> escolhaDialogo2;
    		cout << "Tem certeza? (S/N): ";
    		cin >> opcao;
  		}

  		if(tolower(escolhaDialogo2) == 's') {
  			cout << "Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina." << endl;
  			cout << "Meruen: Muito obrigado, amigo." << endl;
  		} else {
  			cout << "Meruen: Você é tão vazio quanto sua alma." << endl;
  			cout << "Meruen se afasta lentamente de você." << endl;
  		}

  		return escolhaDialogo2;
}

boolean validaEscolha(char escolha) {
	if(tolower(escolha) != 'a' and tolower(escolha) != 'b' and
    	tolower(escolha) != 'c') {
		return false;
	} else {
		return true;
	}
}