#include <iostream>
#include "historia.h"

char perguntaSimNao() {
	char resposta;
	char opcao;

	while (tolower(opcao) != 's') {
    	cout << "O que você ira responder: (S/N) ";
    	cin >> resposta;
    	cout << "Tem certeza? (S/N): ";
    	cin >> opcao;
  	}

  	return resposta;
}

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
					cout << "Ela comeca a chorar. Solucando um pouco, ela diz:" << endl;
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

void entradaMina() {
	char escolhaDialogo = 'z';
	int dadoObservar;
	
	
	//Descricao da entrada da caverna.
	cout << "" << endl;
	cout << "Após algumas horas de caminhada, você chega na caverna." << endl;
	cout << "Uma brisa fria desce dos picos da Montanha Serpente" << endl;
	cout << "Enrolada enquanto voce contempla a entrada para as" << endl;
	cout << "cavernas. O chao coberto de neve está cheio de ferramentas," << endl;
	cout << "picaretas e pas, muitas das quais sobressaindo dos montes" << endl;
	cout << "de neve. Um unico corredor escuro conduz as profundezas" << endl;
	cout << "da mina a frente. O caminho de terra abaixo, que possui" << endl;
	cout << "estruturas de suporte de madeira, esta coberto com escombros" << endl;
	cout << "de pedra, uns pedacos ocasionalmente brilham com o menor" << endl;
	cout << "pedaço de minerio. Nenhuma luz lanca-se para fora" << endl;
	cout << "do tunel. Tochas queimadas estão espalhadas pelo chao," << endl;
	cout << "seus suportes quebrados nas paredes do tunel. Atras de" << endl;
	cout << "voces, a estrada gasta conduz através dos precipicios para o" << endl;
	cout << "vale abaixo. Alem do suave assobio do vento, um completo" << endl;
	cout << "silencio preenche a abertura nas montanhas." << endl;
	
	//Escolha do setor.
	cout << "Você está em frente a entrada da mina, o que voce vai fazer?" << endl;
	
	cout << "a) Tentar analisar com mais detalhes a entrada da caverna." << endl;
	cout << "b) Procurar por alguma coisa ao redor da entrada." << endl;
	cout << "c) Acender uma tocha e entrar na caverna." << endl;
	
	while(escolhaDialogo == 'z') {
		cin >> escolhaDialogo;
		
		if (escolhaDialogo == 'a') {
			dadoObservar = rolarDado(20);
			
			primeiraEscolhaEntrada(dadoObservar);
			
		} else if (escolhaDialogo == 'b') {
			dadoObservar = rolarDado(20) + 2;
			
			segundaEscolhaEntrada(dadoObservar);
			
		} else if (escolhaDialogo == 'c') {
			cout << "Analisar as coisas e perda de tempo, seus inimigos nao tem" << endl;
			cout << "uma chance contra você mesmo... Voce acende uma tocha, respira" << endl;
			cout << "fundo e entra na mina." << endl;
		} else {
			cout << "Opcao invalida!" << endl;
			escolhaDialogo = 'z';
		}
	}
	
	cout << "" << endl;

}

void primeiraEscolhaEntrada(int dadoObservar) {
	
	if (dadoObservar >= 10) {
		cout << "Voce percebe que os suportes de madeira do tunel" << endl;
		cout << "estao lascados e despedacados, como se tivessem danificados" << endl;
		cout << "em uma recente batalha." << endl;
				
		if(dadoObservar >= 15) {
			cout << "Voce tambem percebe que elas estao manchadas de sangue." << endl;
			//Xp += 300
		}
				
		//Xp += 400
		cout << "Logo após a analise, voce acende uma tocha e entra na caverna." << endl;
	}
}

void segundaEscolhaEntrada(int dadoObservar) {
	
	if(dadoObservar >= 10 and dadoObservar < 15) {
		cout << "No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!" << endl;
		cout << "No entanto, voce nao encontrou nada que pode ser util para entender" << endl;
		cout << "o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna." << endl;
		// XP += 300
	} else if (dadoObservar >= 15) {
		cout << "No meio as picaretas e pas quebradas, voce encontra duas pocoes de vida!" << endl;
		cout << "Possivelmente elas serao uteis... Voce tambem encontra um simbolo" << endl;
		cout << "associados a kobolds, pequenas criaturas que sao conhecidas por serem" << endl;
		cout << "saqueadores. E provavel que tenha havido um combate por aqui. Voce" << endl;
		cout << "acende uma tocha e entra na caverna com atencao redobrada." << endl;
		// XP += 500 
	}

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

void contaHistoria(Ficha &ficha, Escolhas &escolhas) {
	EscolhasCidade escolhasCidade = escolhas.escolhasCidade;
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
	} else {
		entradaMina();
	}

}
