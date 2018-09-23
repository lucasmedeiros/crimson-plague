#include <iostream>
#include "historia.h"
#include "personagem/criaPersonagem.h"

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
	char concordou = 'z';
	char dialogo = 'z';

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

    while(tolower(escolhaGancho) == 'z') {
    	cin >> escolhaGancho;

    	if(tolower(escolhaGancho) == 'a') {

    		cout << "Ao se aproximar dele, voce escuta:" << endl;
    		cout << "Nobre: Ei! Você aí! Voce tem cara de que consegue cuidar de si mesmo." << endl;
    		cout << "Nobre: Meu filho idiota veio pra cá para financiar as mineracoes dessa regiao, e eu nao" << endl;
    		cout << "Nobre: tenho notícia dele desde o mes passado. Se voce encontrar ele, eu te pagarei uma quantia" << endl;
    		cout << "Nobre: generosa de dinheiro! Voce vai perceber que é ele pelo simbolo da nossa familia que ele carrega." << endl;
    		cout << "O nobre se aproxima de voce e mostra o simbolo. Ele entao diz:" << endl;
    		cout << "Nobre: Voce ira me ajudar?" << endl;

    		concordou = perguntaSimNao();
    		
    	} else if (tolower(escolhaGancho) == 'b') {
    		cout << "Voce nao demora muito pra perceber que eles sao mineradores" << endl;
    		cout << "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:" << endl;
    		cout << "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte." << endl;
    		cout << "Minerador: voce parece forte. Por favor, acabe com esse mal!" << endl;

    	} else if (tolower(escolhaGancho) == 'c') {
    		cout << "Voce encontra diversos moradores atonitos na vila." << endl;
    		cout << "Uma das moradoras se aproxima de voce e diz:" << endl;
    		cout << "Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro" << endl;
    		cout << "Senhora: meus dois filhos ja foram tomados pela praga. Eu imploro, por favor acabe com isso." << endl << endl;
    		cout << "O que você responderá pra ela:" << endl;

    		cout << "a) Você poderia falar mais sobre essa praga?" << endl;
			cout << "b) Onde eu posso acabar com isso?" << endl;

			while(tolower(dialogo) == 'z') {
				cin >> dialogo;

				if(tolower(dialogo == 'a')) {
					cout << "Senhora: Chamam de praga Carmesim, ela começa de forma inofensiva." << endl;
					cout << "Senhora: Porem, aos poucos ela vai ficando pior. Cada vez mais roubando a sua forca." << endl;
					cout << "Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca. Fazem quatro dias que meus filhos estao doentes..." << endl;
					cout << "Senhora: Eu nao sei quanto tempo eles ainda podem aguentar... Por favor, acabe com essa praga." << endl;
					cout << "Ela comeca a chorar. Solucando um pouco, ela diz:"
					cout << "Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la. Por favor, me ajude..." << endl;

				} else if (tolower(dialogo) == 'b') {
					cout << "Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la." << endl;
					cout << "Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca. Fazem quatro dias que meus filhos estao doentes..." << endl;
					cout << "Senhora: Eu nao sei quanto tempo eles ainda podem aguentar... Por favor, acabe com essa praga." << endl;
					cout << "Apesar de tentar disfacar, voce percebe que ela comeca a chorar." << endl;
					
				} else {
					cout << "Opção inválida!" << endl;
    				dialogo = 'z';
				}

			}

    	} else if (tolower(escolhaGancho) == 'd') {
    		cout << "Isso nao e problema seu. Voce ja tem problemas demais pra resolver." << endl;
    		cout << "Esses camponeses conseguem resolver esse problema sozinho. Voce tem certeza disso." << endl;

    	} else {
    		cout << "Opção inválida!" << endl;
    		escolhaGancho = 'z'; 
    	}
    		
    }

    
    concordou = perguntaSimNao();

    if(tolower(escolhaGancho) != 'd') {
    	concordou = perguntaSimNao();

    	if(tolower(concordou) == 'n'){
    		escolhaGancho = 'd';
    		cout << "Com um olhar de desaprovacao, lentamente comecam a se afastar de voce." << endl;
    	} else {
    		cout << "Mal sei o que dizer. Muito obrigado!!" << endl;
    	}
    }

	return escolhaGancho;
}

char segundaChance(Personagem &personagem) {
	char escolhaDialogo = 'z';
	char escolhaDialogo2 = 'z';
	char opcao = 'z';

	cout << "Uma pessoa se aproxima de você, ela te parece familiar" << endl;	
	cout << "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen." << endl;
	cout << "Um guerreiro que costumava lutar com você, alguns anos atrás. Ele está bem magro, comparado" << endl;
	cout << "ao tempo que ele lutava com você. Ele se aproxima e diz:" << endl;
	cout << "Meruen: Há quanto tempo, " << personagem.nome << ". Há algo de errado em uma mina próxima dessa região" << endl;
	cout << "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo" << endl;
	cout << "Meruen: é provável que ela esteja causando a praga que está assolando essa vila." << endl << endl;

	cout << "O que você responderá pra ele:" << endl;
	cout << "a) Você poderia falar mais sobre essa praga?" << endl;
	cout << "b) Você está bem?" << endl;
	cout << "c) Há alguma coisa que eu possa ajudar?" << endl;

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
			break;
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

void imprimirPrimeiroFinal() {
	cout << "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila." << endl;
	cout << "Duas semanas depois, em outra vila a procura de um artefato." << endl;
	cout << "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga." << endl;
	cout << "Aqueles que sobreviveram foram os que fugiram de Passagem de Duvik enquanto nao tinham sido contaminados" << endl;
	cout << "A promissora cidade comerciante, se tornou apenas uma ruina, uma promessa do que poderia se tornar." << endl;
}
 
char perguntaSimNao() {
	char resposta;

	while (tolower(opcao) != 's') {
    	cout << "O que você ira responder: (S/N) ";
    	cin >> resposta;
    	cout << "Tem certeza? (S/N): ";
    	cin >> opcao;
  	}

  	return resposta;
}

void imprimirCreditos() {

	cout << "Obrigado por jogar: A Praga Carmesim!" << endl << endl;
	cout << "Sistema inspirado: Dungeons and Dragons, quinta edicao." << endl << endl;
	cout << "Feito por:" << endl << endl;
	cout << "Jadson Luan" << endl;
	cout << "Jessé Souza" << endl;
	cout << "Lucas de Medeiros" << endl;
	cout << "Marcella Siqueira" << endl;
	cout << "Mikael Brasileiro" << endl << endl;
	cout << "Existem mais finais para serem desbravados, tente conseguir outro jogando novamente!" << endl;

}

void contaHistoria(Ficha &ficha) {
	EscolhasCidade escolhasCidade;
	Personagem personagem = ficha.personagem;

	introducaoCidade();

	escolhasCidade.ganchoAventura = ganchoAventura();

	if(tolower(escolhasCidade.ganchoAventura) == 'z') {
		escolhasCidade.segundaChance = segundaChance(personagem);
	} else {
		escolhasCidade.segundaChance = 'y';
	}

	if(tolower(escolhasCidade.segundaChance) == 'n') {
		imprimirPrimeiroFinal();
		imprimirCreditos();
	}

}