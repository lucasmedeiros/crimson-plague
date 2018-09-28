#include <iostream>
#include "historia.h"

char perguntaSimNao(WINDOW *janelaMenu) {
	int resposta;

	string opcoesFala[2] = {"Sim", "Nao"};
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

char ganchoAventura(WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaGancho;
	char retornoGancho;
	char concordou;
	int dialogo;

	string descricaoPessoas[5] = {"Você está na praça principal da cidade e, percebe",
	"algumas pessoas que te chamam a atenção:",
	"Um homem com roupas nobres, não parece ser dessa cidade.",
	"Um grupo de pessoas com manchas de carvão no rosto e braços.",
	"Alguns moradores que estão claramente abatidos."};

	proximoDialogo(janelaDialogo, "Praça da cidade", descricaoPessoas, 5);

	// Escolha do gancho para a aventura

	string pessoasPraca[4] = {"O homem aparentemente rico.",
	"As pessoas sujas de carvao.",
	"Os moradores da cidade.",
	"Ninguem."};

	escolhaGancho = realizaPergunta(janelaMenu, "Qual deles voce ira se aproximar:", pessoasPraca, 4);


    if(escolhaGancho == 0) {
		string dialogoMorador[8] = {"Ao se aproximar dele, voce escuta:"," ",
		"Prefeito: Saudações. Eu sou o prefeito dessa cidade.",
		"Prefeito: muitos dos moradores da vila estão sofrendo de uma",
		"Prefeito: doenca extremamente letal. Não pude deixar de notar",
		"Prefeito: que você é um aventureiro, você poderia nos ajudar",
		"Prefeito: a acabar com essa doença? Por favor, muitos já",
		"Prefeito: morreram com essa praga."};
		retornoGancho = 'a';

		mostraDialogo(janelaDialogo, "Cidade", dialogoMorador, 7);

    } else if (escolhaGancho == 1) {
		string dialogoMorador[4] = {"Você nao demora muito pra perceber que eles sao mineradores",
		"Ao se aproximar, um dos mineradores, com os olhos arregalados grita:\n",
		"Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte.",
		"Minerador: voce parece forte. Por favor, acabe com esse mal!"};
		retornoGancho = 'b';
		mostraDialogo(janelaDialogo, "Cidade", dialogoMorador, 4);

	} else if (escolhaGancho == 2) {
		string dialogoMorador[4] = {"Voce encontra diversos moradores atonitos na vila.",
		"Uma das moradoras se aproxima de voce e diz:",
		"Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro",
		"Senhora: meus dois filhos ja foram pegaram praga. Eu imploro, por favor acabe com isso."};

		mostraDialogo(janelaDialogo,"Cidade",dialogoMorador,4);

		string opcoesFala[2] = {"Voce poderia falar mais sobre essa praga?",
		"Onde eu posso acabar com isso?"};

		dialogo = realizaPergunta(janelaMenu, "O que voce respondera pra ela:", opcoesFala, 2);

		if(dialogo == 0) {
				string falasSenhora[6] = {"Senhora: Chamam de praga Carmesim, ela começa de forma inofensiva.",
				"Senhora: Porem, aos poucos ela vai ficando pior. Cada vez mais roubando a sua forca.",
				"Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca.", 
				"Senhora: Fazem quatro dias que meus filhos estao doentes...",
				"Ela comeca a chorar. Solucando um pouco, ela diz:" ,
				"Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la. Por favor, me ajude..."};

				mostraDialogo(janelaDialogo, "Cidade", falasSenhora, 6);

		} else {
			string falasSenhora[5] = {"Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la.",
			"Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca.", 
			"Senhora: Fazem quatro dias que meus filhos estao doentes...",
			"Senhora: Eu nao sei quanto tempo eles ainda podem aguentar... Por favor, acabe com essa praga.",
			"Apesar de tentar disfaçar, você percebe que ela começa a chorar."
			};

			retornoGancho = 'c';
			mostraDialogo(janelaDialogo, "Cidade", falasSenhora, 4);

		} 

    } else {
		string descricaoNinguem[3] = {"Isso não é problema seu. Você já tem problemas demais pra resolver.",
		"Esses camponeses conseguem resolver esse problema sozinho.",
		"Ao menos você acha isso."};
		retornoGancho = 'd';
		mostraDialogo(janelaDialogo, "Cidades", descricaoNinguem, 3);
	}
    
    if(escolhaGancho != 3) {
    	concordou = perguntaSimNao(janelaMenu);
		

    	if(concordou == 'n') {
    		string respostaPessoa[1] = {"Com um olhar de desaprovação, lentamente começam a se afastar de você."};
			retornoGancho = 'd';
			proximoDialogo(janelaDialogo, "Resposta", respostaPessoa, 1);

    	} else {
    		string respostaPessoa[1] =  {"Mal sei o que dizer. Muito obrigado!!"};
			proximoDialogo(janelaDialogo, "Resposta", respostaPessoa, 1);
    	}
    }

	return retornoGancho;
}

char segundaChance(Personagem &personagem, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
    int escolhaDialogo;
	char retornoDialogo;
    char escolhaDialogo2;

    string apresentacaoAmigo1[5] = {"Uma pessoa se aproxima de você, ela te parece familiar",
    "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen.",
    "Um guerreiro que costumava lutar com você, alguns anos atrás.",
    "Ele está bem magro, comparado ao tempo que ele lutava com você.",
    "Ele se aproxima e diz:"};
   	string apresentacaoAmigo2[3] = {"Meruen: Há quanto tempo, amigo. Há algo de errado em uma mina próxima dessa região",
    "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo",
    "Meruen: é provável que ela esteja causando a praga que está assolando essa vila."};

    proximoDialogo (janelaDialogo, "Meruen", apresentacaoAmigo1, 5);
	proximoDialogo(janelaDialogo,"Meruen",apresentacaoAmigo2,3);

    string escolhaFala[3] = {"Voce poderia falar mais sobre essa praga?",
    "Voce esta bem?",
    "Ha alguma coisa que eu possa ajudar?"};

    escolhaDialogo = realizaPergunta(janelaMenu, "O que voce respondera pra ele:", escolhaFala, 3);

    if(escolhaDialogo == 0) {

        string falaMeruen[4] = {"Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva",
        "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana.",
        "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias...",
        "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."};
		proximoDialogo(janelaDialogo, "Meruen responde: ", falaMeruen, 4);

    } else if (escolhaDialogo == 1) {

        string falaMeruen[2] = {"Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias...",
        "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."};
		proximoDialogo(janelaDialogo, "Meruen responde: ", falaMeruen, 2);

    } else {

        string falaMeruen[3] = {"Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar",
        "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias...",
        "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?"};
		proximoDialogo(janelaDialogo, "Meruen responde: ", falaMeruen, 3);
    } 
    
    escolhaDialogo2 = perguntaSimNao(janelaMenu);

    if(escolhaDialogo2 == 'y') {
        string respostaMeruen[2] = {"Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina.",
        "Meruen: Muito obrigado, amigo."};
		proximoDialogo(janelaDialogo, "Meruen responde:", respostaMeruen, 2);
		retornoDialogo = 'y';
    } else {
        string respostaMeruen[2] = {"Meruen: Você é tão vazio quanto sua alma.",
        "Meruen se afasta lentamente de você."};
		retornoDialogo = 'n';
		proximoDialogo(janelaDialogo, "Meruen responde:", respostaMeruen, 2);
    }

  return escolhaDialogo2;
}


void imprimePrimeiroFinal(WINDOW *janelaDialogo) {
	string primeiroFinal[7] = {"Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila.",
	"Duas semanas depois, em outra vila a procura de um artefato.",
	"Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga.",
	"Aqueles que sobreviveram foram os que fugiram",
	"de Passagem de Duvik enquanto nao tinham sido contaminados",
	"A promissora cidade comerciante, se tornou apenas uma ruina",
	"uma promessa do que poderia se tornar."};
	
	proximoDialogo(janelaDialogo, "Conclusão", primeiroFinal, 7);
}

void entradaMina(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
	int conversa;
	int dadoObservar;


	//Descricao da entrada da caverna.
	string descricaoEntradaP1[5] = {"Apos algumas horas de caminhada, voce chega na caverna.",
	"Uma brisa fria desce dos picos da Montanha Serpente",
	"Enrolada enquanto voce contempla a entrada para as",
	"cavernas. O chao coberto de neve esta cheio de ferramentas,",
	"picaretas e pas, muitas das quais sobressaindo dos montes"};
	string descricaoEntradaP2[5] = {
	"de neve. Um unico corredor escuro conduz as profundezas",
	"da mina a frente. O caminho de terra abaixo, que possui",
	"estruturas de suporte de madeira, esta coberto com escombros",
	"de pedra, uns pedacos ocasionalmente brilham com o menor",
	"pedaco de minerio. Nenhuma luz lanca-se para fora"};
	string descricaoEntradaP3[5] = { 
	"do tunel. Tochas queimadas estão espalhadas pelo chao,",
	"seus suportes quebrados nas paredes do tunel. Atras de",
	"voce, a estrada gasta conduz atraves dos precipicios para o",
	"vale abaixo. Alem do suave assobio do vento, um completo",
	"silencio preenche a abertura nas montanhas."};

	proximoDialogo(janelaDialogo, "Entrada da caverna", descricaoEntradaP1, 5);
	proximoDialogo(janelaDialogo, "Entrada da caverna", descricaoEntradaP2, 5);
	proximoDialogo(janelaDialogo, "Entrada da caverna", descricaoEntradaP3, 5);

	string descricaoBatalha[2] {"Você encontra um kobolds, ele parece hostil"
	, "E irá atacar você! Prepare-se para o combate!"};
	
	proximoDialogo(janelaDialogo, "Entrada da caverna", descricaoBatalha, 2);
	iniciaBatalha(janelaMenu, janelaDialogo, ficha, inimigo);

	//Escolha do setor.

	string descricaoEntradaP4[2] =  {"Voce permanece por um tempo em frente a entrada",
	"Por um momento voce hesita em seguir em frente"};

	proximoDialogo(janelaDialogo,"Entrada da caverna",descricaoEntradaP4,2);

	string opcoesEntrada[3] = {"Tentar analisar com mais detalhes a entrada da caverna.",
	"Procurar por alguma coisa ao redor da entrada.",
	"Acender uma tocha e entrar na caverna."};

	conversa = realizaPergunta(janelaMenu, "O que voce vai fazer?", opcoesEntrada, 3);

	if (conversa == 0) {
			dadoObservar = rolarDado(20);
			primeiraEscolhaEntrada(dadoObservar, ficha,janelaDialogo);

	} else if (conversa == 1) {
			dadoObservar = rolarDado(20) + 2;
			segundaEscolhaEntrada(dadoObservar, ficha,janelaDialogo);			

	} else {
		string semAnalise[3] = {"Analisar as coisas é perda de tempo, seus inimigos não tem",
		"uma chance contra você mesmo... Voce acende uma tocha, respira",
		"fundo e entra na mina."};
		mostraDialogo(janelaDialogo, "Conclusão", semAnalise, 3);

	}

}

void primeiraEscolhaEntrada(int dadoObservar, Ficha &ficha, WINDOW *janelaDialogo) {

	if (dadoObservar >= 10) {
		string analiseEntrada[3] = { "Voce percebe que os suportes de madeira do tunel",
		"estao lascados e despedacados, como se tivessem danificados","em uma recente batalha."};
		mostraDialogo(janelaDialogo, "Ao analisar a entrada", analiseEntrada, 3);
		aumentarXP(ficha, 400);

		if(dadoObservar >= 15) {
			string detalhe[1] = {"Voce também percebe que elas estão manchadas de sangue."};
			proximoDialogo(janelaDialogo, "Ao analisar a entrada", detalhe, 1);
			aumentarXP(ficha, 300);
		}
	
	} else {
		string analiseEntrada[2] = {"Voce tenta analisar a entrada, porém não consegue",
		"encontrar nada relevante na estrutura."};

		mostraDialogo(janelaDialogo, "Ao analisar a entrada: ", analiseEntrada, 2);
	}

	string prosseguimentoHistoria[1] = {"Você acende uma tocha e entra na caverna."};
	
	proximoDialogo(janelaDialogo, "Logo após a analise", prosseguimentoHistoria, 1);
}

void segundaEscolhaEntrada(int dadoObservar, Ficha &ficha, WINDOW *janelaDialogo) {
	int tamanho;

	if(dadoObservar >= 10 and dadoObservar < 15) {
		string analiseEntrada[3] = {"No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!",
		"No entanto, voce nao encontrou nada que pode ser util para entender",
		"o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna."};
		tamanho = 3;
		aumentarXP(ficha, 300);
		mostraDialogo(janelaDialogo, "Ao procurar ao redor da entrada", analiseEntrada, tamanho);
	} else if (dadoObservar >= 15) {
		string analiseEntrada[5] = {"No meio as picaretas e pás quebradas, você encontra duas poções de vida!",
		"Possivelmente elas serao úteis... Voce tambem encontra um simbolo",
		 "associados a kobolds, pequenas criaturas que são conhecidas por serem",
		"saqueadores. E provavel que tenha havido um combate por aqui. Você",
		"acende uma tocha e entra na caverna com atenção redobrada."};
		adicionarItem(1, ficha.inventario);
		tamanho = 5;
		aumentarXP(ficha, 500);
		mostraDialogo(janelaDialogo, "Ao procurar ao redor da entrada", analiseEntrada, tamanho);
	} else {
		string analiseEntrada[2] = {"Voce buscar por alguns minutos, no entanto, voce nao encontra","nada relevante pra voce."};
		tamanho = 2;
		mostraDialogo(janelaDialogo, "Ao procurar ao redor da entrada", analiseEntrada, tamanho);
	}
}

char recepcaoCaverna(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	char ativou = 'n';
	int escolhaDialogo;
	int checkReflexo;

	string descricaoRecepcao[7] = {"O tunel se abre em uma camara pequena e aproximadamente",
	"regular. Pedacos espalhados de minerio de prata cercam",
	"um par de carroças de madeira. A parte de baixo do que",
	"aparenta ser um corpo humano se sobressai debaixo de uma",
	"das carrocas. E nao mostra nenhum sinal de movimento.",
	"Sangue seco mancha a parede norte em varios locais.",
	"Há uma saída para o oeste"};


	proximoDialogo(janelaDialogo, "Recepção da Caverna", descricaoRecepcao, 7);
	string opcoesRecepcao[2] = {"Analisar o corpo da carroca.",
	"Seguir em frente."};

	escolhaDialogo = realizaPergunta(janelaMenu, "O que voce vai fazer?", opcoesRecepcao, 2);

	if(escolhaDialogo == 0) {
		ativou = verificarCarroca(ficha, janelaDialogo, janelaMenu);
	} else {

		string precaucaoCarroca[3] = {"Voce prefere nao se arriscar e mexer nesse corpo.",
		"E quase certo que havia alguma armadilha ali. Seria uma coin-",
		"cidencia muito grande tantos minerios de prata espalhados uniformemente."};
		
		mostraDialogo(janelaDialogo, "Recepção da Caverna", precaucaoCarroca, 3);
	}

	string conclusaoRecepcao[2] = {"Apos passar da carroca, voce so ve uma grande porta a sua frente.",
	"Voce nao ve outra opcao a nao ser entrar nela."};
	
	mostraDialogo(janelaDialogo, "Conclusão da área", conclusaoRecepcao, 2);
	
	return ativou;
}

char verificarCarroca(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int checkReflexo;
	bool coletou;
	char ativou = 'n';

	checkReflexo = rolarDado(20) + ficha.atributos.destreza;

	if(checkReflexo >= 12) {

		string analiseCarroca[4] = {"Voce escuta um barulho de",
		"mecanismos, voce rapidamente entende que e uma armadilha",
		"e salta para tras, conseguindo desviar do ataque sonico",
		"produzido pela mesma."};
		aumentarXP(ficha, 250);
		mostraDialogo(janelaDialogo, "Ao arrastar o corpo", analiseCarroca, 4);
	} else {
		string analiseCarroca[3] = {"Voce escuta um barulho de",
		"mecanismos, e uma armadilha que produz um som ensurdecedor",
		"que deixa voce temporariamente surdo."};
		ativou = 's';
		ficha.personagem.hp -= 3;
		mostraDialogo(janelaDialogo, "Ao arrastar o corpo", analiseCarroca, 3);
	}


	string analiseMineiro[4] = {"Ao analisar o corpo, voce percebe que ele tem marcas parecidos com",
	"as vitimas da praga. Ele tem uma roupa diferente dos outros mineradores",
	"Provavelmente era o chefe deles. Ele parece ter sido uma vitima de um ataque",
	"tendo muitos ferimentos perfurantes no peito e pescoco."};

	proximoDialogo(janelaDialogo, "Continuação", analiseMineiro, 4);

	string continuacaoAnalise[2] = {"Voce tambem percebe inumeros pedacoes de prata ao redor da carroca.",
	"Voce ira coletar?"};
	
	proximoDialogo(janelaDialogo, "Continuação", continuacaoAnalise, 2);

	coletou = perguntaSimNao(janelaMenu);

	if(coletou == 'y') {
		string conclusaoAnalise[1] = {"Voce coleta os minerios sem problemas."};
		adicionaDinheiro(ficha, 250);
		proximoDialogo(janelaDialogo, "Decisão dos minérios", conclusaoAnalise, 1);
	} else {
		string conclusaoAnalise[1] = {"Voce prefere nao arricar a pegar esses minerios."};
		proximoDialogo(janelaDialogo, "Decisão dos minérios", conclusaoAnalise, 1);
	}
	aumentarXP(ficha, 250);

	return ativou;
}

int dialogoCombateRefeitorio(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
	int escolhaCombate;
	char dialogoCombate;
	int dadoCarisma = rolarDado(20) + ficha.atributos.carisma;
	int dadoPersuasao;

	if(dadoCarisma >= 13) {
		string dialogoRefeitorio[2] = {"Ao comecar a falar, os kobolds apesar de receiosos",
		"resolvem escutar o que voce tem a dizer"};
		proximoDialogo(janelaDialogo,"Dialogo",dialogoRefeitorio,2);

		string escolhaRefeitorio1[3] = {"Nao precisamos brigar. Nenhum de nos quer isso! (Diplomacia)",
		"Nao ousem me atacar se quiserem continuar vivos. (Intimidacao)",
		"Eu posso pagar uma quantia generosa se vocês esquecerem que me viram. (Suborno)"};
		dialogoCombate = realizaPergunta(janelaMenu,"O que vocẽ ira falar para eles?",escolhaRefeitorio1,3);
		
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
		iniciaBatalha(janelaMenu, janelaDialogo, ficha, inimigo);
		//Drops: 2 poções de vida e 2 de mana, bem como um minério de moonstone.
		aumentarXP(ficha, 2000);
	}

	return escolhaCombate;

}

string checkOuvirConhecimento(Ficha &ficha, WINDOW *janelaDialogo) {
	string posicaoCriaturas;
	char escolhaCombate;
	int dadoOuvir;
	int dadoConhecimento;

	dadoOuvir = rolarDado(20);

	if(dadoOuvir >= 10) {
		string checkoutDialogo[2] = {"Voce consegue escutar varios passos do outro lado da porta",
		"Alem disso, voce escuta varias vozes e o barulho dessas"};
		mostraDialogo(janelaDialogo,"Reconhecimento",checkoutDialogo,2);
		dadoConhecimento = rolarDado(20) + ficha.atributos.inteligencia;
		aumentarXP(ficha, 250);

		if (dadoConhecimento >= 8 and dadoConhecimento < 12) {
			string dialogo1[5] = {"Voce consegue reconhecer que sao kobolds pelo idioma que",
			"estao falando, draconico. O pouco que voce entende da conversa",
			"é que os kobolds estão muito nervosos e gostariam de deixar as",
			"minas o mais rápido possível. Infelizmente, seu comandante",
			"determinou que eles devem permanecer por mais um tempo."};
			proximoDialogo(janelaDialogo,"Reconhecimento",dialogo1,5);
			aumentarXP(ficha, 150);

		} else if (dadoConhecimento >= 12 and dadoConhecimento < 16) {
			string dialogo2[6] = {"Voce consegue reconhecer que sao kobolds pelo idioma que",
			"estao falando, draconico. O que voce entende da conversa",
			"é que algum tipo de criatura tem roubado os mortos de seu",
			"acampamento enquanto eles dormem. A maioria dos humanos",
			"já foram roubados e até mesmo alguns cadáveres de kobolds",
			"se perderam."};
			proximoDialogo(janelaDialogo,"Reconhecimento", dialogo2,6);
			aumentarXP(ficha, 200);

		} else if (dadoConhecimento >= 16) {
			string dialogo3[5] = {"Voce consegue reconhecer que sao kobolds pelo idioma que",
			"estao falando, draconico. Voce consegue entender bastante da",
			"conversa, o mais importante que voce escuta é que",
			"deve haver alguma maldição nesta mina. Metade do seu bando",
			"já morreu de estranhas febres ou de uma tosse horrível."};
			proximoDialogo(janelaDialogo,"Reconhecimento",dialogo3,5);
			aumentarXP(ficha, 250);

		} else {
			string dialogo4[2] = {"Voce nao consegue entender quase nada do que estao falando.",
			"No entanto, voce tem a impressao que sao kobolds."};
			proximoDialogo(janelaDialogo,"Reconhecimento",dialogo4,2);
		}

	}

	posicaoCriaturas = "voce tambem suurpreende os tres kobolds que estao na sala";
	string checkoutDialogo2[1] = {"Voce abre a grande porta de madeira e enxerga:"};
	mostraDialogo(janelaDialogo,"Caverna",checkoutDialogo2,1);
	return posicaoCriaturas;
}

char refeitorioCaverna(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
	int numeroCriaturas;
	int escolhaCombate;
	char solucaoCombate;
	string posicaoCriaturas;
	char ativou = escolhas.escolhasRecepcao.ativouArmadilha;

	if(tolower(ativou) != 's') {
		numeroCriaturas = 3;
		posicaoCriaturas = checkOuvirConhecimento(ficha,janelaDialogo);
	} else {
		numeroCriaturas = 4;
		string reveitorioCavernaDialogos1[4] = {"Ter ativado a armadilha atraiu muito a atencao daqueles que",
		"estao dentro da caverna, inclusive os kobolds dentro dessa sala.","Voce escuta muitos gritos e passos, voce imagina que eles estao",
		"se preparando para um combate. Ao abrir a porta você ve o seguinte:"}; 
		mostraDialogo(janelaDialogo,"Armadilha",reveitorioCavernaDialogos1,4);

		posicaoCriaturas = "Voce também exerga quatro kobolds apontando para voce.";
	}

	string refCarverna1[7] =  {"Uma sala larga e quadrada abriga quatro longas mesas de",
	"madeira, cada uma com um banco de cada lado. Em cima","das mesas estao um numero de tigelas de madeira e talheres.",
	"No canto sudeste da sala, um pequeno caldeirao fumega","sobre um fogao cravado no chao. Um cheiro pungente esta",
	"suspenso no ar. ",posicaoCriaturas};
	proximoDialogo(janelaDialogo,"Refeitorio",refCarverna1,7);

	string opcoesCaverna[2] =  {"Tentar conversar com eles.", "Atacar imediatamente."};
	escolhaCombate =  realizaPergunta(janelaMenu,"Os kobolds parecem bastante nervosos, o que voce ira fazer?", opcoesCaverna,2);


	if(escolhaCombate == 0) {
			solucaoCombate = dialogoCombateRefeitorio(ficha, janelaDialogo, janelaMenu, inimigo);
	} else if (escolhaCombate == 1) {
		string refCarverna2[2] = {"Voce imediatamente comeca a preparar o seu ataque enquanto",
		"os kobolds correm em direcao a voce."};
		proximoDialogo(janelaDialogo,"Confronto",refCarverna2,2);
		solucaoCombate = 'c';	
	} 
	return solucaoCombate;

}

char depensaCaverna(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
	int checkResistencia;
	char ficouContaminado;
	string cavernaDialogo[10] = {"Uma porta de madeira fechada barra a entrada para essa",
	"sala. Ao abrir porta você observa que esta sala longa",
	"e estreita possui fileiras de estantes carregadas","de alimentos e outros suprimentos. Pesados sacos",
	"de estopa estão empilhados até o teto no canto","oposto da câmara. Uns poucos rasgados, espalhando",
	"aveia e farinha no chão. Muitos barris estão", "agrupados próximos à parede norte.",
	"Ao entrar na sala, uma armadilha é ativada!","Uma flecha é lançada em sua direção."};

	proximoDialogo(janelaDialogo,"Caverna",cavernaDialogo,10);

	checkResistencia = rolarDado(20) + (ficha.atributos.sorte / 4);

	if(checkResistencia >= 11) {
		string resultado[1] = {"Por sorte, a armadilha não te acerta."};
		proximoDialogo(janelaDialogo,"Armadilha",resultado,1);
	} else {
		string resultado[2] = {"A flecha perfura o seu ombro. Causando",
		"um ferimento moderado."};
		proximoDialogo(janelaDialogo,"Armadilha",resultado,2);
		//Diminuir vida.
	}

	string cavernaDialogo2[5] = {"A armadilha chama a atenção de uma criatura",
	"que estava em um barril e ela irá atacar você.","Essas criatura é um rato, no entanto, bem maior",
	"que o normal, e você tem a impressão que pode pegar","a praga lutando com ela."};

	proximoDialogo(janelaDialogo,"Caverna",cavernaDialogo2,5);

	//iniciaBatalha(ficha) Drops: Arma +2 da classe;
	iniciaBatalha(janelaMenu, janelaDialogo, ficha, inimigo);


	checkResistencia = rolarDado(20) + (ficha.atributos.vitalidade / 4);
	aumentarXP(ficha, 2000);

	if(checkResistencia >= 10) {
		string resultado[2] = {"Apesar do contato com os ratos, você consegue",
		 "resistir a praga."};
		proximoDialogo(janelaDialogo,"Praga",resultado,2);
		ficouContaminado = 'n';
	} else {
		string resultado[3] = {"Após o combate, você sente que algo está errado...",
		"Você está se sentindo um pouco mais fraco, talvez","você tenha contraído a praga."};
		proximoDialogo(janelaDialogo,"Praga",resultado,3);
		ficouContaminado = 's';
	}

	string cavernaDialogo3[3] = {"Em um dos barris, você encontra duas poções de vida",
	"e duas poções de mana, naturalmente você guarda elas.","Elas podem ser bastante úteis no futuro."};
	proximoDialogo(janelaDialogo,"Caverna",cavernaDialogo3,3);

	string cavernaDialogo4[5] = {"Após os achados, você começa a descer uma rampa que",
	"leva a uma parte inferior da caverna. Aos poucos ","ela vai ficando muito íngrime, a um ponto que te",
	"faz perder o equilíbrio e descer o resto da rampa","deslizando a mesma."};
	proximoDialogo(janelaDialogo,"Caverna",cavernaDialogo4,5);
	
	return ficouContaminado;
}

void rampaCaverna(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
	int escolhaCaminho;

	string rampaCavernaDialogo1[10] = {"Após descer a rampa e chegar no fundo da caverna",
	"você olha que esta caverna enorme se estende","para cima até pelo menos 30 m, subindo alto para",
	"dentro das entranhas da montanha. A iluminação","ocasionalmente reflete pequenos grãos prateados,",
	"que brilham na face parede oeste da caverna.","Muitos cabos estão pendurados na beirada de um",
	"largo vazio na parede. O buraco penetra a face","oeste da caverna e começa a cerca de 6 m de",
	"onde você está. O ar aqui é mais frio e úmido."};

	proximoDialogo(janelaDialogo,"Rampa da Caverna", rampaCavernaDialogo1,10);

	string rampaCavernaDialogo2[4] = {"De repente, você escuta vários passos. Não de",
	 "humanoides, mas de animais. Um imenso","lobo aparece por trás de algumas pedras e",
	 "começa a te cercar, e ele vai te atacar!"};

	proximoDialogo(janelaDialogo,"Rampa da Caverna",rampaCavernaDialogo2,4);

	//IniciaCombate(ficha);
	iniciaBatalha(janelaMenu, janelaDialogo, ficha, inimigo);
	aumentarXP(ficha, 2000);

	string rampaCavernaDialogo3[3] = {"Após o combate, você percebe que pode escalar",
	"aqueles cabos pendurados. No entanto, também","existe um túnel à frente"};

	proximoDialogo(janelaDialogo,"Caverna",rampaCavernaDialogo3,3);

	string opcoesRampa[2] =  {"Escalar os cabos", "Seguir em frente"};

	escolhaCaminho =  realizaPergunta(janelaMenu,"O que voce vai fazer?", opcoesRampa,2);


	if(escolhaCaminho == 0) {
		int checkObservar = rolarDado(20);
		if(checkObservar >= 5) {
			string respostaRampa1[5] = {"Aṕos escalar os cabos, você sobe em uma",
			"pedra e exerga uma passagem para o que","parece um acampamento, você consegue",
			"exergar que existem muitos tesouros","lá dentro."};
			proximoDialogo(janelaDialogo,"Passagem",respostaRampa1,5);
			acampamentoSecreto(ficha, janelaDialogo,janelaMenu);

		} else {
			string respostaRampa2[3] = {"Você escala os cabos, mas devido ao escuro,",
			"você não consegue enxergar nada. Sua única","opção é voltar e seguir o outro caminho."};
			proximoDialogo(janelaDialogo, "Passagem", respostaRampa2,3);
		}

	} else if (escolhaCaminho == 1) {
		string respostaRampa3[3] = {"Você prefere não se arriscar escalando esses",
		"cabos. É mais sensato manter o foco e seguir" ,"o caminho."};
		proximoDialogo(janelaDialogo,"Passagem",respostaRampa3,3);
		
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
	
	mostraDialogo(janelaDialogo,"Passagem",acampamentoSecreto,5);

	string opcoesAcampamento[2] = {"Matar eles e ficar com a capa.","Poupar a vida deles e pegar apenas o tesouro."};

	escolhaAcampamento = realizaPergunta(janelaMenu,"O que voce ira fazer?",opcoesAcampamento,2);

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

void pioraCondicao (Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	string dialogo[6] = {"A leve fraqueza que você estava sentindo",
	"está demasiadamente pior, você já sente","um pouco de dificuldade em movimentos",
	"bruscos ou que precisam de força. No entanto,","você continua determinado a acabar com esse","problema."};
	
	proximoDialogo(janelaDialogo,"As coisas estão piorando..",dialogo,6);
	
}

void fossoCadaveres(Ficha &ficha, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
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
		proximoDialogo(janelaDialogo,"Caverna - Fosso",dialogo,3);
	}

	string dialogoFosso2[2] = {"Quatro zumbis levantam-se de um dos montes","de corpos! Prepare-se para o combate!"};
	
	proximoDialogo(janelaDialogo,"Caverna - Fosso",dialogoFosso2,2);
	//IniciaCombate(ficha);
	iniciaBatalha(janelaMenu, janelaDialogo, ficha, inimigo);
	aumentarXP(ficha, 2000);

	string dialogoFosso3[4] = {"","Algo dentro de você diz que isso está perto","de acabar. Ao calmo som de água corrente. Você",
	"entra no estreito túnel a leste."};

	proximoDialogo(janelaDialogo,"Caverna - Fosso",dialogoFosso3,4);
}

void finalJakk(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro inimigo) {
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

	proximoDialogo(janelaDialogo,"Caverna - A fonte",dialogofinalJakk,12);

	if(dadoReligiao >= 8) {
		string dialogoFinalJakk2[6] = {"\nOs símbolos entalhados aqui estão escritos","no idioma orc e servem como uma súplica a",
		"Gruumsh (o deus dos orcs) para destruir","os inimigos com uma terrível pestilência.","Eles também recontam a história das minas e o destino",
		"do clã Garra Despedaçante"};

		proximoDialogo(janelaDialogo,"Caverna - A fonte",dialogoFinalJakk2,6);
		interpretouSimbolos = true;
	}

	escolhas.conversaFinal.interpretouSimbolos = interpretouSimbolos;

	string dialogoFinalJakk3[3] = {"No centro, voce percebe uma imponente presenca","Um grande orc, com uma armadura de metal e uma",
	"clava de aço na mão direita."};

	proximoDialogo(janelaDialogo,"Caverna - A fonte",dialogoFinalJakk3,3);

	string opcoesFinalJakk[2] = {"Tentar conversar com ele.","Atacar imediatamente."};

	escolhaLuta = realizaPergunta(janelaMenu,"O que voce vai fazer?",opcoesFinalJakk,2);

	if(escolhaLuta == 0) {
		solucao = ConversaJakk(ficha, escolhas,janelaDialogo,janelaMenu);
		escolhas.conversaFinal.resultadoConversa = solucao;	

	}else{
		string dialogofinalJakk4[2] = {"O Orc prepara sua maça enquanto você corre","em sua direção."};
		proximoDialogo(janelaDialogo,"Jakk",dialogofinalJakk4,2);
		iniciaBatalha(janelaMenu, janelaDialogo, ficha, inimigo);
		escolhas.conversaFinal.resultadoConversa = 'c';	
	}

}

char ConversaJakk(Ficha &ficha, Escolhas &escolhas,WINDOW *janelaDialogo, WINDOW *janelaMenu) {
	int escolhaConversa;
	int respostaJakk;
	int convencerJakk;
	char respostaDet;
	int solucaoJakk;
	bool interpretouSimbolos = escolhas.conversaFinal.interpretouSimbolos;

	string dialogoConversaJakk[3] = {"Jakk: Meu nome é Jakk, o que voce quer? Voce",
	"Jakk: se arricou muito para chegar aqui.","Jakk: Que tolice.",};

	proximoDialogo(janelaDialogo,"Jakk", dialogoConversaJakk,3);

	string escolhaConversaJakk[4] = {"O que voce sabe sobre a praga?","Eu tenho a cura, me mate e voce nunca a obtera.(Enganacao)",
	"Nao importa o que voce sabe, eu vim aqui para lutar com voce"};

	escolhaConversa =  realizaPergunta(janelaMenu,"O que voce ira responder:",escolhaConversaJakk,4);

	if(escolhaConversa == 0) {
		string respostaJakk1[3] = {"Jakk: Eu que criei e estou matendo essa praga.",
		"Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Portanto, cuspa logo o que voce quer ou lute comigo!"};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk1,3);
			
	} else if (escolhaConversa == 1) {
		string respostaJakk2[4] = {"Jakk: Pare de mentir, humano insolente!","Jakk: Eu que criei e estou mantendo essa praga.",
		"Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Entao cuspa logo o que voce quer ou lute comigo!"};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk2,4);
			
	} else if (escolhaConversa == 2) {
		string respostaJakk3[1] = {"Jakk: Voce nao tem uma chance, seu verme."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk3,1);
		return 'c';	
	} 
	
	string escolhaConversaJakk2[2] = {"Por que esta fazendo isso?","Entao eu tenho o dever de para-lo."};
	
	respostaJakk = realizaPergunta(janelaMenu,"O que voce ira responder:",escolhaConversaJakk2,2);

	if(respostaJakk == 0) {
		string respostaJakk4[5] = {"Jakk: 10 anos atras, o povo de Passagem de Duvik quase",
		"Jakk: exterminou o meu clã, o clã Garra Despedaçante, pois","Jakk: achavam que nós éramos uma ameaça. Eles não quiseram",
		"Jakk: ter nenhuma forma de conversa. Essa é a vinganca","Jakk: do meu clã."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk4,5);
			
	} else if (respostaJakk == 1) {
		string respostaJakk5[1] = {"Jakk: É hora de morrer, seu verme insolente!"};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk5,1);	
		return 'c';	
	} 

	string escolhaConversaJakk3[3] = {"Matando eles voce fica tao errado quanto aquelesque mataram o seu cla. Voce nao combate odio com odio.",
	" Voce esta matando ainda mais pessoas do seu cla. Voce nao viu a quantidade de kobolds mortos? Pare com isso,todos os seus soldados querem sair daqui e esquecer","Isso nao justifica os seus erros. Voce morrera agora!"};

	convencerJakk = realizaPergunta(janelaMenu,"O que voce ira responder:",escolhaConversaJakk3,3);
	
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
		return 'c';
	}

	int tamanho = 2;
	string escolhaConversaJakk4[2] = {"Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
	"Seja um pouco racional... Isso nao trara alegria a ninguem."};

	if(interpretouSimbolos) {
		string escolhaConversaJakk4[3] = {"Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
		"Seja um pouco racional... Isso nao trara alegria a ninguem.","Eu tenho certeza que a vontade de Gruumsh eh que isso acabe pacificamente."};
		tamanho = 3;	
	}

	solucaoJakk = realizaPergunta(janelaMenu,"O que voce ira responder:",escolhaConversaJakk4,tamanho);

	//TO DO
	int checkCarisma = rolarDado(20) + ficha.atributos.carisma;

	if(solucaoJakk == 0 or solucaoJakk == 1 and checkCarisma >= 10) {
		string respostaJakk9[3] = {"Jakk: É verdade... Meu povo está sofrendo demais com isso.",
		"Jakk: Eu vou quebrar o feitico imediatamente. Obrigado por","Jakk: trazer razao ao meu pensamento, humano."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk9,3);	
		return 'p';	
	
	} else if (solucaoJakk == 2 and interpretouSimbolos) {
		string respostaJakk10[3] = {"Jakk: Voce tem toda a razao... O que eu estava pensando?",
		"Jakk: Eu vou quebrar o feitico imediatamente. Obrigado","Jakk: por trazer sensatez, humano."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk10,3);
		return 'p';
	} else if (checkCarisma < 10) {
		string respostaJakk11[2] = {"Jakk: Voce parece sensato, mas tenho que honrar meu clã",
		"Jakk: É hora de lutar, humano."};
		proximoDialogo(janelaDialogo,"Jakk",respostaJakk11,2);
		return 'c';
	} 

}


void imprimeVarianciasFinal(Escolhas &escolhas,WINDOW *janelaDialogo) {
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
	proximoDialogo(janelaDialogo,"Créditos",creditos,9);
}

void contaHistoria(Ficha &ficha, Escolhas &escolhas, WINDOW *janelaDialogo, WINDOW *janelaMenu, Monstro *monstros) {
	EscolhasCidade escolhasCidade = escolhas.escolhasCidade;
	EscolhasRecepcao escolhasRecepcao = escolhas.escolhasRecepcao;
	Personagem personagem = ficha.personagem;

	introducaoCidade(janelaDialogo);

	escolhasCidade.ganchoAventura = ganchoAventura(janelaDialogo, janelaMenu);

	if(tolower(escolhasCidade.ganchoAventura) == 'd') {
	escolhasCidade.segundaChance = segundaChance(personagem, janelaDialogo, janelaMenu);
	} else {
		escolhasCidade.segundaChance = 'y';
	}

	if(tolower(escolhasCidade.segundaChance) == 'n') {
		imprimePrimeiroFinal(janelaDialogo);
		imprimeCreditos(janelaDialogo);
	} else {
		entradaMina(ficha, janelaDialogo, janelaMenu, monstros[0]);
		escolhasRecepcao.ativouArmadilha = recepcaoCaverna(ficha, janelaDialogo, janelaMenu);
		escolhas.escolhasRefeitorio.solucaoCombate = refeitorioCaverna(ficha, escolhas, janelaDialogo, janelaMenu, monstros[2]);
		escolhas.combateDespensa.contiminado = depensaCaverna(ficha, janelaDialogo, janelaMenu, monstros[3]);
		rampaCaverna(ficha, janelaDialogo, janelaMenu, monstros[1]);
		fossoCadaveres(ficha, janelaDialogo, janelaMenu, monstros[4]);

		if(escolhas.combateDespensa.contiminado == 's') {
			pioraCondicao(ficha, janelaDialogo,janelaMenu);
		}

		finalJakk(ficha, escolhas, janelaDialogo, janelaMenu, monstros[6]);

		if(escolhas.conversaFinal.resultadoConversa == 'p') {
			imprimeFinalPacifico(janelaDialogo);
		} else {
			imprimeFinalViolento(janelaDialogo);
		}

		imprimeVarianciasFinal(escolhas, janelaDialogo);
		imprimeFuturoVila(janelaDialogo);
		imprimeCreditos(janelaDialogo);
	}
}