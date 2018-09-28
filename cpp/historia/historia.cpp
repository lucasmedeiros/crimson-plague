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

    	if(concordou == 'n') {
    		respostaPessoa[0] = "Com um olhar de desaprovação, lentamente começam a se afastar de você.";
    	} else {
    		respostaPessoa[0] =  "Mal sei o que dizer. Muito obrigado!!";
    	}
		
		mostraDialogo(janelaDialogo, "Resposta", respostaPessoa, 1);
    }

	return escolhaGancho;
}

bool segundaChance(Personagem &personagem, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
    int escolhaDialogo;
    bool escolhaDialogo2;
    int tamanho;
    string *falaMeruen;

    string apresentacaoAmigo[8] = {"Uma pessoa se aproxima de você, ela te parece familiar",
    "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen.",
    "Um guerreiro que costumava lutar com você, alguns anos atrás.",
    "Ele está bem magro, comparado ao tempo que ele lutava com você.",
    "Ele se aproxima e diz:",
    "Meruen: Há quanto tempo, amigo. Há algo de errado em uma mina próxima dessa região",
    "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo",
    "Meruen: é provável que ela esteja causando a praga que está assolando essa vila."};

    mostraDialogo(janelaDialogo, "Conversa Meruen", apresentacaoAmigo, 8);

    string escolhaFala[3] = {"Você poderia falar mais sobre essa praga?",
    "Você está bem?",
    "Há alguma coisa que eu possa ajudar?"};

    escolhaDialogo = realizaPergunta(janelaMenu, "O que você responderá pra ele:", escolhaFala, 3);

    if(escolhaDialogo == 0) {

        string falaMeruen[4] = {"Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva",
        "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana.",
        "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias...",
        "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."};
        tamanho = 4;

    } else if (escolhaDialogo == 1) {

        string falaMeruen[2] = {"Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias...",
        "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."};

        tamanho = 2;

    } else {

        string falaMeruen[3] = {"Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar",
        "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias...",
        "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?"};
        
        tamanho = 3;
    } 

    mostraDialogo(janelaDialogo, "Meruen responde: ", falaMeruen, tamanho);
    

    escolhaDialogo2 = perguntaSimNao(janelaMenu);
    string *respostaMeruen;

    if(escolhaDialogo2) {
        respostaMeruen[2] = {"Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina.",
        "Meruen: Muito obrigado, amigo."};
    } else {
        respostaMeruen[2] = {"Meruen: Você é tão vazio quanto sua alma.",
        "Meruen se afasta lentamente de você."};
    }

    mostraDialogo(janelaDialogo, "Meruen responde:", respostaMeruen, 2);

  return escolhaDialogo2;
}


void imprimePrimeiroFinal(WINDOW *janelaDialogo) {
	string primeiroFinal[7] = {"Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila.",
	"Duas semanas depois, em outra vila a procura de um artefato.",
	"Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela",
	"praga. Aqueles que sobreviveram foram os que fugiram",
	"de Passagem de Duvik enquanto nao tinham sido contaminados",
	"A promissora cidade comerciante, se tornou apenas uma ruina",
	"uma promessa do que poderia se tornar."};
	
	mostraDialogo(janelaDialogo, "Conclusão", primeiroFinal, 7);
}

void entradaMina(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int conversa;
	int dadoObservar;


	//Descricao da entrada da caverna.
	cout << "" << endl;
	string descricaoEntrada[15] = {"Apos algumas horas de caminhada, voce chega na caverna.",
	"Uma brisa fria desce dos picos da Montanha Serpente",
	"Enrolada enquanto voce contempla a entrada para as",
	"cavernas. O chao coberto de neve esta cheio de ferramentas,",
	"picaretas e pas, muitas das quais sobressaindo dos montes",
	"de neve. Um unico corredor escuro conduz as profundezas",
	"da mina a frente. O caminho de terra abaixo, que possui",
	"estruturas de suporte de madeira, esta coberto com escombros",
	"de pedra, uns pedacos ocasionalmente brilham com o menor",
	"pedaco de minerio. Nenhuma luz lanca-se para fora",
	"do tunel. Tochas queimadas estão espalhadas pelo chao,",
	"seus suportes quebrados nas paredes do tunel. Atras de",
	"voce, a estrada gasta conduz atraves dos precipicios para o",
	"vale abaixo. Alem do suave assobio do vento, um completo",
	"silencio preenche a abertura nas montanhas."};

	mostraDialogo(janelaDialogo, "Entrada da caverna", descricaoEntrada, 15);

	//Escolha do setor.

	string opcoesEntrada[3] = {"Tentar analisar com mais detalhes a entrada da caverna.",
	"Procurar por alguma coisa ao redor da entrada.",
	"Acender uma tocha e entrar na caverna."};

	conversa = realizaPergunta(janelaMenu, "O que voce vai fazer?", opcoesEntrada, 3);

	if (conversa == 0) {
			dadoObservar = rolarDado(20);
			primeiraEscolhaEntrada(dadoObservar, ficha);
			

	} else if (conversa == 1) {
			dadoObservar = rolarDado(20) + 2;
			segundaEscolhaEntrada(dadoObservar, ficha);			

	} else {
		string semAnalise[3] = {"Analisar as coisas é perda de tempo, seus inimigos não tem",
		"uma chance contra você mesmo... Voce acende uma tocha, respira",
		"fundo e entra na mina."};
		mostraDialogo(janelaDialogo, "Conclusão", semAnalise, 3);

	}



}

void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha, WINDOW *janelaDialogo) {
	string *analiseEntrada;

	if (dadoObservar >= 10) {
		analiseEntrada[0] = "Voce percebe que os suportes de madeira do tunel";
		analiseEntrada[1] = "estao lascados e despedacados, como se tivessem danificados";
		analiseEntrada[2] = "em uma recente batalha.";

		mostraDialogo(janelaDialogo, "Ao analisar a entrada", analiseEntrada, 3);
		aumentarXP(ficha, 400);

		if(dadoObservar >= 15) {
			string detalhe[1] = {"Voce também percebe que elas estão manchadas de sangue."};
			proximoDialogo(janelaDialogo, "Ao analisar a entrada", detalhe, 1);
			aumentarXP(ficha, 300);
		}
	
	} else {
		analiseEntrada[2] = {"Voce tenta analisar a entrada, porém não consegue",
		"encontrar nada relevante na estrutura."};

		mostraDialogo(janelaDialogo, "Ao analisar a entrada: ", analiseEntrada, 2);
	}

	string prosseguimentoHistoria[1] = {"Você acende uma tocha e entra na caverna."};
	
	proximoDialogo(janelaDialogo, "Logo após a analise", prosseguimentoHistoria, 1);
}

void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha, WINDOW *janelaDialogo) {
	string *analiseEntrada;
	int tamanho;

	if(dadoObservar >= 10 and dadoObservar < 15) {
		analiseEntrada[0] = "No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!";
		analiseEntrada[1] = "No entanto, voce nao encontrou nada que pode ser util para entender";
		analiseEntrada[2] =  "o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna.";
		tamanho = 3;
		aumentarXP(ficha, 300);
	} else if (dadoObservar >= 15) {
		analiseEntrada[0] = "No meio as picaretas e pás quebradas, você encontra duas poções de vida!";
		analiseEntrada[1] = "Possivelmente elas serao úteis... Voce tambem encontra um simbolo";
		analiseEntrada[2] = "associados a kobolds, pequenas criaturas que são conhecidas por serem";
		analiseEntrada[3] = "saqueadores. E provavel que tenha havido um combate por aqui. Você";
		analiseEntrada[4] = "acende uma tocha e entra na caverna com atenção redobrada.";
		adicionarItem(1, ficha.inventario);
		tamanho = 5;
		aumentarXP(ficha, 500);
	} else {
		analiseEntrada[0] = "Voce buscar por alguns minutos, no entanto, voce nao encontra";
		analiseEntrada[1] = "nada relevante pra voce.";
		tamanho = 2;
	}

	mostraDialogo(janelaDialogo, "Ao procurar ao redor da entrada", analiseEntrada, tamanho);

}

char verificarCarroca(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int checkReflexo;
	bool coletou;
	char ativou = 'n';
	int tamanho;

	checkReflexo = rolarDado(20) + ficha.atributos.destreza;
	string *analiseCarroca;

	if(checkReflexo >= 12) {

		analiseCarroca[0] = "Voce escuta um barulho de";
		analiseCarroca[1] = "mecanismos, voce rapidamente entende que e uma armadilha";
		analiseCarroca[2] = "e salta para tras, conseguindo desviar do ataque sonico";
		analiseCarroca[3] = "produzido pela mesma.";
		tamanho = 4;
		aumentarXP(ficha, 250);
	} else {
		analiseCarroca[0] = "Voce escuta um barulho de";
		analiseCarroca[1] = "mecanismos, e uma armadilha que produz um som ensurdecedor";
		analiseCarroca[2] = "que deixa voce temporariamente surdo.";
		ativou = 's';
		tamanho = 3;
		ficha.personagem.hp -= 3;
	}

	mostraDialogo(janelaDialogo, "Ao arrastar o corpo", analiseCarroca, tamanho);

	string analiseMineiro[4] = {"Ao analisar o corpo, voce percebe que ele tem marcas parecidos com",
	"as vitimas da praga. Ele tem uma roupa diferente dos outros mineradores",
	"Provavelmente era o chefe deles. Ele parece ter sido uma vitima de um ataque",
	"tendo muitos ferimentos perfurantes no peito e pescoco."};

	proximoDialogo(janelaDialogo, "Continuação", analiseMineiro, 4);

	string continuacaoAnalise[2] = {"Voce tambem percebe inumeros pedacoes de prata ao redor da carroca.",
	"Voce ira coletar?"};
	
	proximoDialogo(janelaDialogo, "Continuação", continuacaoAnalise, 2);

	coletou = perguntaSimNao(janelaMenu);

	string *conclusaoAnalise;

	if(coletou) {
		conclusaoAnalise[1] = {"Voce coleta os minerios sem problemas."};
		adicionaDinheiro(ficha, 250);
	} else {
		conclusaoAnalise[1] = {"Voce prefere nao arricar a pegar esses minerios."};
	}

	mostraDialogo(janelaDialogo, "Decisão dos minérios", conclusaoAnalise, 1);
	aumentarXP(ficha, 250);

	return ativou;
}

int dialogoCombateRefeitorio(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaCombate;
	char dialogoCombate;
	int dadoCarisma = rolarDado(20) + ficha.atributos.carisma;
	int dadoPersuasao;

	if(dadoCarisma >= 13) {
		string dialogoRefeitorio[2] = {"Ao comecar a falar, os kobolds apesar de receiosos",
		"resolvem escutar o que voce tem a dizer"};
		proximoDialogo(janelaDialogo,"Dialogo",dialogoRefeitorio,2);

		string escolhaRefeitorio1[3] = {"Não precisamos brigar. Nenhum de nós quer isso! (Diplomacia)",
		"Não ousem me atacar se quiserem continuar vivos. (Intimidacao)",
		"Eu posso pagar uma quantia generosa se vocês esquecerem que me viram. (Suborno)"};
		dialogoCombate = realizaPergunta(janelaMenu,"O que vocẽ irá falar para eles?",escolhaRefeitorio1,3);
		
		dadoPersuasao = rolarDado(20) + ficha.atributos.carisma;

		if(dialogoCombate == 0) {
			if(dadoPersuasao >= 13) {
				string respostaRefeitorio1[4] = {"Os kobolds parecem concordar com voce e abaixam as armas.",
				"O que parece ser o capitao daquele pequeno grupo fala:","Capitao: Nao temos forca pra lutar, doenca enfraquecer e matar",
				"amigos. Humano pode seguir em frente."};
				proximoDialogo(janelaDialogo,"Persuasao",respostaRefeitorio1,4);
				aumentarXP(ficha, 2500);
			} else {
				escolhaCombate = 2;
			}
			} else if (dialogoCombate == 1) {
				if(dadoPersuasao >= (13 - ficha.atributos.forca)) {
					string respostaRefeitorio2[3] = {"Os kobolds parecem, de fato, ficarem intimidados com voce.",
					"O que parece o capitao daquele pequeno grupo fala:","Tudo bem, humano pode passar. Só não nos mate, por favor."};
					proximoDialogo(janelaDialogo,"Persuasao",respostaRefeitorio2,3);
					aumentarXP(ficha, 2250);
			} else {
				escolhaCombate = 2;
			}

			} else if (dialogoCombate == 2) {
				int dinheiro = getDinheiro(ficha.inventario);

				if(dadoPersuasao >= 8 and dinheiro >= 200) {
					string respostaRefeitorio3[3] = {"Os kobolds aceitam sua proposta, provavelmente por falta de",
					"força ou coragem de lutar.","Voce entrega o dinheiro para eles e segue seu caminho."};
					proximoDialogo(janelaDialogo,"Persuasao",respostaRefeitorio3,3);
					aumentarXP(ficha, 2000);
					adicionaDinheiro(ficha, -200);
				} else {
					escolhaCombate = 2;
				}
			} 
	}

	if(dadoCarisma < 13 or escolhaCombate == 2) {
		string dialogoRefeitorio2[2] = {"O que parece ser o capitao daquele pequeno grupo fala:",
		"Capitao: Nao importa o que humano fale, voce morre agora!"};
		proximoDialogo(janelaDialogo,"Ameaca",dialogoRefeitorio2,2);
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

char refeitorioCaverna(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
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
				solucaoCombate = dialogoCombateRefeitorio(ficha, janelaDialogo, janelaMenu);
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

void acampamentoSecreto(Ficha &ficha,WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaAcampamento;

	string acampamentoSecreto[6] = {"Ao entrar na passagem, você encontra o acampa-",
	"mento dos Kobolds, usado como área de estoque",
	"e dormitório. Você encontra um baú e dois",
	"jovens Kobolds, que estão olhando para você",
    "e estão amedrontados. Um deles utiliza um capuz",
	"que parece valioso."};
	
	mostraDialogo(janelaDialogo,"Passagem Misteriosa",acampamentoSecreto,5);

	string opcoesAcampamento[2] = {"Matar eles e ficar com a capa.","Poupar a vida deles e pegar apenas o tesouro."};

	escolhaAcampamento = realizaPergunta(janelaMenu,"O que você irá fazer?",opcoesAcampamento,2);

	string dialogo1[4] = {"Para você, a capa é mais valiosa que a vida","deles. Você os mata sem remorso e pega a"
	,"capa deles, com um pouco de investigação","você descobre que é uma capa da proteção."};
	
	string dialogo2[5] = {"Você poupa a vida deles, afinal, eles não","fizeram absolutamente nada. Simplesmente não",
	"seria justo. Você pega três poções de vida","e duas de mana. Logo após, você desce os cabos","E segue o outro caminho."};

	if(escolhaAcampamento == 0) {
		proximoDialogo(janelaDialogo,"Mercenário",dialogo1,4);
		//Drop: Capa da proteção +1	
	} else {
		proximoDialogo(janelaDialogo,"Mercy",dialogo2,5);
		aumentarXP(ficha, 1000);
		//Drop: Três poções de vida e duas de mana.
	}

}

void pioraCondicao (Ficha &ficha, WINDOW *janelaDialogo) {
	string dialogo[6] = {"A leve fraqueza que você estava sentindo",
	"está demasiadamente pior, você já sente","um pouco de dificuldade em movimentos",
	"bruscos ou que precisam de força. No entanto,","você continua determinado a acabar com esse","problema."};
	
	proximoDialogo(janelaDialogo,"As coisas estão piorando..",dialogo,6);
	//TODO alterar a vitalidade.
}

void fossoCadaveres(Ficha &ficha, WINDOW *janelaDialogo) {
	int checkInteligencia;

	string dialogoFosso1[7] = {"Você passa pelo túnel. Ondas de calor banham",
	"respiração difícil. Esta caverna pequena e","em forma de tigela possui o chão cheio de",
	"cadáveres humanóides. A abertura de um túnel","é visível na parede leste da câmara",
	"e, na distância, o som de água corrente","pode ser ouvido."};

	mostraDialogo(janelaDialogo,"Túnel necrópolo",dialogoFosso1,7);

	checkInteligencia = rolarDado(20) + (ficha.atributos.inteligencia / 4);

	if(checkInteligencia >= 8) {
		string dialogo[3] = {"Você acredita que aqui é o fosso da criação",
		"da praga. Sejá la quem for que está fazendo","isso, não deve ficar longe de onde você está."};
		proximoDialogo(janelaDialogo,"Aposta Inteligente",dialogo,3);
	}

	string dialogoFosso2[2] = {"Quatro zumbis levantam-se de um dos montes","de corpos! Prepare-se para o combate!"};
	
	proximoDialogo(janelaDialogo,"Zumbies",dialogoFosso2,2);
	//IniciaCombate(ficha);
	aumentarXP(ficha, 2000);

	string dialogoFosso3[4] = {"","Algo dentro de você diz que isso está perto","de acabar. Ao calmo som de água corrente. Você",
	"entra no estreito túnel a leste."};

	proximoDialogo(janelaDialogo,"Passagem estreita",dialogoFosso3,4);
}

void finalJakk(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaLuta;
	char solucao;
	bool interpretouSimbolos = false;
	int dadoReligiao = rolarDado(20) + ficha.atributos.inteligencia;

	string dialogofinalJakk[12] = {"","Ao entrar, nessa parte da caverna, você observa um",
	"único pilar irregular, de pedra e cheio de um musgo","emerge das profundezas de um lago no centro da caverna.",
	"A água cai pelas suas laterais de uma fonte","próxima ao seu topo, cascateando até a lagoa abaixo.",
	"A lagoa alimenta uma larga correnteza que flui rapidamente","ao longo da extensão da sala e então por baixo da parede de",
	"pedra na extremidade sul da caverna. Muitos símbolos estão","entalhados profundamente na face de pedra do pilar, suas",
	"linhas apenas visíveis por baixo da luz do musgo. Uma","sensação estranha de desconforto impregna este lugar."};

	proximoDialogo(janelaDialogo,"A fonte",dialogofinalJakk,12);

	if(dadoReligiao >= 8) {
		string dialogoFinalJakk2[6] = {"Os símbolos entalhados aqui estão escritos","no idioma orc e servem como uma súplica a",
		"Gruumsh (o deus dos orcs) para destruir","os inimigos com uma terrível pestilência.","Eles também recontam a história das minas e o destino",
		"do clã Garra Despedaçante"};

		proximoDialogo(janelaDialogo,"Mensagem escondida",dialogoFinalJakk2,6);
		interpretouSimbolos = true;
	}

	escolhas.conversaFinal.interpretouSimbolos = interpretouSimbolos;

	string dialogoFinalJakk3[3] = {"No centro, voce percebe uma imponente presenca","Um grande orc, com uma armadura de metal e uma",
	"clava de aço na mão direita."};

	proximoDialogo(janelaDialogo,"Oponente",dialogoFinalJakk3,3);

	string opcoesFinalJakk[2] = {"Tentar conversar com ele.","Atacar imediatamente."};

	escolhaLuta = realizaPergunta(janelaMenu,"O que voce vai fazer?",opcoesFinalJakk,2);

	if(escolhaLuta == 0) {
		solucao = ConversaJakk(ficha, escolhas,janelaDialogo,janelaMenu);
		escolhas.conversaFinal.resultadoConversa = solucao;	

	}else{
		string dialogofinalJakk4[2] = {"O Orc prepara sua maça enquanto você corre","em sua direção."};
		proximoDialogo(janelaDialogo,"Combate",dialogofinalJakk4,2);
		escolhas.conversaFinal.resultadoConversa = 'c';	
	}

}

char ConversaJakk(Ficha &ficha, Escolhas &escolhas,WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaConversa;
	char respostaJakk;
	int convencerJakk;
	int solucaoJakk;
	bool interpretouSimbolos = escolhas.conversaFinal.interpretouSimbolos;

	string dialogoConversaJakk[3] = {"Jakk: Meu nome é Jakk, o que voce quer? Voce",
	"Jakk: se arricou muito para chegar aqui.","Jakk: Que tolice.",};

	proximoDialogo(janelaDialogo,"Jakk", dialogoConversaJakk,3);

	string escolhaConversaJakk[4] = {"O que voce sabe sobre a praga?","Eu tenho a cura, me mate e você nunca a obterá.(Enganação)",
	"Não importa o que voce sabe, eu vim aqui para lutar com voce"};

	escolhaConversa =  realizaPergunta(janelaMenu,"O que voce irá responder:",escolhaConversaJakk,4);

	
	if(escolhaConversa == 0) {
		string respostaJakk1[3] = {"Jakk: Eu que criei e estou matendo essa praga.",
		"Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Portanto, cuspa logo o que voce quer ou lute comigo!"};
		proximoDialogo(janelaDialogo,"Revelação",respostaJakk1,3);
			
	} else if (escolhaConversa == 1) {
		string respostaJakk2[4] = {"Jakk: Pare de mentir, humano insolente!","Jakk: Eu que criei e estou mantendo essa praga.",
		"Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Entao cuspa logo o que voce quer ou lute comigo!"};
		proximoDialogo(janelaDialogo,"Revelação",respostaJakk2,4);
			
	} else if (escolhaConversa == 2) {
		string respostaJakk3[1] = {"Jakk: Voce nao tem uma chance, seu verme."};
		proximoDialogo(janelaDialogo,"Afronta",respostaJakk3,1);	
	} 
	
	string escolhaConversaJakk2[2] = {"Por que está fazendo isso?","Então eu tenho o dever de pará-lo."};
	
	respostaJakk = realizaPergunta(janelaMenu,"O que voce irá responder:",escolhaConversaJakk2,2);

	if(respostaJakk == 0) {
		string respostaJakk4[5] = {"Jakk: 10 anos atras, o povo de Passagem de Duvik quase",
		"Jakk: exterminou o meu clã, o clã Garra Despedaçante, pois","Jakk: achavam que nós éramos uma ameaça. Eles não quiseram",
		"Jakk: ter nenhuma forma de conversa. Essa é a vinganca","Jakk: do meu clã."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk4,5);
			
	} else if (respostaJakk == 1) {
		string respostaJakk5[1] = {"Jakk: É hora de morrer, seu verme insolente!"};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk5,1);	
		respostaJakk = 'c';	
	} 

	string escolhaConversaJakk3[3] = {"Matando eles voce fica tao errado quanto aquelesque mataram o seu cla. Voce nao combate odio com odio.",
	" Voce esta matando ainda mais pessoas do seu cla. Voce não viu a quantidade de kobolds mortos? Pare com isso,todos os seus soldados querem sair daqui e esquecer","Isso nao justifica os seus erros. Voce morrera agora!"};

	convencerJakk = realizaPergunta(janelaMenu,"O que voce irá responder:",escolhaConversaJakk3,3);
	
	if(convencerJakk == 0) {
		string respostaJakk6[3] = {"Jakk: O que voce sabe sobre meu cla? Voce nao sabe o que",
		"Jakk: esta falando... Voce nao sabe o quanto meu cla sofreu.","Jakk: Pare de falar sobre o que você não tem ideia."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk6,3);
			
	} else if (convencerJakk == 1) {
		string respostaJakk7[4] = {"Jakk parece um pouco relutante.","Jakk: Eu sei, eu sou o que mais sofro com isso. No entanto,",
		"Jakk: todos eles concordaram com isso, eu tenho que valorizar","Jakk: as mortes daqueles que se sacrificaram pela causa!"};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk7,4);
	} else if (convencerJakk == 2) {
		string respostaJakk8[1] = {"Jakk: Voce nao tem uma chance, seu verme."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk8,1);
	}

	int tamanho = 2;
	string escolhaConversaJakk4[2] = {"Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
	"Seja um pouco racional... Isso nao trara alegria a ninguem."};

	if(interpretouSimbolos) {
		string escolhaConversaJakk4[3] = {"Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
		"Seja um pouco racional... Isso nao trara alegria a ninguem.","Eu tenho certeza que a vontade de Gruumsh é que isso acabe pacificamente."};
		tamanho = 3;	
	}

	solucaoJakk = realizaPergunta(janelaMenu,"O que voce irá responder:",escolhaConversaJakk4,tamanho);

	//TO DO
	int checkCarisma = rolarDado(20) + ficha.atributos.carisma;

	if(solucaoJakk == 0 or solucaoJakk == 1 and checkCarisma >= 10) {
		string respostaJakk9[3] = {"Jakk: É verdade... Meu povo está sofrendo demais com isso.",
		"Jakk: Eu vou quebrar o feitico imediatamente. Obrigado por","Jakk: trazer razao ao meu pensamento, humano."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk9,3);		
	
	} else if (solucaoJakk == 2 and interpretouSimbolos) {
		string respostaJakk10[3] = {"Jakk: Voce tem toda a razao... O que eu estava pensando?",
		"Jakk: Eu vou quebrar o feitico imediatamente. Obrigado","Jakk: por trazer sensatez, humano."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk10,3);
	} else if (checkCarisma < 10) {
		string respostaJakk11[2] = {"Jakk: Voce parece sensato, mas tenho que honrar meu clã",
		"Jakk: É hora de lutar, humano."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk11,2);
	} 

}


void imprimeVarianciasFinal(Ficha &ficha, Escolhas &escolhas,WINDOW *janelaDialogo) {
	char gancho = escolhas.escolhasCidade.ganchoAventura;
	
	if(tolower(gancho) == 'a') {
		string dialogoFinal[7] = {"O prefeito se aproxima de voce e fala:",
		"Prefeito: Eu só tenho a agradecer a você, nobre aventureiro","Prefeito: Voce salvou a vida de quase todos da cidade!",
		"Prefeito: Aqui estão 500 peças de ouro como recompensa","Prefeito: pelo seu feito. Sempre que você voltar,",
		"Prefeito: tenha a certeza que você será sempre bem recebido", "Prefeito: aqui!"};
		proximoDialogo(janelaDialogo,"Prefeito: Gratidão",dialogoFinal,7);

	} else if (tolower(gancho) == 'b') {
		string dialogoFinal2[9] = {"O minerador que falou com voce anteriormente, se aproxima",
		"e com um grande sorriso grita:","Minerador: Eu sabia! Eu sabia que você conseguiria!",
		"Minerador: Voce salvou a vida de todos da cidade. E nós","Minerador: somos extremamente gratos a você! Eu não tenho",
		"Minerador: muito, mas aqui está o que eu tenho, 500 peças","Minerador: de ouro.","Minerador: Ei! Sempre que vir aqui, minha casa sempre estará",
		"Minerador: de portas abertas! Nós não esqueceremos de você."};
		proximoDialogo(janelaDialogo,"Minerador: Gratidão",dialogoFinal2,9);

	} else if (tolower(gancho) == 'c') {
		string dialogoFinal3[10] = {"A camponesa que falou com você anteriormente, se aproxima",
		"e com um grande sorriso fala:","Camponesa: Voce conseguiu! Meus filhos e os outros moradores",
		"Camponesa: já estão melhorando e tudo isso graças a você!","Camponesa: Não me esquecerei do que você fez aqui!",
		"Camponesa: Aqui estão 500 peças de ouro por tudo, que você","Camponesa: fez. Nós da vila nos juntamos para pode pagar",
		"Camponesa: a você!","Camponesa: Volte aqui de vez em quando! Tenho certeza","Camponesa: que todos daqui adorariam te ver novamente!"};
		proximoDialogo(janelaDialogo,"Camponesa: Gratidão",dialogoFinal3,10);

	} else {
		string dialogoFinal4[9] = {"Meruen, o seu amigo que requisitou a missão, se aproxima",
		"e diz:","Meruen: Eu tinha certeza que você conseguiria","Meruen: Você não só salvou minha vida como a de quase",
		 "Meruen: todos daqui da vila. Somos todos muito gratos","Meruen: a você. Aqui estão 500 peças de ouro, como uma",
		 "Meruen: forma de agradadecimento. Por fim, volte","Meruen: aqui de vez em quando. Seria muito bom",
		 "Meruen: te ver novamente!"};
		proximoDialogo(janelaDialogo,"Meruen:Gratidão",dialogoFinal4,9);
	}
}

void imprimeFinalPacifico(WINDOW *janelaDialogo) {
	string finalPacifico[5] = {"Após convencer Jakk a terminar a maldição. A água",
	"amaldiçoada, que servia como abastecimento de Passagem","de Duvik, foi aos poucos sendo purificada. Os sintomas",
	"da Febre que afetam as pessoas de Passagem de Duvik","começaram a diminuir. E a ordem voltou a reinar na cidade."};
	proximoDialogo(janelaDialogo,"Final Pacifico", finalPacifico,5);

}

void imprimeFinalViolento(WINDOW *janelaDialogo) {
	string finalViolento[5] = {"Derrotar Jakk já possui um efeito visível imediato",
	"nas águas da nascente, que	começa a ficar limpa da sujeira","da Febre logo após sua morte. Os sintomas",
	"da Febre que afetam as pessoas de Passagem de Duvik","começaram a diminuir. E a ordem voltou a reinar na cidade."};
	proximoDialogo(janelaDialogo,"Final Violento",finalViolento,5);
}

void imprimeFuturoVila(WINDOW *janelaDialogo) {
	string futuro[5] = {"Lentamente, Passagem de Duvik começou a se","reestruturar e a prosperar novamente. Alguns",
	"anos depois, Passagem de Duvik se tornou uma das maiores","e ricas cidades do reino. No centro dela, há uma estatua sua,",
	"para relembrar quem tornou o sucesso dessa cidade possível!"};
	proximoDialogo(janelaDialogo,"Futuro",futuro,5);
}

void imprimeCreditos(WINDOW *janelaDialogo) {
	string creditos[9] = {"Obrigado por jogar: A Praga Carmesim!","Sistema inspirado: Dungeons and Dragons, quinta edicao.",
	"Feito por:","Jadson Luan","Jesse Souza","Lucas de Medeiros","Marcella Siqueira","Mikael Brasileiro",
	"Existem mais finais para serem desbravados, tente conseguir outro jogando novamente!"};
	mostraDialogo(janelaDialogo,"Créditos",creditos,9);
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
