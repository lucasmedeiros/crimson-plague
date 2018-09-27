#include <iostream>
#include "historia.h"

char perguntaSimNao(WINDOW *janelaMenu) {
	int resposta;

	string opcoesFala[2] = {"Sim", "Não"};
	resposta = realizaPergunta(janelaMenu, "O que você irá responder: ", opcoesFala, 2);

  	return resposta == 0 ? 's' : 'n';
}

void introducaoCidade(WINDOW *janelaDialogo) {
	string falas[6] = {"É uma manhã ensolarada, você se encontra em Passagem de Duvik, uma pequena cidade",
	"situada em um dos pequenos vales que cruzam as Montanhas Serpente.",
	"Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros",
	"procurando descansar membros doloridos e afogar memórias ruins dentro de seus portões.",
	"E você não é uma exceção. No entanto algo te parece estranho, a cidade parece bem vazia",
	"Você não consegue encontrar, os inúmeros animais que existiam ao redor da cidade."};

	mostraDialogo(janelaDialogo, "Introdução", falas, 6);
}

int ganchoAventura(WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaGancho = 0;
	int concordou = 0;
	int dialogo = 0;

	string descricaoPessoas[5] = {"Você está na praça principal da cidade e, percebe",
	"algumas pessoas que te chamam a atenção:",
	"Um homem com roupas nobres, não parece ser dessa cidade.",
	"Um grupo de pessoas com manchas de carvão no rosto e braços.",
	"Alguns moradores que estão claramente abatidos."};

	mostraDialogo(janelaDialogo, "Praça da cidade", descricaoPessoas, 5);

	// Escolha do gancho para a aventura

	string pessoasPraca[4] = {"O homem aparentemente rico.",
	"As pessoas sujas de carvão.",
	"Os moradores da cidade.",
	"Ninguém."};

	escolhaGancho = realizaPergunta(janelaMenu, "Qual deles você irá se aproximar:", pessoasPraca, 4);

    if(escolhaGancho == 0) {
		string dialogoMorador[7] = {"Ao se aproximar dele, voce escuta:",
		"Prefeito: Saudações. Eu sou o prefeito dessa cidade.",
		"Prefeito: muitos dos moradores da vila estão sofrendo de uma",
		"Prefeito: doenca extremamente letal. Não pude deixar de notar",
		"Prefeito: que você é um aventureiro, você poderia nos ajudar",
		"Prefeito: a acabar com essa doença? Por favor, muitos já",
		"Prefeito: morreram com essa praga."};

		mostraDialogo(janelaDialogo, "Ao se aproximar dele, voce escuta:", dialogoMorador, 7);

    } else if (escolhaGancho == 1) {
		string dialogoMorador[4] = {"Voce nao demora muito pra perceber que eles sao mineradores",
		"Ao se aproximar, um dos mineradores, com os olhos arregalados grita:",
		"Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte.",
		"Minerador: voce parece forte. Por favor, acabe com esse mal!"};

		mostraDialogo(janelaDialogo, "Dialogo Minerador", dialogoMorador, 4);

	} else if (escolhaGancho == 2) {
		string dialogoMorador[4] = {"Voce encontra diversos moradores atonitos na vila.",
		"Uma das moradoras se aproxima de voce e diz:",
		"Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro",
		"Senhora: meus dois filhos ja foram pegaram praga. Eu imploro, por favor acabe com isso."};

		string opcoesFala[2] = {"Você poderia falar mais sobre essa praga?",
		"Onde eu posso acabar com isso?"};

		dialogo = realizaPergunta(janelaMenu, "O que você responderá pra ela:", opcoesFala, 2);

		if(dialogo == 0) {
				string falasSenhora[6] = {"Senhora: Chamam de praga Carmesim, ela começa de forma inofensiva.",
				"Senhora: Porem, aos poucos ela vai ficando pior. Cada vez mais roubando a sua forca.",
				"Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca.", 
				"Senhora: Fazem quatro dias que meus filhos estao doentes...",
				"Ela comeca a chorar. Solucando um pouco, ela diz:" ,
				"Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la. Por favor, me ajude..."};

				mostraDialogo(janelaDialogo, "Ela responde:", falasSenhora, 6);

		} else {
			string falasSenhora[5] = {"Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la.",
			"Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca.", 
			"Senhora: Fazem quatro dias que meus filhos estao doentes...",
			"Senhora: Eu nao sei quanto tempo eles ainda podem aguentar... Por favor, acabe com essa praga.",
			"Apesar de tentar disfaçar, você percebe que ela começa a chorar."
			};

			mostraDialogo(janelaDialogo, "Ela responde:", falasSenhora, 4);

		} 

    } else {
		string descricaoNinguem[3] = {"Isso não é problema seu. Você já tem problemas demais pra resolver.",
		"Esses camponeses conseguem resolver esse problema sozinho.",
		"Ao menos você acha isso."};
		mostraDialogo(janelaDialogo, "Conclusão", descricaoNinguem, 3);
	}
    
    if(escolhaGancho != 3) {
    	concordou = perguntaSimNao(janelaMenu);
		string *respostaPessoa;

    	if(concordou == 1) {
    		respostaPessoa[0] = "Com um olhar de desaprovação, lentamente começam a se afastar de você.";
    	} else {
    		respostaPessoa[0] =  "Mal sei o que dizer. Muito obrigado!!";
    	}
		
		mostraDialogo(janelaDialogo, "Resposta", respostaPessoa, 1);
    }

	return escolhaGancho;
}

char segundaChance(Personagem &personagem, WINDOW *janelaMenu) {
	char escolhaDialogo;
	char escolhaDialogo2;


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

	escolhaDialogo2 = perguntaSimNao(janelaMenu);

  	if(tolower(escolhaDialogo2) == 's') {
  		cout << "Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina." << endl;
  		cout << "Meruen: Muito obrigado, amigo." << endl;
  	} else {
  		cout << "Meruen: Você é tão vazio quanto sua alma." << endl;
  		cout << "Meruen se afasta lentamente de você." << endl << endl;
  	}

  	return escolhaDialogo2;
}

void imprimePrimeiroFinal() {
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

char verificarCarroca(Ficha &ficha, WINDOW *janelaMenu) {
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

	coletou = perguntaSimNao(janelaMenu);

	if(tolower(coletou) != 'n') {
		cout << "Voce coleta os minerios sem problemas." << endl;
		adicionaDinheiro(ficha, 250);
	} else {
		cout << "Voce prefere nao arricar a pegar esses minerios." << endl;
	}

	aumentarXP(ficha, 250);

	return ativou;
}

char recepcaoCaverna(Ficha &ficha, WINDOW *janelaMenu) {
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

			ativou = verificarCarroca(ficha, janelaMenu);

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

	if(dadoCarisma >= 13) {
		cout << "Ao comecar a falar, os kobolds apesar de receiosos" << endl;
		cout << "resolvem escutar o que voce tem a dizer" << endl;
		cout << "O que vocẽ irá falar para eles? (Digite a, b ou c)" << endl << endl;

		cout << "a) Não precisamos brigar. Nenhum de nós quer isso! (Diplomacia)" << endl << endl;
		cout << "b) Não ousem me atacar se quiserem continuar vivos. (Intimidacao)" << endl << endl;
		cout << "c) Eu posso pagar uma quantia generosa se vocês esquecerem que" << endl;
		cout << "me viram. (Suborno)" << endl << endl;

		dadoPersuasao = rolarDado(20) + ficha.atributos.carisma;

		while (true) {
			cin >> dialogoCombate;

			if(tolower(dialogoCombate) == 'a') {
				if(dadoPersuasao >= 13) {
					cout << "Os kobolds parecem concordar com voce e abaixam as armas." << endl;
					cout << "O que parece ser o capitao daquele pequeno grupo fala:" << endl;
					cout << "Capitao: Nao temos forca pra lutar, doenca enfraquecer e matar" << endl;
					cout << "amigos. Humano pode seguir em frente." << endl;
					aumentarXP(ficha, 2500);
				} else {
					escolhaCombate = 'c';
				}

				break;

			} else if (tolower(dialogoCombate) == 'b') {
				if(dadoPersuasao >= (13 - ficha.atributos.forca)) {
					cout << "Os kobolds parecem, de fato, ficarem intimidados com voce." << endl;
					cout << "O que parece o capitao daquele pequeno grupo fala:" << endl;
					cout << "Tudo bem, humano pode passar. Só não nos mate, por favor." << endl;
					aumentarXP(ficha, 2250);

				} else {
					escolhaCombate = 'c';
				}

				break;

			} else if (tolower(dialogoCombate) == 'c') {
				int dinheiro = getDinheiro(ficha.inventario);

				if(dadoPersuasao >= 8 and dinheiro >= 200) {
					cout << "Os kobolds aceitam sua proposta, provavelmente por falta de" << endl;
					cout << "força ou coragem de lutar." << endl;
					cout << "Voce entrega o dinheiro para eles e segue seu caminho." << endl;
					escolhaCombate = 'm';
					aumentarXP(ficha, 2000);
					adicionaDinheiro(ficha, -200);
				} else {
					escolhaCombate = 'c';
				}

				break;

			} else {
				cout << "Opcao invalida!" << endl;
			}
		}
	}

	if(dadoCarisma < 13 or escolhaCombate == 'c') {
		cout << "O que parece ser o capitao daquele pequeno grupo fala:" << endl;
		cout << "Capitao: Nao importa o que humano fale, voce morre agora!" << endl;
		
		//Iniciar combate. 
		//Drops: 2 poções de vida e 2 de mana, bem como um minério de moonstone.

		aumentarXP(ficha, 2000);
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
				cout << "determinou que eles devem permanecer por mais um tempo." << endl << endl;
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
	char escolhaCombate;
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
	cout << "suspenso no ar. "<< endl;
	cout <<  posicaoCriaturas << endl;

	cout << "Os kobolds parecem bastante nervosos, o que voce irá fazer?" << endl << endl;

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

char depensaCaverna(Ficha &ficha) {
	int checkResistencia;
	char ficouContaminado;

	cout << "Uma porta de madeira fechada barra a entrada para essa" << endl;
	cout << "sala. Ao abrir porta você observa que esta sala longa" << endl;
	cout << "e estreita possui fileiras de estantes carregadas" << endl;
	cout << "de alimentos e outros suprimentos. Pesados sacos" << endl;
	cout << "de estopa estão empilhados até o teto no canto" << endl;
	cout << "oposto da câmara. Uns poucos rasgados, espalhando" << endl;
	cout << "aveia e farinha no chão. Muitos barris estão" << endl;
	cout << "agrupados próximos à parede norte." << endl << endl;

	cout << "Ao entrar na sala, uma armadilha é ativada!";
	cout << "Uma flecha é lançada em sua direção." << endl;

	checkResistencia = rolarDado(20) + (ficha.atributos.sorte / 4);
	// Remover depois.
	cout << checkResistencia << endl;

	if(checkResistencia >= 11) {
		cout << "Por sorte, a armadilha não te acerta." << endl;
	} else {
		cout << "A flecha perfura o seu ombro. Causando" << endl;
		cout << "um ferimento moderado." << endl;
		//Diminuir vida.
	}

	cout << "" << endl;
	cout << "A armadilha chama a atenção de algumas criaturas" << endl;
	cout << "que estavam nos barris e elas irão atacar você." << endl;
	cout << "Essas criaturas são ratos, no entanto, bem maiores" << endl;
	cout << "que o normal, e você tem a impressão que pode pegar" << endl;
	cout << "a praga lutando com elas." << endl;

	//iniciaBatlha(ficha) Drops: Arma +2 da classe, óleo;


	checkResistencia = rolarDado(20) + (ficha.atributos.vitalidade / 4);
	aumentarXP(ficha, 2000);
	cout << checkResistencia << endl;

	if(checkResistencia >= 10) {
		cout << "Apesar do contato com os ratos, você consegue" << endl;
		cout << "resistir a praga." << endl;
		ficouContaminado = 'n';
	} else {
		cout << "Após o combate, você sente que algo está errado..." << endl;
		cout << "Você está se sentindo um pouco mais fraco, talvez" << endl;
		cout << "você tenha contraído a praga." << endl;
		ficouContaminado = 's';
	}

	cout << "" << endl;
	cout << "Em um dos barris, você encontra duas poções de vida" << endl;
	cout << "e duas poções de mana, naturalmente você guarda elas." << endl;
	cout << "Elas podem ser bastante úteis no futuro." << endl << endl;


	cout << "Após os achados, você começa a descer uma rampa que" << endl;
	cout << "leva a uma parte inferior da caverna. Aos poucos " << endl;
	cout << "ela vai ficando muito íngrime, a um ponto que te" << endl;
	cout << "faz perder o equilíbrio e descer o resto da rampa" << endl;
	cout << "deslizando a mesma." << endl << endl;
	
	return ficouContaminado;
}

void rampaCaverna(Ficha &ficha) {
	char escolhaCaminho;

	cout << "Após descer a rampa e chegar no fundo da caverna" << endl;
	cout << "você olha que esta caverna enorme se estende" << endl;
	cout << "para cima até pelo menos 30 m, subindo alto para" << endl;
	cout << "dentro das entranhas da montanha. A iluminação" << endl;
	cout << "ocasionalmente reflete pequenos grãos prateados," << endl;
	cout << "que brilham na face parede oeste da caverna." << endl;
	cout << "Muitos cabos estão pendurados na beirada de um" << endl;
	cout << "largo vazio na parede. O buraco penetra a face" << endl;
	cout << "oeste da caverna e começa a cerca de 6 m de" << endl;
	cout << "onde você está. O ar aqui é mais frio e úmido." << endl << endl;

	cout << "De repente, você escuta vários passos. Não de" << endl;
	cout << "humanoides, mas de animais. Uma matilha de" << endl;
	cout << "lobos aparece por trás de algumas pedras e" << endl;
	cout << "começa a te cercar, e eles vão te atacar!" << endl << endl;

	//IniciaCombate(ficha);
	aumentarXP(ficha, 2000);

	cout << "Após o combate, você percebe que pode escalar" << endl;
	cout << "aqueles cabos pendurados. No entanto, também" << endl;
	cout << "existe um túnel à frente, o que você vai" << endl;
	cout << "fazer?" << endl << endl;
	cout << "a) Escalar os cabos." << endl << endl;
	cout << "b) Seguir em frente." << endl << endl;

	while(true) {
		cin >> escolhaCaminho;

		if(tolower(escolhaCaminho) == 'a') {
			int checkObservar = rolarDado(20);

			if(checkObservar >= 5) {
				cout << "Aṕos escalar os cabos, você sobe em uma" << endl;
				cout << "pedra e exerga uma passagem para o que" << endl;
				cout << "parece um acampamento, você consegue" << endl;
				cout << "exergar que existem muitos tesouros" << endl;
				cout << "lá dentro." << endl << endl;

				acampamentoSecreto(ficha);

			} else {
				cout << "Você escala os cabos, mas devido ao escuro," << endl;
				cout << "você não consegue enxergar nada. Sua única" << endl;
				cout << "opção é voltar e seguir o outro caminho." << endl << endl;
			}

			break;
		} else if (tolower(escolhaCaminho) == 'b') {
			cout << "Você prefere não se arriscar escalando esses" << endl;
			cout << "cabos. É mais sensato manter o foco e seguir" << endl;
			cout << "o caminho." << endl << endl;
			break;
		} else {
			cout << "Opcao invalida!" << endl;
		}

	}
}

void acampamentoSecreto(Ficha &ficha) {
	char escolhaAcampamento;

	cout << "Ao entrar na passagem, você encontra o acampa-" << endl;
	cout << "mento dos Kobolds, usado como área de estoque" << endl;
	cout << "e dormitório. Você encontra um baú e dois" << endl;
	cout << "jovens Kobolds, que estão olhando para você" << endl;
	cout << "e estão amedrontados. Um deles utiliza um capuz" << endl;
	cout << "que parece valioso." << endl;
	cout << "O que você irá fazer?" << endl;
	cout << "a) Matar eles e ficar com a capa." << endl;
	cout << "b) Poupar a vida deles e pegar apenas o tesouro." << endl;

	while(true) {
		cin >> escolhaAcampamento;

		if(tolower(escolhaAcampamento) == 'a') {
			cout << "Para você, a capa é mais valiosa que a vida" << endl;
			cout << "deles. Você os mata sem remorso e pega a" << endl;
			cout << "capa deles, com um pouco de investigação" << endl;
			cout << "você descobre que é uma capa da proteção." << endl << endl;
			//Drop: Capa da proteção +1
			break;
		} else if (tolower(escolhaAcampamento) == 'b') {
			cout << "Você poupa a vida deles, afinal, eles não" << endl;
			cout << "fizeram absolutamente nada. Simplesmente não" << endl;
			cout << "seria justo. Você pega três poções de vida" << endl;
			cout << "e duas de mana. Logo após, você desce os cabos " << endl;
			cout << "E segue o outro caminho." << endl << endl;
			aumentarXP(ficha, 1000);
			//Drop: Três poções de vida e duas de mana.
			break;
		} else {
			cout << "Opcao invalida!" << endl;
		}

	}

}

void pioraCondicao (Ficha &ficha) {
	cout << "A leve fraqueza que você estava sentindo" << endl;
	cout << "está demasiadamente pior, você já sente" << endl;
	cout << "um pouco de dificuldade em movimentos" << endl;
	cout << "bruscos ou que precisam de força. No entanto," << endl;
	cout << "você continua determinado a acabar com esse" << endl;
	cout << "problema." << endl << endl;
	//TODO alterar a vitalidade.
}

void fossoCadaveres(Ficha &ficha) {
	int checkInteligencia;

	cout << "Você passa pelo túnel. Ondas de calor banham" << endl;
	cout << "a caverna, adensando o ar e tornando a" << endl;
	cout << "respiração difícil. Esta caverna pequena e" << endl;
	cout << "em forma de tigela possui o chão cheio de" << endl;
	cout << "cadáveres humanóides. A abertura de um túnel" << endl;
	cout << "é visível na parede leste da câmara" << endl;
	cout << "e, na distância, o som de água corrente" << endl;
	cout << "pode ser ouvido." << endl << endl;

	checkInteligencia = rolarDado(20) + (ficha.atributos.inteligencia / 4);

	if(checkInteligencia >= 8) {
		cout << "Você acredita que aqui é o fosso da criação" << endl;
		cout << "da praga. Sejá la quem for que está fazendo" << endl;
		cout << "isso, não deve ficar longe de onde você está." << endl << endl;
	}

	cout << "Quatro zumbis levantam-se de um dos montes" << endl;
	cout << "de corpos! Prepare-se para o combate!" << endl;
	
	//IniciaCombate(ficha);
	aumentarXP(ficha, 2000);

	cout << "" << endl;
	cout << "Algo dentro de você diz que isso está perto" << endl;
	cout << "de acabar. Ao calmo som de água corrente. Você" << endl;
	cout << "entra no estreito túnel a leste." << endl;

}

void finalJakk(Ficha &ficha, Escolhas &escolhas) {
	char escolhaLuta;
	char solucao;
	bool interpretouSimbolos = false;
	int dadoReligiao = rolarDado(20) + ficha.atributos.inteligencia;

	cout << "" << endl;
	cout << "Ao entrar, nessa parte da caverna, você observa um" << endl;
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

	cout << "No centro, voce percebe uma imponente presena" << endl;
	cout << "Um garnde orc, com uma armadura de metal e uma" << endl;
	cout << "clava de aço na mão direita." << endl << endl;

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

			cout << "O Orc prepara sua maça enquanto você corre" << endl;
			cout << "em sua direção." << endl << endl;
			escolhas.conversaFinal.resultadoConversa = 'c';
			break;
		} else {
			cout << "Opcao invalida!" << endl;
		}

	}

}

char ConversaJakk(Ficha &ficha, Escolhas &escolhas) {
	char escolhaConversa;
	char respostaJakk;
	char convencerJakk;
	char solucaoJakk;
	bool interpretouSimbolos = escolhas.conversaFinal.interpretouSimbolos;

	cout << "Jakk: Meu nome é Jakk, o que voce quer? Voce" << endl;
	cout << "Jakk: se arricou muito para chegar aqui." << endl;
	cout << "Jakk: Que tolice." << endl;
	cout << "O que voce irá responder: (Digite a, b ou c.)" << endl << endl;
	cout << "a) O que você sabe sobre a praga?" << endl << endl;
	cout << "b) Eu tenho a cura, me mate e você nunca a obterá." << endl;
	cout << "(Enganação)" << endl << endl;
	cout << "c) Não importa o que voce sabe, eu vim aqui para lutar" << endl;
	cout << "com voce." << endl << endl;

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
		} else {
			cout << "Opcao invalida!" << endl;
		}
	}

	cout << "" << endl;
	cout << "O que voce irá responder: (Digite a, b)" << endl << endl;
	cout << "a) Por que está fazendo isso?" << endl;
	cout << "b) Então eu tenho o dever de pará-lo." << endl << endl;

	while(true) {

		cin >> respostaJakk;

		if(tolower(respostaJakk) == 'a') {
			cout << "Jakk: 10 anos atras, o povo de Passagem de Duvik quase" << endl;
			cout << "Jakk: exterminou o meu clã, o clã Garra Despedaçante, pois" << endl;
			cout << "Jakk: achavam que nós éramos uma ameaça. Eles não quiseram" << endl;
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
	cout << "a) Jakk, esqueca isso... Voce salvara a vida de muitas" << endl;
	cout << "Pessoas do seu clã, desistindo disso." << endl << endl;
	cout << "b) Seja um pouco racional... Isso nao trara alegria" << endl << endl;
	cout << "a ninguem." << endl << endl;

	if(interpretouSimbolos) {
		cout << "c) Eu tenho certeza que a vontade de Gruumsh é que" << endl;
		cout << "isso acabe pacificamente." << endl << endl;
	}

	//TO DO
	int checkCarisma = rolarDado(20) + ficha.atributos.carisma;

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



void imprimeVarianciasFinal(Ficha &ficha, Escolhas &escolhas) {
	char gancho = escolhas.escolhasCidade.ganchoAventura;
	cout << gancho << endl;

	if(tolower(gancho) == 'a') {
		cout << "O prefeito se aproxima de voce e fala:" << endl;
		cout << "Prefeito: Eu só tenho a agradecer a você, nobre aventureiro" << endl;
		cout << "Prefeito: Voce salvou a vida de quase todos da cidade!" << endl;
		cout << "Prefeito: Aqui estão 500 peças de ouro como recompensa" << endl;
		cout << "Prefeito: pelo seu feito. Sempre que você voltar," << endl;
		cout << "Prefeito: tenha a certeza que você será sempre bem recebido" << endl;
		cout << "Prefeito: aqui!" << endl << endl;
	} else if (tolower(gancho) == 'b') {
		cout << "O minerador que falou com voce anteriormente, se aproxima" << endl;
		cout << "e com um grande sorriso grita:" << endl;
		cout << "Minerador: Eu sabia! Eu sabia que você conseguiria!" << endl;
		cout << "Minerador: Voce salvou a vida de todos da cidade. E nós" << endl;
		cout << "Minerador: somos extremamente gratos a você! Eu não tenho" << endl;
		cout << "Minerador: muito, mas aqui está o que eu tenho, 500 peças" << endl;
		cout << "Minerador: de ouro." << endl;
		cout << "Minerador: Ei! Sempre que vir aqui, minha casa sempre estará" << endl;
		cout << "Minerador: de portas abertas! Nós não esqueceremos de você." << endl << endl;
	} else if (tolower(gancho) == 'c') {
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
		cout << "Meruen: Eu tinha certeza que você conseguiria, " << ficha.personagem.nome << "." << endl;
		cout << "Meruen: Você não só salvou minha vida como a de quase" << endl;
		cout << "Meruen: todos daqui da vila. Somos todos muito gratos" << endl;
		cout << "Meruen: a você. Aqui estão 500 peças de ouro, como uma" << endl;
		cout << "Meruen: forma de agradadecimento. Por fim, volte" << endl;
		cout << "Meruen: aqui de vez em quando. Seria muito bom" << endl;
		cout << "Meruen: te ver novamente!" << endl;
	}
}

void imprimeFinalPacifico() {
	cout << "Após convencer Jakk a terminar a maldição. A água" << endl;
	cout << "amaldiçoada, que servia como abastecimento de Passagem" << endl;
	cout << "de Duvik, foi aos poucos sendo purificada. Os sintomas" << endl;
	cout << "da Febre que afetam as pessoas de Passagem de Duvik" << endl;
	cout << "começaram a diminuir. E a ordem voltou a reinar na cidade." << endl << endl;

}

void imprimeFinalViolento() {
	cout << "Derrotar Jakk já possui um efeito visível imediato" << endl;
	cout << "nas águas da nascente, que	começa a ficar limpa da sujeira" << endl;
	cout << "da Febre logo após sua morte. Os sintomas" << endl;
	cout << "da Febre que afetam as pessoas de Passagem de Duvik" << endl;
	cout << "começaram a diminuir. E a ordem voltou a reinar na cidade." << endl << endl;
}

void imprimeFuturoVila() {
	cout << "Lentamente, Passagem de Duvik começou a se" << endl;
	cout << "reestruturar e a prosperar novamente. Alguns" << endl;
	cout << "anos depois, Passagem de Duvik se tornou uma das maiores" << endl;
	cout << "e ricas cidades do reino. No centro dela, há uma estatua sua," << endl;
	cout << "para relembrar quem tornou o sucesso dessa cidade possível!" << endl << endl;
}

void imprimeCreditos() {

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

void contaHistoria(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	EscolhasCidade escolhasCidade = escolhas.escolhasCidade;
	EscolhasRecepcao escolhasRecepcao = escolhas.escolhasRecepcao;
	Personagem personagem = ficha.personagem;

	introducaoCidade(janelaDialogo);

	// escolhasCidade.ganchoAventura = ganchoAventura(janelaDialogo, janelaMenu);

	// if(tolower(escolhasCidade.ganchoAventura) == 'd') {
	// 	escolhasCidade.segundaChance = segundaChance(personagem);
	// } else {
	// 	escolhasCidade.segundaChance = 'y';
	// }

	// cout << escolhas.escolhasCidade.ganchoAventura << endl;
	// cout << escolhas.escolhasCidade.segundaChance << endl;

	// if(tolower(escolhasCidade.segundaChance) == 'n') {
	// 	imprimePrimeiroFinal();
	// 	imprimeCreditos();
	// } else {
	// 	entradaMina(ficha);
	// 	escolhasRecepcao.ativouArmadilha = recepcaoCaverna(ficha);
	// 	escolhas.escolhasRefeitorio.solucaoCombate = refeitorioCaverna(ficha, escolhas);
	// 	escolhas.combateDespensa.contiminado = depensaCaverna(ficha);
	// 	rampaCaverna(ficha);
	// 	finalJakk(ficha, escolhas);

	// 	if(escolhas.conversaFinal.resultadoConversa == 'p') {
	// 		imprimeFinalPacifico();
	// 	} else {
	// 		imprimeFinalViolento();
	// 	}

	// 	imprimeVarianciasFinal(ficha, escolhas);
	// 	imprimeFuturoVila();
	// 	imprimeCreditos();
	// }
}
