:- use_module("../util").

:- dynamic(adventureHanger/1).
:- dynamic(activateTrap/1).
:- dynamic(infected/1).

% Colocar em util depois
getYesNo(Choice) :-
    writeln("1) Sim"),
    writeln("2) Nao"),
    readInt(Z),
    Choice = Z.


introCity :-
    L = ['É Uma manhã ensolarada, você se encontra em Passagem de Duvik, uma pequena cidade',
	'situada em um dos pequenos vales que cruzam as Montanhas Serpente.',
	'Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros',
	'procurando descansar membros doloridos e afogar memórias ruins dentro de seus portões.',
	'E você não é uma exceção. No entanto algo te parece estranho, a cidade parece bem vazia',
    'Você não consegue encontrar, os inúmeros animais que existiam ao redor da cidade.'],
    printList(L).

adventureClincher :-
    L = ["Você está na praça principal da cidade e, percebe",
	"algumas pessoas que te chamam a atenção:",
	"Um homem com roupas nobres, não parece ser dessa cidade.",
	"Um grupo de pessoas com manchas de carvão no rosto e braços.",
    "Alguns moradores que estão claramente abatidos."],
    
    printList(L),
    
    P = ["Qual deles voce ira se aproximar:",
    "1) O homem aparentemente rico.",
	"2) As pessoas sujas de carvao.",
	"3) Os moradores da cidade.",
    "4) Ninguem."],
    
    printList(P),
    get(C),
    changeDirection(C).

changeDirection(X) :-
    A = ["Ao se aproximar dele, voce escuta:"," ",
    "Prefeito: Saudações. Eu sou o prefeito dessa cidade.",
    "Prefeito: muitos dos moradores da vila estão sofrendo de uma",
    "Prefeito: doenca extremamente letal. Não pude deixar de notar",
    "Prefeito: que você é um aventureiro, você poderia nos ajudar",
    "Prefeito: a acabar com essa doença? Por favor, muitos já",
    "Prefeito: morreram com essa praga."],

    B = ["Você nao demora muito pra perceber que eles sao mineradores",
    "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:\n",
    "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte.",
    "Minerador: voce parece forte. Por favor, acabe com esse mal!"],
    
    C = ["Voce encontra diversos moradores atonitos na vila.",
    "Uma das moradoras se aproxima de voce e diz:",
    "Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro",
    "Senhora: meus dois filhos ja foram pegaram praga. Eu imploro, por favor acabe com isso."],

    D = ["Isso não é problema seu. Você já tem problemas demais pra resolver.",
    "Esses camponeses conseguem resolver esse problema sozinho.",
    "Ao menos você acha isso."],

    ((X =:= 49,
    printList(A));
    (X =:= 50,
    printList(B));
    (X =:= 51, 
    printList(C));
    (X =:= 52,
    printList(D));
    (writeln("Opção inválida."),
    adventureClincher)),
    

    writeln(""),
    writeln("Você irá ajudar? (Digite s ou n)"),
    writeln(""),

    get(Z),
    ((Z =\= 115,
    writeln("Com um olhar de desaprovação, lentamente começam a se afastar de você."));
    (writeln("Mal sei o que dizer. Muito obrigado!!"))).

secondChance:-
    Dial1 = ["Uma pessoa se aproxima de você, ela te parece familiar",
            "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen.",
            "Um guerreiro que costumava lutar com você, alguns anos atrás.",
            "Ele está bem magro, comparado ao tempo que ele lutava com você." ,
            "Ele se aproxima e diz: ",
            "Meruen: Há quanto tempo, amigo. Há algo de errado em uma mina próxima dessa região",
            "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo",
            "Meruen: é provável que ela esteja causando a praga que está assolando essa vila.",
            "O que voce respondera pra ele:",
            "1 - Voce poderia falar mais sobre essa praga?",
            "2 - Voce esta bem?",
            "3 - Ha alguma coisa em que eu possa ajudar?"],

    MeruenResponse1 = [ "Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva",
                        "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana.",
                        "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias...",
                        "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."], 

    MeruenResponse2 = ["Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias...",
                       "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."],

    MeruenResponse3 = ["Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar",
                       "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias...",
                       "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?"].                 


firstEnding:-
    Dial = ["Conclusao",
            "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila.",
            "Duas semanas depois, em outra vila a procura de um artefato.",
            "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga.",
            "Aqueles que sobreviveram foram os que fugiram",
            "de Passagem de Duvik enquanto nao tinham sido contaminados",
            "A promissora cidade comerciante, se tornou apenas uma ruina",
            "uma promessa do que poderia se tornar."].

entradaMina:-
    Dial1 = ["Entrada da caverna",
            "Apos algumas horas de caminhada, voce chega na caverna.",
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
             "silencio preenche a abertura nas montanhas."],

    Dial2 = ["Você encontra um kobolds, ele parece hostil",
             "E irá atacar você! Prepare-se para o combate!"],

    printList(Dial1),
    printList(Dial2),
    escolhaMina.

escolhaMina :-
    Opcoes = ["Voce permanece por um tempo em frente a entrada",
            "Por um momento voce hesita em seguir em frente",
            "O que voce vai fazer?",
            "",
            "1) Tentar analisar com mais detalhes a entrada da caverna.",
            "2) Procurar por alguma coisa ao redor da entrada.",
            "3) Acender uma tocha e entrar na caverna."],
    Resp = ["","Selecione uma das opções: "],
    printList(Opcoes),
    printList(Resp),
    readInt(Z),
    
    (
    (Z =:= 1, primeiraEscolhaEntrada);
    (Z =:= 2, segundaEscolhaEntrada);
    (Z =:= 3, analiseEntrada);
    (writeln("Opcao invalida."), escolhaMina)
    ).


analiseEntrada:-
    Dial = ["Analisar as coisas é perda de tempo, seus inimigos não tem",
            "uma chance contra você mesmo... Voce acende uma tocha, respira",
            "fundo e entra na mina."],
    printList(Dial),
    cavernReception.

primeiraEscolhaEntrada:-
    util:rollDice(20, D),
    Opcao1 = ["Ao analisar a entrada",
              "Voce percebe que os suportes de madeira do tunel",
              "estao lascados e despedacados, como se tivessem danificados",
              "em uma recente batalha.",
              "Voce também percebe que elas estão manchadas de sangue."],

    Opcao2 = ["Ao analisar a entrada",
              "Voce percebe que os suportes de madeira do tunel",
              "estao lascados e despedacados, como se tivessem danificados",
              "em uma recente batalha."],

    Opcao3 = ["Voce tenta analisar a entrada, porém não consegue",
              "encontrar nada relevante na estrutura."],

    Dial = ["Você acende uma tocha e entra na caverna."],
    
    (D >= 15,
    util:printList(Opcao1);
    D >= 10,
    util:printList(Opcao2);
    util:printList(Opcao3)),

    util:printList(Dial),
    cavernReception.



segundaEscolhaEntrada:-
    util:rollDice(20, D),

    Opcao1 = ["Ao procurar ao redor da entrada",
              "No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!",
              "No entanto, voce nao encontrou nada que pode ser util para entender",
              "o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna."],

    Opcao2 = ["Ao procurar ao redor da entrada",
              "No meio as picaretas e pás quebradas, você encontra duas poções de vida!",
              "Possivelmente elas serao úteis... Voce tambem encontra um simbolo",
              "associados a kobolds, pequenas criaturas que são conhecidas por serem",
              "saqueadores. E provavel que tenha havido um combate por aqui. Você",
              "acende uma tocha e entra na caverna com atenção redobrada."],

    Opcao3 = ["Ao procurar ao redor da entrada",
              "Voce buscar por alguns minutos, no entanto, voce nao encontra",
              "nada relevante pra voce.",
              "Você acende uma tocha e entra na caverna."],
    
    ((D >= 15,
    printList(Opcao2));
    (D >= 10,
    printList(Opcao1));
    printList(Opcao3)),
    cavernReception.

cavernReception:-
    Dial = ["O tunel se abre em uma camara pequena e aproximadamente",
            "regular. Pedacos espalhados de minerio de prata cercam",
            "um par de carroças de madeira. A parte de baixo do que",
            "aparenta ser um corpo humano se sobressai debaixo de uma",
            "das carrocas. E nao mostra nenhum sinal de movimento.",
            "Sangue seco mancha a parede norte em varios locais.",
            "Há uma saída para o oeste",
            ""],
    
    printList(Dial),
    receptionChoice.

receptionChoice:-
    Opcao = ["O que você vai fazer? (digite um número)",
            "1) Analisar o corpo da carroca.",
            "2) Seguir em frente."],
    printList(Opcao),
    readInt(N),
    ((N =:= 1,
    checkWagon1);
    (N =:= 2,
    checkWagon2);
    (checkWagon3)),

    receptionConclusion.


receptionConclusion:-
    Dial = ["Apos passar da carroca, voce so ve uma grande porta a sua frente.",
    "Voce nao ve outra opcao a nao ser entrar nela."],
    printList(Dial).


checkWagon1:-
    util:rollDice(20, D),
    Opcao1 = ["Voce escuta um barulho de",
            "mecanismos, voce rapidamente entende que e uma armadilha",
            "e salta para tras, conseguindo desviar do ataque sonico",
            "produzido pela mesma."],

    Opcao2 = ["Voce escuta um barulho de",
            "mecanismos, e uma armadilha que produz um som ensurdecedor",
            "que deixa voce temporariamente surdo."],
    
    ((D >= 12,
    printList(Opcao1));
    (printList(Opcao2),
    asserta(activateTrap(1)))).

checkWagon2:-
    Dial = ["Voce prefere nao se arriscar e mexer nesse corpo.",
            "É quase certo que havia alguma armadilha ali. Seria uma coin-",
            "cidencia muito grande tantos minerios de prata espalhados uniformemente."],
    printList(DiaL).

checkWagon3:-
    Dial = ["Opção invalida!"],
    printList(Dial),
    receptionChoice.


wagonDescription:-
    Dial = ["Ao analisar o corpo, voce percebe que ele tem marcas parecidos com",
            "as vitimas da praga. Ele tem uma roupa diferente dos outros mineradores",
            "Provavelmente era o chefe deles. Ele parece ter sido uma vitima de um ataque",
            "tendo muitos ferimentos perfurantes no peito e pescoco.",
            "",
            "Voce tambem percebe inumeros pedacoes de prata ao redor da carroca.",
            "Voce ira coletar?"],
    printList(Dial),
    getSilver.

getSilver:-
    getYesNo(Take),
    
    Dial1 = ["Voce coleta os minerios sem problemas."],

    Dial2 = ["Voce prefere nao arricar a pegar esses minerios."],

    % Add item
    ((Take =:= 1,
    printList(Dial1));
    (printList(Dial2))).


koboldsCombatConversation:-
    util:rollDice(20, D),
    
    ((D >= 13,koboldsCombatChoice);
    (startBattleKobolds)).

koboldsCombatChoice:-
    Opcao1 = ["Ao comecar a falar, os kobolds apesar de receiosos",
    "resolvem escutar o que voce tem a dizer",
    "O que você irá dizer para eles?",
    "1) Nao precisamos brigar. Nenhum de nos quer isso! (Diplomacia)",
    "2) Nao ousem me atacar se quiserem continuar vivos. (Intimidacao)"],

    printList(Opcao1),
    readInt(Choice),
    (
    ((Choice =:= 1; Choice =:= 2), koboldsCombatDialogue2(Choice));
    (writeln("Opcao invalida!"), koboldsCombatChoice)
    ).
    
koboldsCombatDialogue2(Choice):-
    util:rollDice(20, D),
    DialOp1 = ["Os kobolds parecem concordar com voce e abaixam as armas.",
            "O que parece ser o capitao daquele pequeno grupo fala:",
            "Capitão: Nao temos forca pra lutar, doenca enfraquecer e matar",
            "Capitão amigos. Humano pode seguir em frente."],

    DialOp2 = ["Os kobolds parecem, de fato, ficarem intimidados com voce.",
               "O que parece o capitao daquele pequeno grupo fala:",
               "Capitão: Tudo bem, humano pode passar. Só não nos mate, por favor."],

    (
    (D >= 13, Choice =:= 1, printList(DialOp1));
    (D >= 10, Choice =:= 2, printList(DialOp2));
    (startBattleKobolds)
    ).



checkListenKnowledge:-
    util:rollDice(20, D),
    Opcao1 = ["Voce consegue escutar varios passos do outro lado da porta",
              "Alem disso, voce escuta varias vozes"],

    Opcao2 = ["Voce nao consegue entender quase nada do que estao falando.",
              "No entanto, voce tem a impressao que sao kobolds."],

    Dial = ["Voce abre a grande porta de madeira e enxerga:"],

    (
    (D >= 10, printList(Opcao1), auxCheckKnowledge);
    (printList(Opcao2))
    ),

    printList(Dial).

auxCheckKnowledge:-
    util:rollDice(20, D),
    Opcao1 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. O pouco que voce entende da conversa",
              "é que os kobolds estão muito nervosos e gostariam de deixar as",
              "minas o mais rápido possível. Infelizmente, seu comandante",
              "determinou que eles devem permanecer por mais um tempo."],

    Opcao2 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. O que voce entende da conversa",
              "é que algum tipo de criatura tem roubado os mortos de seu",
              "acampamento enquanto eles dormem. A maioria dos humanos",
              "já foram roubados e até mesmo alguns cadáveres de kobolds",
              "se perderam."],

    Opcao3 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. Voce consegue entender bastante da",
              "conversa, o mais importante que voce escuta é que",
              "deve haver alguma maldição nesta mina. Metade do seu bando",
              "já morreu de estranhas febres ou de uma tosse horrível."],

    Opcao4 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. Porém, não consegue enteder quase",
              "nada. No entanto, você percebe que os kobolds estão nervosos",
              "pelo tom de voz."],
    
    (
    (D >= 16, printList(Opcao3));
    (D >= 12, printList(Opcao2));
    (D >= 8, printList(Opcao1));
    (printList(Opcao4))
    ).

startBattleKobolds:-
    Dial = ["O que parece ser o capitao daquele pequeno grupo fala:",
            "Capitao: Nao importa o que humano fale, voce morre agora!"],
    printList(Dial).
    % comecar batalha.

refectoryCavern:-

    Opcao = ["Ter ativado a armadilha atraiu muito a atencao daqueles que",
            "estao dentro da caverna, inclusive os kobolds dentro dessa sala.",
            "Voce escuta muitos gritos e passos, voce imagina que eles estao",
            "se preparando para um combate. Ao abrir a porta você ve o seguinte:"],

    Dial = ["Uma sala larga e quadrada abriga quatro longas mesas de",
            "madeira, cada uma com um banco de cada lado. Em cima",
            "das mesas estao um numero de tigelas de madeira e talheres.",
            "No canto sudeste da sala, um pequeno caldeirao fumega",
            "sobre um fogao cravado no chao. Um cheiro pungente esta",
            "suspenso no ar. ",
            "Voce também exerga três kobolds apontando armas para voce.",
            ""],
    
    ((activateTrap(1),
    printList(Opcao));
    (checkListenKnowledge)),

    printList(Dial),
    refectoryChoice.

refectoryChoice:-
    Opcoes = ["Os kobolds parecem bastante nervosos, o que voce ira fazer?",
            "1) Tentar conversar com eles.",
            "2) Atacar imediatamente."],
    
    printList(Opcoes),
    readInt(Choice),
    
    (
    (Choice =:= 1, koboldsCombatConversation);
    (Choice =:= 2, refectoryChoice2);
    (writeln("Opcao invalida!"), refectoryChoice)
    ).

refectoryChoice2:-
    Dial = ["Voce imediatamente comeca a preparar o seu ataque enquanto",
            "os kobolds correm em direcao a voce."],
    printList(Dial).
    % Inicia combate

pantryCavern:-
    util:rollDice(20, D),
    Dial1 = ["Uma porta de madeira fechada barra a entrada para essa",
            "sala. Ao abrir porta você observa que esta sala longa",
            "e estreita possui fileiras de estantes carregadas",
            "de alimentos e outros suprimentos. Pesados sacos",
            "de estopa estão empilhados até o teto no canto",
            "oposto da câmara. Uns poucos rasgados, espalhando",
            "aveia e farinha no chão. Muitos barris estão",
            "agrupados próximos à parede norte.",
            "Ao entrar na sala, uma armadilha é ativada!",
            "Uma flecha é lançada em sua direção."],
    
    printList(Dial1),

    
    Opcao11 = ["Por sorte, a armadilha não te acerta."],
    
    Opcao12 = ["A flecha perfura o seu ombro. Causando",
    "um ferimento moderado."],
    
    (
    (D >= 11, printList(Opcao11));
    (printList(Opcao12))
    ),

    Dial2 = ["A armadilha chama a atenção de uma criatura",
            "que estava em um barril e ela irá atacar você.",
            "Essas criatura é um rato, no entanto, bem maior",
            "que o normal, e você tem a impressão que pode pegar",
            "a praga lutando com ela."],

    printList(Dial2),
    % Inicia batalha.

    util:rollDice(20, R),

    Opcao21 = ["Apesar do contato com os ratos, você consegue",
              "resistir a praga."],

    Opcao22 = ["Após o combate, você sente que algo está errado...",
               "Você está se sentindo um pouco mais fraco, talvez",
               "você tenha contraído a praga."],
    
    (
    (R >= 11, printList(Opcao21));
    (printList(Opcao22), asserta(infected(1)))    
    ),

    Dial3 = ["Em um dos barris, você encontra duas poções de vida",
            "e duas poções de mana, naturalmente você guarda elas.",
            "Elas podem ser bastante úteis no futuro."],
    
    printList(Dial3),
    % Adicionar item 2
    % Adicionar item 2
    % Adicionar item 4
    % Adicionar item 4

    Dial4 = ["Após os achados, você começa a descer uma rampa que",
            "leva a uma parte inferior da caverna. Aos poucos ",
            "ela vai ficando muito íngrime, a um ponto que te",
            "faz perder o equilíbrio e descer o resto da rampa",
            "deslizando a mesma."],
    
    printList(Dial4).

rampCavern:-
    Dial1 = ["Após descer a rampa e chegar no fundo da caverna",
            "você olha que esta caverna enorme se estende",
            "para cima até pelo menos 30 m, subindo alto para",
            "dentro das entranhas da montanha. A iluminação",
            "ocasionalmente reflete pequenos grãos prateados,",
            "que brilham na face parede oeste da caverna.",
            "Muitos cabos estão pendurados na beirada de um",
            "largo vazio na parede. O buraco penetra a face",
            "oeste da caverna e começa a cerca de 6 m de",
            "onde você está. O ar aqui é mais frio e úmido.",
            "De repente, você escuta vários passos. Não de",
            "humanoides, mas de um animal. Um imenso",
            "lobo aparece por trás de algumas pedras e",
            "começa a te cercar, e ele vai te atacar!"],

    printList(Dial1),
    % Inicia batalha.

    Dial2 = ["",
            "Após o combate, você percebe que pode escalar",
            "aqueles cabos pendurados. No entanto, também",
            "existe um túnel à frente"],
    
    printList(Dial2),
    rampChoice,
    corpsesGrave.


rampChoice:-
    Choices = ["O que voce vai fazer?",
               "1) Escalar os cabos",
               "2) Seguir em frente"],
    
    printList(Choices),
    readInt(Z),
    
    (
    (Z =:= 1, rampProgress1);
    (Z =:= 2, rampProgress2);
    (writeln("Opção inválida, tente novamente"), rampChoice())
    ).

rampProgress1:-
    util:rollDice(20, R),

    Opcao1 = ["Aṕos escalar os cabos, você sobe em uma",
              "pedra e exerga uma passagem para o que",
              "parece um acampamento, você consegue",
              "exergar que existem muitos tesouros",
              "lá dentro."],

    Opcao2 = ["Você escala os cabos, mas devido ao escuro,",
              "você não consegue enxergar nada. Sua única",
              "opção é voltar e seguir o outro caminho."],
    
    (
    (R >= 5, printList(Opcao1), secretCamp);
    (printList(Opcap2))
    ).



rampProgress2:-
    Dial = ["Você prefere não se arriscar escalando esses",
            "cabos. É mais sensato manter o foco e seguir",
            "o caminho."],
    
    printList(Dial).


secretCamp:-
    Dial = ["Ao entrar na passagem, você encontra o acampa-",
            "mento dos Kobolds, usado como área de estoque",
            "e dormitório. Você encontra um baú e dois",
            "jovens Kobolds, que estão olhando para você",
            "e estão amedrontados. Um deles utiliza um capuz",
            "que parece valioso."],
    
    printList(Dial),
    secretCampChoice.

secretCampChoice:-
    Dial = ["O que voce ira fazer?",
            "1) Matar eles e ficar com a capa.",
            "2) Poupar a vida deles e pegar apenas o tesouro."],
    
    printList(Dial),
    readInt(C),

    (
    (C =:= 1, secretCampDecision1);
    (C =:= 2, secretCampDecision2);
    (writeln("Opção inválida, tente novamente."), secretCampChoice)
    ).

secretCampDecision1:-
    Dial = ["Para você, a capa é mais valiosa que a vida",
            "deles. Você os mata sem remorso e pega a",
            "capa deles, com um pouco de investigação",
            "você descobre que é uma capa da proteção.",
            "Logo após, você desce os cabos E segue o outro caminho."],

    % addItem 42

    printList(Dial).

secretCampDecision2:-
    Dial = ["Você poupa a vida deles, afinal, eles não",
            "fizeram absolutamente nada. Simplesmente não",
            "seria justo. Você pega três poções de vida",
            "e duas de mana. Logo após, você desce os cabos",
            "E segue o outro caminho."],
    
    printList(Dial).
    % addItem 2
    % addItem 2 
    % addItem 2 
    % addItem 4 
    % addItem 4 

situacionGettingWorst:-
    Dial = ["A leve fraqueza que você estava sentindo",
    "está demasiadamente pior, você já sente","um pouco de dificuldade em movimentos",
    "bruscos ou que precisam de força. No entanto,","você continua determinado a acabar com esse","problema."],

    % Reduzir vitalidade.
    printList(Dial).

corpsesGrave:-
    Dial1 = ["Você passa pelo túnel. Ondas de calor banham",
            "respiração difícil. Esta caverna pequena e",
            "em forma de tigela possui o chão cheio de",
            "cadáveres humanóides. A abertura de um túnel",
            "é visível na parede leste da câmara",
            "e, na distância, o som de água corrente",
            "pode ser ouvido."],

    Opcao1 = ["Você acredita que aqui é o fosso da criação",
              "da praga. Sejá la quem for que está fazendo",
              "isso, não deve ficar longe de onde você está."],

    Opcao2 = ["Um zumbi se levanta de um dos montes",
              "de corpos! Prepare-se para o combate!"],

    Dial2 = ["Algo dentro de você diz que isso está perto",
            "de acabar. Ao calmo som de água corrente. Você",
            "entra no estreito túnel a leste."],
    
    printList(Dial1),
    printList(Opcao1),
    printList(Opcao2),
    % iniciaBatalha,
    printList(Dial2).


% jakkEnding:-
%     L = ["Ao entrar, nessa parte da caverna, você observa um",
%         "único pilar irregular, de pedra e cheio de um musgo",
%         "A água cai pelas suas laterais de uma fonte",
%         "próxima ao seu topo, cascateando até a lagoa abaixo.",
%         "A lagoa alimenta uma larga correnteza que flui rapidamente",
%         "ao longo da extensão da sala e então por baixo da parede de",
%         "pedra na extremidade sul da caverna. Muitos símbolos estão",
%         "entalhados profundamente na face de pedra do pilar, suas",
%         "linhas apenas visíveis por baixo da luz do musgo. Uma",
%         "sensação estranha de desconforto impregna este lugar."],

%     A = ["Os símbolos entalhados aqui estão escritos",
%         "no idioma orc e servem como uma súplica a",
%         "Gruumsh (o deus dos orcs) para destruir",
%         "os inimigos com uma terrível pestilência.",
%         "Eles também recontam a história das minas e o destino",
%         "do clã Garra Despedaçante."],

%     B = ["No centro, voce percebe uma imponente presenca",
%         "Um grande orc, com uma armadura de metal e uma",
%         "clava de aço na mão direita.",
%         "O Orc prepara sua maça enquanto você corre",
%         "em sua direção."].

% jakkConversation:-
%     Dial1 = ["Jakk: Meu nome é Jakk, o que voce quer? Voce",
%     "Jakk: se arricou muito para chegar aqui.","Jakk: Que tolice."],

%     Dial2 = ["O que voce sabe sobre a praga?","Eu tenho a cura, me mate e voce nunca a obtera.(Enganacao)",
%     "Nao importa o que voce sabe, eu vim aqui para lutar com voce"],

%     Opcao1 = ["Jakk: Eu que criei e estou matendo essa praga.",
%         "Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Portanto, cuspa logo o que voce quer ou lute comigo!"],

%     Opcao2 = ["Jakk: Pare de mentir, humano insolente!","Jakk: Eu que criei e estou mantendo essa praga.",
%         "Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Entao cuspa logo o que voce quer ou lute comigo!"],

%     Opcao3 = ["Jakk: Voce nao tem uma chance, seu verme."],

%     Dial3 = ["Por que esta fazendo isso?","Entao eu tenho o dever de para-lo."],

%     Dial4 = ["Jakk: 10 anos atras, o povo de Passagem de Duvik quase",
%         "Jakk: exterminou o meu clã, o clã Garra Despedaçante, pois","Jakk: achavam que nós éramos uma ameaça. Eles não quiseram",
%         "Jakk: ter nenhuma forma de conversa. Essa é a vinganca","Jakk: do meu clã."],

%     Dial5 = ["Jakk: É hora de morrer, seu verme insolente!"],

%     Dial6 = ["Matando eles voce fica tao errado quanto aquelesque mataram o seu cla. Voce nao combate odio com odio.",
%     " Voce esta matando ainda mais pessoas do seu cla. Voce nao viu a quantidade de kobolds mortos? Pare com isso,todos os seus soldados querem sair daqui e esquecer","Isso nao justifica os seus erros. Voce morrera agora!"],

%     Dial7 = ["Jakk: O que voce sabe sobre meu cla? Voce nao sabe o que",
%         "Jakk: esta falando... Voce nao sabe o quanto meu cla sofreu.","Jakk: Pare de falar sobre o que você não tem ideia."],

%     Opcao3 = ["Jakk parece um pouco relutante.","Jakk: Eu sei, eu sou o que mais sofro com isso. No entanto,",
%         "Jakk: todos eles concordaram com isso, eu tenho que valorizar","Jakk: as mortes daqueles que se sacrificaram pela causa!"],

%     Opcao4 = ["Jakk: Voce nao tem uma chance, seu verme."],

%     Interpretou = ["Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
%         "Seja um pouco racional... Isso nao trara alegria a ninguem.","Eu tenho certeza que a vontade de Gruumsh eh que isso acabe pacificamente."],

%     NInterpretou = ["Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
%         "Seja um pouco racional... Isso nao trara alegria a ninguem."],

%     SolucaoJakk1 = ["Jakk: É verdade... Meu povo está sofrendo demais com isso.",
%         "Jakk: Eu vou quebrar o feitico imediatamente. Obrigado por","Jakk: trazer razao ao meu pensamento, humano."],

%     SolucaoJakk2 = ["Jakk: Voce tem toda a razao... O que eu estava pensando?",
%         "Jakk: Eu vou quebrar o feitico imediatamente. Obrigado","Jakk: por trazer sensatez, humano."],

%     SolucaoJakk3 = ["Jakk: Voce parece sensato, mas tenho que honrar meu clã",
%         "Jakk: É hora de lutar, humano."].


% printViolentEnding:-
%     Dial1 = ["Extremamente abatido, Jakk fala baixo:",
%         "Jakk: Eu apenas queria vingar o meu clã...",
%         "Jakk: Infelizmente eu acho que o mal prevaleceu...",
%         "Jakk, solta sua maça, e cai no chão."],

%     Dial2 = ["Derrotar Jakk já possui um efeito visível imediato",
%             "nas águas da nascente, que começa a ficar limpa da sujeira",
%             "da Febre logo após sua morte. Os sintomas",
%             "da Febre que afetam as pessoas de Passagem de Duvik",
%             "começaram a diminuir. E a ordem voltou a reinar na cidade."].

% printVillageFuture:-
%     Dial = ["Lentamente, Passagem de Duvik começou a se",
%             "reestruturar e a prosperar novamente. Alguns",
%             "anos depois, Passagem de Duvik se tornou uma das maiores",
%             "e ricas cidades do reino. No centro dela, há uma estatua sua,",
%             "para relembrar quem tornou o sucesso dessa cidade possível!"].

% printPacificEnding:-
%     Dial = ["Após convencer Jakk a terminar a maldição. A água",
%             "amaldiçoada, que servia como abastecimento de Passagem",
%             "de Duvik, foi aos poucos sendo purificada. Os sintomas",
%             "da Febre que afetam as pessoas de Passagem de Duvik",
%             "começaram a diminuir. E a ordem voltou a reinar na cidade."].

% printDefeatEnding:-
%     Dial = ["Apesar dos seus esforços, você não conseguiu derrotar Jakk.",
%             "Portanto, você não conseguiu acabar com o mal da praga.",
%             "Todos de Passagem de Duvik pereceram à doença, e a promissora cidade",
%             "comerciante, virou apenas uma promessa do que poderia ser..."].

% printVariantEnding_A:-
%     Dial = ["O prefeito se aproxima de voce e fala:",
%             "Prefeito: Eu só tenho a agradecer a você, nobre aventureiro",
%             "Prefeito: Voce salvou a vida de quase todos da cidade!",
%             "Prefeito: Aqui estão 500 peças de ouro como recompensa",
%             "Prefeito: pelo seu feito. Sempre que você voltar,",
%             "Prefeito: tenha a certeza que você será sempre bem recebido",
%             "Prefeito: aqui!"].

% printVariantEnding_B:-
%     Dial = ["O minerador que falou com voce anteriormente, se aproxima",
%             "e com um grande sorriso grita:",
%             "Minerador: Eu sabia! Eu sabia que você conseguiria!",
%             "Minerador: Voce salvou a vida de todos da cidade. E nós",
%             "Minerador: somos extremamente gratos a você! Eu não tenho",
%             "Minerador: muito, mas aqui está o que eu tenho, 500 peças",
%             "Minerador: de ouro.",
%             "Minerador: Ei! Sempre que vir aqui, minha casa sempre estará",
%             "Minerador: de portas abertas! Nós não esqueceremos de você."].

% printVariantEnding_C:-
%     Dial = ["A camponesa que falou com você anteriormente, se aproxima",
%             "e com um grande sorriso fala:",
%             "Camponesa: Voce conseguiu! Meus filhos e os outros moradores",
%             "Camponesa: já estão melhorando e tudo isso graças a você!",
%             "Camponesa: Não me esquecerei do que você fez aqui!",
%             "Camponesa: Aqui estão 500 peças de ouro por tudo, que você",
%             "Camponesa: fez. Nós da vila nos juntamos para pode pagar",
%             "Camponesa: a você!",
%             "Camponesa: Volte aqui de vez em quando! Tenho certeza",
%             "Camponesa: que todos daqui adorariam te ver novamente!"].

% printVariantEnding_Else:-
%     Dial = ["Meruen, o seu amigo que requisitou a missão, se aproxima",
%             "e diz:",
%             "Meruen: Eu tinha certeza que você conseguiria",
%             "Meruen: Você não só salvou minha vida como a de quase",
%             "Meruen: todos daqui da vila. Somos todos muito gratos",
%             "Meruen: a você. Aqui estão 500 peças de ouro, como uma",
%             "Meruen: forma de agradadecimento. Por fim, volte",
%             "Meruen: aqui de vez em quando. Seria muito bom",
%             "Meruen: te ver novamente!"].

% printCredits:-
%     Creditos = ["Obrigado por jogar: A Praga Carmesim!",
%                 "Sistema inspirado: Dungeons and Dragons, quinta edição.",
%                 "",
%                 "Feito por:",
%                 "Jadson Luan",
%                 "Jesse Souza",
%                 "Lucas de Medeiros",
%                 "Mikael Brasileiro",
%                 "",
%                 "Existem mais finais para serem desbravados, tente conseguir outro jogando novamente!"].