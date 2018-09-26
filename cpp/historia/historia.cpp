#include <iostream>
#include "historia.h"

char perguntaSimNao() {
	char resposta;
	char opcao;

	while (tolower(opcao) != 's' and (tolower(resposta) != 's' or tolower(resposta) != 'n')) {
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

	cout << "Uma pessoa se aproxima de você, ela te parece familiar" << endl;
	cout << "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen." << endl;
	cout << "Um guerreiro que costumava lutar com você, alguns anos atrás. Ele está bem magro, comparado" << endl;
	cout << "ao tempo que ele lutava com você. Ele se aproxima e diz:" << endl;
	cout << "Meruen: Há quanto tempo, " << personagem.nome << ". Há algo de errado em uma mina próxima dessa região" << endl;
	cout << "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo" << endl;
	cout << "Meruen: é provável que ela esteja causando a praga que está assolando essa vila." << endl << endl;

	cout << "O que você responderá pra ele:" << endl << endl;
	cout << "a) Você poderia falar mais sobre essa praga?" << endl;
	cout << "b) Você está bem?" << endl;
	cout << "c) Há alguma coisa que eu possa ajudar?" << endl << endl;

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

	escolhaDialogo2 = perguntaSimNao();

  	if(tolower(escolhaDialogo2) == 's') {
  		cout << "Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina." << endl;
  		cout << "Meruen: Muito obrigado, amigo." << endl;
  	} else {
  		cout << "Meruen: Você é tão vazio quanto sua alma." << endl;
  		cout << "Meruen se afasta lentamente de você." << endl << endl;
  	}

  	return escolhaDialogo2;
}

void imprimirPrimeiroFinal() {
	cout << "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila." << endl;
	cout << "Duas semanas depois, em outra vila a procura de um artefato." << endl;
	cout << "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela" << endl;
	cout << "praga. Aqueles que sobreviveram foram os que fugiram" << endl;
	cout << "de Passagem de Duvik enquanto nao tinham sido contaminados" << endl;
	cout << "A promissora cidade comerciante, se tornou apenas uma ruina" << endl;
	cout << "uma promessa do que poderia se tornar." << endl << endl;
}

void entradaMina(Ficha &ficha) {
	char conversa = 'z';
	int dadoObservar;


	//Descricao da entrada da caverna.
	cout << "" << endl;
	cout << "Apos algumas horas de caminhada, voce chega na caverna." << endl;
	cout << "Uma brisa fria desce dos picos da Montanha Serpente" << endl;
	cout << "Enrolada enquanto voce contempla a entrada para as" << endl;
	cout << "cavernas. O chao coberto de neve esta cheio de ferramentas," << endl;
	cout << "picaretas e pas, muitas das quais sobressaindo dos montes" << endl;
	cout << "de neve. Um unico corredor escuro conduz as profundezas" << endl;
	cout << "da mina a frente. O caminho de terra abaixo, que possui" << endl;
	cout << "estruturas de suporte de madeira, esta coberto com escombros" << endl;
	cout << "de pedra, uns pedacos ocasionalmente brilham com o menor" << endl;
	cout << "pedaco de minerio. Nenhuma luz lanca-se para fora" << endl;
	cout << "do tunel. Tochas queimadas estão espalhadas pelo chao," << endl;
	cout << "seus suportes quebrados nas paredes do tunel. Atras de" << endl;
	cout << "voces, a estrada gasta conduz atraves dos precipicios para o" << endl;
	cout << "vale abaixo. Alem do suave assobio do vento, um completo" << endl;
	cout << "silencio preenche a abertura nas montanhas." << endl;

	//Escolha do setor.
	cout << "Você está em frente a entrada da mina, o que voce vai fazer?" << endl;

	while(true) {
		cout << "a) Tentar analisar com mais detalhes a entrada da caverna." << endl;
		cout << "b) Procurar por alguma coisa ao redor da entrada." << endl;
		cout << "c) Acender uma tocha e entrar na caverna." << endl;

		cin >> conversa;

		if (tolower(conversa) == 'a') {
			dadoObservar = rolarDado(20);
			primeiraEscolhaEntrada(dadoObservar, ficha);
			break;

		} else if (towlower(conversa) == 'b') {
			dadoObservar = rolarDado(20) + 2;
			segundaEscolhaEntrada(dadoObservar, ficha);
			break;

		} else if (tolower(conversa) == 'c') {
			cout << "Analisar as coisas e perda de tempo, seus inimigos nao tem" << endl;
			cout << "uma chance contra você mesmo... Voce acende uma tocha, respira" << endl;
			cout << "fundo e entra na mina." << endl;
			break;

		} else {
			cout << "Opcao invalida!" << endl;
		}
	}

	cout << "" << endl;

}

void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha) {

	if (dadoObservar >= 10) {
		cout << "Voce percebe que os suportes de madeira do tunel" << endl;
		cout << "estao lascados e despedacados, como se tivessem danificados" << endl;
		cout << "em uma recente batalha." << endl;

		if(dadoObservar >= 15) {
			cout << "Voce tambem percebe que elas estao manchadas de sangue." << endl;
			aumentarXP(ficha, 300);
		}

		aumentarXP(ficha, 400);
		cout << "Logo após a analise, voce acende uma tocha e entra na caverna." << endl;
	}
}

void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha) {

	if(dadoObservar >= 10 and dadoObservar < 15) {
		cout << "No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!" << endl;
		cout << "No entanto, voce nao encontrou nada que pode ser util para entender" << endl;
		cout << "o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna." << endl;
		aumentarXP(ficha, 300);
	} else if (dadoObservar >= 15) {
		cout << "No meio as picaretas e pas quebradas, voce encontra duas pocoes de vida!" << endl;
		cout << "Possivelmente elas serao uteis... Voce tambem encontra um simbolo" << endl;
		cout << "associados a kobolds, pequenas criaturas que sao conhecidas por serem" << endl;
		cout << "saqueadores. E provavel que tenha havido um combate por aqui. Voce" << endl;
		cout << "acende uma tocha e entra na caverna com atencao redobrada." << endl;
		aumentarXP(ficha, 500);
	} else {
		cout << "Voce buscar por alguns minutos, no entanto, voce nao encontra" << endl;
		cout << "nada relevante pra voce." << endl;
	}

}

char verificarCarroca(Ficha &ficha) {
	int checkReflexo;
	char coletou;
	char ativou = 'n';

	checkReflexo = rolarDado(20) + ficha.atributos.destreza;

	if(checkReflexo >= 12) {
		cout << "Ao arrastar o corpo, voce escuta um barulho de" << endl;
		cout << "mecanismos, voce rapidamente entende que e uma armadilha" << endl;
		cout << "e salta para tras, conseguindo desviar do ataque sonico" << endl;
		cout << "produzido pela mesma." << endl;
		aumentarXP(ficha, 250);
	} else {
		// Ideia status.
		cout << "Ao arrastar o corpo, voce escuta um barulho de" << endl;
		cout << "mecanismos, e uma armadilha que produz um som ensurdecedor" << endl;
		cout << "que deixa voce temporariamente surdo." << endl;
		ativou = 's';
		ficha.personagem.hp -= 3;

	}

	cout << "Ao analisar o corpo, voce percebe que ele tem marcas parecidos com" << endl;
	cout << "as vitimas da praga. Ele tem uma roupa diferente dos outros mineradores" << endl;
	cout << "Provavelmente era o chefe deles. Ele parece ter sido uma vitima de um ataque" << endl;
	cout << "tendo muitos ferimentos perfurantes no peito e pescoco." << endl;

	cout << "Voce tambem percebe inumeros pedacoes de prata ao redor da carroca." << endl;
	cout << "Voce ira coletar?" << endl;

	coletou = perguntaSimNao();

	if(tolower(coletou) != 'n') {
		cout << "Voce coleta os minerios sem problemas." << endl;
		ficha.dinheiro += 200;
	} else {
		cout << "Voce prefere nao arricar a pegar esses minerios." << endl;
	}

	aumentarXP(ficha, 250);

	return ativou;
}

char recepcaoCaverna(Ficha &ficha) {
	char ativou = 'n';
	char escolhaDialogo = 'z';
	int checkReflexo;

	cout << "O tunel se abre em uma camara pequena e aproximadamente" << endl;
	cout << "regular. Pedacos espalhados de minerio de prata cercam" << endl;
	cout << "um par de carro�as de madeira. A parte de baixo do que" << endl;
	cout << "aparenta ser um corpo humano se sobressai debaixo de uma" << endl;
	cout << "das carrocas. E nao mostra nenhum sinal de movimento." << endl;
	cout << "Sangue seco mancha a parede norte em varios locais." << endl;
	cout << "Saidas conduzem para o oeste e leste." << endl;

	cout << "O que voce vai fazer?" << endl;

	cout << "a) Analisar o corpo da carroca." << endl;
	cout << "b) Seguir em frente." << endl;

	while(tolower(escolhaDialogo) == 'z') {
		cin >> escolhaDialogo;

		if(tolower(escolhaDialogo) == 'a') {

			ativou = verificarCarroca(ficha);

		} else if (tolower(escolhaDialogo) == 'b') {
			cout << "Voce prefere nao se arriscar e mexer nesse corpo." << endl;
			cout << "E quase certo que havia alguma armadilha ali. Seria uma coin-" << endl;
			cout << "cidencia muito grande tantos minerios de prata espalhados uniformemente." << endl;

		} else {
			escolhaDialogo = 'z';
			cout << "Opcao Invalida!" << endl;
		}
	}

	cout << "Apos passar da carroca, voce so ve uma grande porta a sua frente." << endl;
	cout << "Voce nao ve outra opcao a nao ser entrar nela." << endl << endl;

	return ativou;
}

char dialogoCombateRefeitorio(Ficha &ficha) {
	char escolhaCombate = 'p';
	char dialogoCombate;
	int dadoCarisma = rolarDado(20) + ficha.atributos.carisma;
	int dadoPersuasao;

	if(dadoCarisma >= 17) {
		cout << "Ao comecar a falar, os kobolds apesar de receiosos" << endl;
		cout << "resolvem escutar o que voce tem a dizer" << endl;
		cout << "O que vocẽ irá falar para eles? (Digite a, b ou c)" << endl << endl;

		cout << "a) Não precisamos brigar. Nenhum de nós quer isso! (Diplomacia)" << endl;
		cout << "b) Não ousem me atacar se quiserem continuar vivos. (Intimidacao)" << endl;]
		cout << "c) Eu tenho a cura para a praga! Se voces me matarem nunca" << endl;
		cout << "   irão saber. Preciso falar sobre ela com seu lider. (Enganacao)" << endl;

		aumentarXP(ficha, 1000);
		dadoPersuasao = rolarDado(20) + ficha.atributos.carisma;

		while (true) {
			cin >> dialogoCombate;

			if(tolower(escolhaCombate) == 'a') {
				if(dadoPersuasao >= 13) {
					cout << "Os kobolds parecem concordar com voce e abaixam as armas." << endl;
					cout << "O que parece ser o capitao daquele pequeno grupo fala:" << endl;
					cout << "Capitao: Nao temos forca pra lutar, doenca enfraquecer e matar" << endl;
					cout << "amigos. Humano pode seguir em frente." << endl;
				} else {
					escolhaCombate = 'c';
				}

				break;

			} else if (tolower(escolhaCombate) == 'b') {
				if(dadoPersuasao >= (16 - ficha.atributos.forca)) {
					cout << "Os kobolds parecem, de fato, ficarem intimidados com voce." << endl;
					cout << "O que parece o capitao daquele pequeno grupo fala:" << endl;
					cout << "Capitao: Tudo bem, humano pode passar. So nao nos mate, por favor." << endl;

				} else {
					escolhaCombate = 'c';
				}

				break;

			} else if (tolower(escolhaCombate) == 'c') {
				if(dadoPersuasao >= 16) {
					cout << "Os kobolds acreditam em voce, provavelmente por uma esperanca" << endl;
					cout << "que essa praga finalmente acabe. O que parece o capitao daquele" << endl;
					cout << "pequeno grupo fala:" << endl;
					cout << "Capitao: A cura?! Humano deve falar com Lider! Ele sabera" << endl;
					cout << "O que fazer" << endl;
					escolhaCombate = 'm';
					aumentarXP(ficha, 5000);
				} else {
					escolhaCombate = 'c';
				}

				break;

			} else {
				cout << "Opcao invalida!" << endl;
			}
		}
	}

	if(dadoCarisma < 17 or escolhaCombate == 'c') {
		cout << "O que parece ser o capitao daquele pequeno grupo fala:" << endl;
		cout << "Capitao: Nao importa o que humano fale, voce morre agora!" << endl;
		//Iniciar combate.
	}

	return escolhaCombate;

}

string checkOuvirConhecimento(Ficha &ficha) {
	string posicaoCriaturas;
	char escolhaCombate;
	int dadoOuvir;
	int dadoConhecimento;

	dadoOuvir = rolarDado(20);

	if(dadoOuvir >= 10) {
		cout << "Voce consegue escutar varios passos do outro lado da porta" << endl;
		cout << "Alem disso, voce escuta varias vozes e o barulho dessas" << endl;
		dadoConhecimento = rolarDado(20) + ficha.atributos.inteligencia;
		aumentarXP(ficha, 250);

		if (dadoConhecimento >= 8 and dadoConhecimento < 12) {
				cout << "Voce consegue reconhecer que sao kobolds pelo idioma que" << endl;
				cout << "estao falando, draconico. O pouco que voce entende da conversa" << endl;
				cout << "é que os kobolds estão muito nervosos e gostariam de deixar as" << endl;
				cout << "minas o mais rápido possível. Infelizmente, seu comandante" << endl;
				cout << "determinou que eles devem permanecer por mais um tempo." << endl <, endl;
				aumentarXP(ficha, 150);

		} else if (dadoConhecimento >= 12 and dadoConhecimento < 16) {
				cout << "Voce consegue reconhecer que sao kobolds pelo idioma que" << endl;
				cout << "estao falando, draconico. O que voce entende da conversa" << endl;
				cout << "é que algum tipo de criatura tem roubado os mortos de seu" << endl;
				cout << "acampamento enquanto eles dormem. A maioria dos humanos" << endl;
				cout << "já foram roubados e até mesmo alguns cadáveres de kobolds" << endl;
				cout << "se perderam." << endl << endl;
				aumentarXP(ficha, 200);

		} else if (dadoConhecimento >= 16) {
			cout << "Voce consegue reconhecer que sao kobolds pelo idioma que" << endl;
			cout << "estao falando, draconico. Voce consegue entender bastante da" << endl;
			cout << "conversa, o mais importante que voce escuta é que" << endl;
			cout << "deve haver alguma maldição nesta mina. Metade do seu bando" << endl;
			cout << "já morreu de estranhas febres ou de uma tosse horrível." << endl << endl;
			aumentarXP(ficha, 250);

		} else {
			cout << "Voce nao consegue entender quase nada do que estao falando." << endl;
			cout << "No entanto, voce tem a impressao que sao kobolds." << endl << endl;
		}

	}

	posicaoCriaturas = "voce tambem suurpreende os tres kobolds que estao na sala";
	cout << "Voce abre a grande porta de madeira e enxerga:" << endl << endl;
	return posicaoCriaturas;
}

char refeitorioCaverna(Ficha &ficha, Escolhas &escolhas) {
	int numeroCriaturas;
	char solucaoCombate;
	string posicaoCriaturas;
	char ativou = escolhas.escolhasRecepcao.ativouArmadilha;

	if(tolower(ativou) != 's') {
		numeroCriaturas = 3;
		posicaoCriaturas = checkOuvirConhecimento(ficha);
	} else {
		numeroCriaturas = 4;
		cout << "Ter ativado a armadilha atraiu muito a atencao daqueles que" << endl;
		cout << "estao dentro da caverna, inclusive os kobolds dentro dessa sala." << endl;
		cout << "Voce escuta muitos gritos e passos, voce imagina que eles estao" << endl;
		cout << "se preparando para um combate. Ao abrir a porta você ve o seguinte:" << endl;

		posicaoCriaturas = "Voce também exerga quatro kobolds apontando para voce.";
	}

	cout << "Uma sala larga e quadrada abriga quatro longas mesas de" << endl;
	cout << "madeira, cada uma com um banco de cada lado. Em cima" << endl;
	cout << "das mesas estao um numero de tigelas de madeira e talheres" << endl;
	cout << "No canto sudeste da sala, um pequeno caldeirao fumega" << endl;
	cout << "sobre um fogao cravado no chao. Um cheiro pungente esta" << endl;
	cout << "suspenso no ar. " << posicaoCriaturas << endl << endl;

	cout << "Os kobolds parecem bastante nervosos, o que voce irá fazer?" << endl < endl;

	cout << "a) Tentar conversar com eles." << endl;
	cout << "b) Atacar imediatamente." << endl << endl;

	while(true) {
		cin >> escolhaCombate;

		if(tolower(escolhaCombate) == 'a') {
				solucaoCombate = dialogoCombateRefeitorio(ficha);
				break;
		} else if (tolower(escolhaCombate) == 'b') {
			cout << "Voce imediatamente comeca a preparar o seu ataque enquanto" << endl;
			cout << "os kobolds correm em direcao a voce." << endl;
			solucaoCombate = 'c';
			break;
		} else {
			cout << "Opcao invalida!" << endl;
		}

	}

	return solucaoCombate;

}

void finalJakk(Ficha &ficha, Escolhas &escolhas) {
	char escolhaLuta;
	char solucao;
	bool interpretouSimbolos = false;
	int dadoReligiao = rolarDado(20) + ficha.atributos.inteligencia;

	cout << "" << endl;
	cout << "Ao entrar, nessa parte da caverna, voce observa um" << endl;
	cout << "único pilar irregular, de pedra e cheio de um musgo" << endl;
	cout << "emerge das profundezas de um lago no centro da caverna." << endl;
	cout << "A água cai pelas suas laterais de uma fonte" << endl;
	cout << "próxima ao seu topo, cascateando até a lagoa abaixo." << endl;
	cout << "A lagoa alimenta uma larga correnteza que flui rapidamente" << endl;
	cout << "ao longo da extensão da sala e então por baixo da parede de" << endl;
	cout << "pedra na extremidade sul da caverna. Muitos símbolos estão" << endl;
	cout << "entalhados profundamente na face de pedra do pilar, suas" << endl;
	cout << "linhas apenas visíveis por baixo da luz do musgo. Uma" << endl;
	cout << "sensação estranha de desconforto impregna este lugar." << endl << endl;

	if(dadoReligiao >= 8) {
		cout << "Os símbolos entalhados aqui estão escritos" << endl;
		cout << "no idioma orc e servem como uma súplica a" << endl;
		cout << "Gruumsh (o deus dos orcs) para destruir" << endl;
		cout << "os inimigos com uma terrível pestilência." << endl;
		cout << "Eles também recontam a história das minas e o destino" << endl;
		cout << "do clã Garra Despedaçante" << endl << endl;
		interpretouSimbolos = true;

	}

	escolhas.conversaFinal.interpretouSimbolos = interpretouSimbolos;

	cout << "No centro, voce percebe uma imponente presenca" << endl;
	cout << "Um garnde orc, com uma armadura de metal e uma" << endl;
	cout << "clava de aço na mão direita." << endl << endl;

	if (escolhas.solucaoCombate == 'm') {
		imprimeFinalCurto();
	}

	cout << "O que voce vai fazer?" << endl << endl;
	cout << "a) Tentar conversar com ele." << endl;
	cout << "b) Atacar imediatamente." << endl << endl;

	while(true) {
		cin >> escolhaLuta;

		if(tolower(escolhaLuta) == 'a') {
				solucao = ConversaJakk(ficha, escolhas);
				escolhas.conversaFinal.resultadoConversa = solucao;
				break;
		} else if (tolower(escolhaLuta) == 'b') {
			solucao = 'c';
			break;
		} else {
			cout << "Opcao invalida!" << endl;
		}

	}

	if(solucao == 'p') {
		imprimeFinalPacifico(ficha, escolhas);
	} else {
		//Combate
		imprimeFinalViolento(ficha, escolhas);
	}

}

void imprimeConversaCapitao() {
	cout << "O capitao dos kobolds, se ajoelha e diz:" << endl;
	cout << "Capitao: Mestre, esse humano quer falar com voce." << endl;
	cout << "Humano diz que possui cura." << endl << endl;
	cout << "O orc então responde:" << endl << endl;
	cout << "Jakk: Tudo bem, deixem ele aqui e podem sair." << endl;
	cout << "Capitao: Sim senhor." << endl;
	cout << "Todos com exceção de voce e o Jakk (O lider deles) saíram" << endl < endl;
}

char ConversaJakk(Ficha &ficha, Escolhas &escolhas) {
	char escolhaConversa;
	char respostaJakk;
	char convencerJakk;
	char solucaoJakk;
	bool interpretouSimbolos = escolhas.conversaFinal.interpretouSimbolos;

	cout << "Jakk: Meu nome é Jakk, o que voce quer? Eu sei que" << endl;
	cout << "Jakk: voce nao tem a cura. Tenho certeza disso." << endl;
	cout << "O que voce irá responder: (Digite a, b ou c.)" << endl << endl;
	cout << "a) Como voce sabe?" << endl < endl;
	cout << "b) Eu tenho sim a cura." << endl << endl;
	cout << "c) Não importa o que voce sabe, eu vim aqui para lutar" << endl;
	cout << "com voce." << endl < endl;

	while(true) {
		cin >> escolhaConversa;

		if(tolower(escolhaConversa) == 'a') {
			cout << "Jakk: Eu que criei e estou matendo essa praga." << endl;
			cout << "Jakk: Eu enfeiticei a agua para causar essa doenca." << endl;
			cout << "Jakk: Portanto, cuspa logo o que voce quer ou lute comigo!" << endl;
			break;
		} else if (tolower(escolhaConversa) == 'b') {
			cout << "Jakk: Pare de mentir, humano insolente!" << endl;
			cout << "Jakk: Eu que criei e estou mantendo essa praga." << endl;
			cout << "Jakk: Eu enfeiticei a agua para causar essa doenca." << endl;
			cout << "Jakk: Entao cuspa logo o que voce quer ou lute comigo!" << endl;
			break;
		} else if (tolower(escolhaConversa) == 'c') {
			cout << "Jakk: Voce nao tem uma chance, seu verme." << endl;
			return escolhaConversa;
			break;
		} else {
			cout << "Opcao invalida!" << endl;
		}
	}

	cout << "" << endl;
	cout << "O que voce irá responder: (Digite a, b)" << endl << endl;
	cout << "a) Por que está fazendo isso?" << endl;
	cout << "b) Entao eu tenho o dever de para-lo." << endl << endl;

	while(true) {
		cin >> respostaJakk;

		if(tolower(respostaJakk) == 'a') {
			cout << "Jakk: 10 anos atras, o povo de Passagem de Duvik quase" << endl;
			cout << "Jakk: exterminou o meu cla, o clã Garra Despedaçante, pois" << endl;
			cout << "Jakk: achavam que nós eramos uma ameaça. Eles não quiseram" << endl;
			cout << "Jakk: ter nenhuma forma de conversa. Essa é a vinganca" << endl;
			cout << "Jakk: do meu clã." << endl;
			break;
		} else if (tolower(respostaJakk) == 'b') {
			cout << "Jakk: É hora de morrer, seu verme insolente!" << endl;
			respostaJakk = 'c';
			return respostaJakk;
			break;
		}  else {
			cout << "Opcao invalida!" << endl;
		}

		cout << "" << endl;
		cout << "O que voce irá responder: (Digite a, b ou c)" << endl << endl;
		cout << "a) Matando eles voce fica tao errado quanto aqueles" << endl;
		cout << "que mataram o seu cla. Voce nao combate odio com odio." << endl << endl;
		cout << "b) Voce esta matando ainda mais pessoas do seu cla. Voce" << endl;
		cout << "não viu a quantidade de kobolds mortos? Pare com isso," << endl;
		cout << "todos os seus soldados querem sair daqui e esquecer" << endl;
		cout << "tudo isso. Escute o seus suditos." << endl << endl;
		cout << "c) Isso nao justifica os seus erros. Voce morrera agora!" << endl << endl;

		while(true) {
			cin >> convencerJakk;

			if(tolower(convencerJakk) == 'a') {
				cout << "Jakk: O que voce sabe sobre meu cla? Voce nao sabe o que" << endl;
				cout << "Jakk: esta falando... Voce nao sabe o quanto meu cla sofreu." << endl;
				cout << "Jakk: Pare de falar sobre o que você não tem ideia." << endl;
				break;
			} else if (tolower(convencerJakk) == 'b') {
				cout << "Jakk parece um pouco relutante." << endl;
				cout << "Jakk: Eu sei, eu sou o que mais sofro com isso. No entanto," << endl;
				cout << "Jakk: todos eles concordaram com isso, eu tenho que valorizar" << endl;
				cout << "Jakk: as mortes daqueles que se sacrificaram pela causa!" << endl;
				break;
			} else if (tolower(convencerJakk) == 'c') {
				cout << "Jakk: Voce nao tem uma chance, seu verme." << endl;
				return escolhaConversa;
				break;
			} else {
				cout << "Opcao invalida!" << endl;
			}
		}

		cout << "" << endl;
		cout << "O que voce irá responder:" << endl << endl;
		cout << "a) Jakk, esqueca isso... Voce salvara a vida de muitas" << endl
		cout << "Pessoas do seu clã, desistindo disso." << endl << endl;
		cout << "b) Seja um pouco racional... Isso nao trara alegria" << endl << endl;
		cout << "a ninguem." << endl < endl;

		if(interpretouSimbolos) {
			cout << "c) Eu tenho certeza que a vontade de Gruumsh é que" << endl;
			cout << "isso acabe pacificamente." << endl < endl;
		}

		int checkCarisma = rolarDado(20) + (ficha.atributos.carisma / 4);

		while(true) {
			cin >> solucaoJakk;

			if((tolower(solucaoJakk) == 'a' or tolower(solucaoJakk) == 'b') and checkCarisma >= 10) {
				cout << "Jakk: É verdade... Meu povo está sofrendo demais com isso." << endl;
				cout << "Jakk: Eu vou quebrar o feitico imediatamente. Obrigado por" << endl;
				cout << "Jakk: trazer razao ao meu pensamento, humano." << endl;
				return 'p';
			} else if (tolower(solucaoJakk) == 'c' and interpretouSimbolos) {
				cout << "Jakk: Voce tem toda a razao... O que eu estava pensando?" << endl;
				cout << "Jakk: Eu vou quebrar o feitico imediatamente. Obrigado" << endl;
				cout << "Jakk: por trazer sensatez, humano." << endl;
				return 'p';
			} else if (checkCarisma < 10) {
				cout << "Jakk: Voce parece sensato, mas tenho que honrar meu clã" << endl;
				cout << "Jakk: É hora de lutar, humano." << endl;
				return 'c';
			} else {
				cout << "Opcao invalida!" << endl;
			}
		}

	}

}

void imprimeVarianciasFinal(Ficha &ficha, Escolhas &escolhas) {
	char gancho = escolhas.escolhasCidade.ganchoAventura;

	if(gancho == 'a') {
		cout << "O prefeito se aproxima de voce e fala:" << endl;
		cout << "Prefeito: Eu só tenho a agradecer a você, nobre aventureiro" << endl;
		cout << "Prefeito: Voce salvou a vida de quase todos da cidade!" << endl;
		cout << "Prefeito: Aqui estão 500 peças de ouro como recompensa" << endl;
		cout << "Prefeito: pelo seu feito. Sempre que você voltar," << endl;
		cout << "Prefeito: tenha a certeza que você será sempre bem recebido" << endl;
		cout << "Prefeito: aqui!" << endl << endl;
	} else if (gancho == 'b') {
		cout << "O minerador que falou com voce anteriormente, se aproxima" << endl;
		cout << "e com um grande sorriso grita:" << endl;
		cout << "Minerador: Eu sabia! Eu sabia que você conseguiria!" << endl;
		cout << "Minerador: Voce salvou a vida de todos da cidade. E nós" << endl;
		cout << "Minerador: somos extremamente gratos a você! Eu não tenho" << endl;
		cout << "Minerador: muito, mas aqui está o que eu tenho, 500 peças" << endl;
		cout << "Minerador: de ouro." << endl;
		cout << "Minerador: Ei! Sempre que vir aqui, minha casa sempre estará" << endl;
		cout << "Minerador: de portas abertas! Nós não esqueceremos de você." << endl << endl;
	} else if (gancho == 'c') {
		cout << "A camponesa que falou com você anteriormente, se aproxima" << endl;
		cout << "e com um grande sorriso fala:" << endl;
		cout << "Camponesa: Voce conseguiu! Meus filhos e os outros moradores" << endl;
		cout << "Camponesa: já estão melhorando e tudo isso graças a você!" << endl;
		cout << "Camponesa: Não me esquecerei do que você fez aqui!" << endl;
		cout << "Camponesa: Aqui estão 500 peças de ouro por tudo, que você" << endl;
		cout << "Camponesa: fez. Nós da vila nos juntamos para pode pagar" << endl;
		cout << "Camponesa: a você!" << endl;
		cout << "Camponesa: Volte aqui de vez em quando! Tenho certeza" << endl;
		cout << "Camponesa: que todos daqui adorariam te ver novamente!" << endl << endl;
	} else {
		cout << "Meruen, o seu amigo que requisitou a missão, se aproxima" << endl;
		cout << "e diz:" << endl;
		cout << "Meruen: Eu tinha certeza que você conseguiria." << endl;
		cout << "Meruen: Você não salvou minha vida como a de quase" << endl;
		cout << "Meruen: todos daqui da vila. Somos todos muito gratos" << endl;
		cout << "Meruen: a você. Aqui estão 500 peças de ouro. Como uma" << endl;
		cout << "Meruen: forma de agradadecimento. Por fim, volte" << endl;
		cout << "Meruen: aqui de vez em quando. Seria muito bom" << endl;
		cout << "Meruen: te ver novamente!" << endl;
	}
}

void imprimeFinalPacifico(Ficha &ficha, Escolhas &escolhas) {
	cout << "Após convencer Jakk a terminar a maldicao. A agua" << endl;
	cout << "amaldicoada, que servia como abastecimento de Passagem" << endl;
	cout << "de Duvik, foi aos poucos sendo purificada. Os sintomas" << endl;
	cout << "da Febre que afetam as pessoas de Passagem de Duvik" << endl;
	cout << "começaram a diminuir. E a ordem voltou a reinar na cidade." << endl << endl;

	imprimeVarianciasFinal(ficha, escolhas);

}

void imprimeFinalViolento(Ficha &ficha, Escolhas &escolhas) {
	cout << "Derrotar Jakk já possui um efeito visível imediato" << endl;
	cout << "nas águas da nascente, que	começa a ficar limpa da sujeira" << endl;
	cout << "da Febre logo após sua morte. Os sintomas" << endl;
	cout << "da Febre que afetam as pessoas de Passagem de Duvik" << endl;
	cout << "começaram a diminuir. E a ordem voltou a reinar na cidade." << endl;

	imprimeVarianciasFinal(ficha, escolhas);
}

void imprimeFuturoVila() {
	cout << "Lentamente, Passagem de Duvik começou a se" << endl;
	cout << "reestruturar e a prosperar novamente. Alguns" << endl;
	cout << "anos depois, Passagem de Duvik se tornou uma das maiores" << endl;
	cout << "e ricas cidades do reino. No centro dela, há uma estatua sua," << endl;
	cout << "para relembrar quem tornou o sucesso dessa cidade possível!" << endl;
}
void imprimirCreditos() {

	cout << "Obrigado por jogar: A Praga Carmesim!" << endl << endl;
	cout << "Sistema inspirado: Dungeons and Dragons, quinta edicao." << endl << endl;
	cout << "Feito por:" << endl << endl;
	cout << "Jadson Luan" << endl;
	cout << "Jesse Souza" << endl;
	cout << "Lucas de Medeiros" << endl;
	cout << "Marcella Siqueira" << endl;
	cout << "Mikael Brasileiro" << endl << endl;
	cout << "Existem mais finais para serem desbravados, tente conseguir outro jogando novamente!" << endl;

}



void contaHistoria(Ficha &ficha, Escolhas &escolhas) {
	EscolhasCidade escolhasCidade = escolhas.escolhasCidade;
	EscolhasRecepcao escolhasRecepcao = escolhas.escolhasRecepcao;
	Personagem personagem = ficha.personagem;

	introducaoCidade();

	escolhasCidade.ganchoAventura = ganchoAventura();

	if(tolower(escolhasCidade.ganchoAventura) == 'd') {
		escolhasCidade.segundaChance = segundaChance(personagem);
	} else {
		escolhasCidade.segundaChance = 'y';
	}

	if(tolower(escolhasCidade.segundaChance) == 'n') {
		imprimirPrimeiroFinal();
		imprimirCreditos();
	} else {
		entradaMina(ficha);
		escolhasRecepcao.ativouArmadilha = recepcaoCaverna(ficha);
		escolhas.solucaoCombate = refeitorioCaverna(ficha);

		if(solucaoCombate == 'm') {
			segundoFinal(ficha, escolhas);
		}
	}

}
