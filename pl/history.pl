:- initialization(main).

:- use_module("util").
:- use_module("Sheet/sheet.pl").
:- use_module("Battles/battle.pl").
:- use_module("interface.pl").

:- dynamic(adventureHanger/1).
adventureHanger(99).
:- dynamic(secondHelp/1).
secondHelp(99).
:- dynamic(activateTrap/1).
activateTrap(99).
:- dynamic(infected/1).
infected(99).
:- dynamic(understanding/1).
understanding(99).

main:-
    sheet:createCharacter.

confirmBreakLine:-
    writeln(""),
    writeln("Pressione algum botao para continuar"),
    readInt(U),
    cls.

% Testado
introCity :-
    L = ['Em uma manha ensolarada, voce se encontra em Passagem de Duvik,',
	'uma pequena cidade situada em um dos pequenos vales que cruzam as Montanhas Serpente.',
	'Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros',
	'procurando descansar membros doloridos e afogar memorias ruins dentro de seus portoes.',
	'E voce nao e uma excecao. No entanto algo te parece estranho, a cidade parece bem vazia',
    'voce nao consegue encontrar, os inumeros animais que existiam ao redor da cidade.',
    ''],
    printeTela(L),
    confirmBreakLine,
    adventureClincher.

% Testado
adventureClincher :-
    L = ["Voce esta na praca principal da cidade e, percebe",
	"algumas pessoas que te chamam a atencao:",
    "",
	"- Um homem com roupas nobres, nao parece ser dessa cidade.",
	"- Um grupo de pessoas com manchas de carvao no rosto e bracos.",
    "- Alguns moradores que estao claramente abatidos."],
    
    printeTela(L),
    changeDirection.

% Testado (Obs no choiceHelp)
changeDirection:-
    A = ["", "Ao se aproximar dele, voce escuta:"," ",
    "Prefeito: Saudacoes. Eu sou o prefeito dessa cidade.",
    "Prefeito: muitos dos moradores da vila estao sofrendo de uma",
    "Prefeito: doenca extremamente letal. Nao pude deixar de notar",
    "Prefeito: que voce e um aventureiro, voce poderia nos ajudar",
    "Prefeito: a acabar com essa doenca? Por favor, muitos já",
    "Prefeito: morreram com essa praga."],

    B = ["","Voce nao demora muito pra perceber que eles sao mineradores",
    "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:",
    "",
    "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte.",
    "Minerador: voce parece forte. Por favor, acabe com esse mal!"],
    
    C = ["", "Voce encontra diversos moradores atonitos na vila.",
    "Uma das moradoras se aproxima de voce e diz:",
    "",
    "Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro",
    "Senhora: meus dois filhos ja foram pegaram praga. Eu imploro, por favor acabe com isso."],

    D = ["", "Isso nao e problema seu. voce ja tem problemas demais pra resolver.",
    "Esses camponeses conseguem resolver esse problema sozinho.",
    "Ao menos voce acha isso."],

    P = ["Qual deles voce ira se aproximar:",
    "1) O homem aparentemente rico.",
	"2) As pessoas sujas de carvao.",
	"3) Os moradores da cidade.",
    "4) Ninguem."],
    
    blankLine,
    printList(P),
    readInt(X),
    cls,
    
    (
    (X =:= 1, printeTela(A), assert(adventureHanger(1)), choiceHelp);
    (X =:= 2, printeTela(B), assert(adventureHanger(2)), choiceHelp);
    (X =:= 3, printeTela(C), assert(adventureHanger(3)), choiceHelp);
    (X =:= 4, printeTela(D), assert(adventureHanger(4)), confirmBreakLine,secondChance);
    (writeln("Opcao invalida."), changeDirection)
    ).

% Testado
choiceHelp:-
    blankLine,
    writeln("Voce ira ajudar?"),
    blankLine,

    getYesNo(X),

    (
    (X =:= 2, printeTela(["Com um olhar de desaprovacao, lentamente comecam a se afastar de voce."]), asserta(adventureHanger(4)),confirmBreakLine,secondChance);
    (printeTela(["Mal sei o que dizer. Muito obrigado!!"],confirmBreakLine,entradaMina))
    ).

blankLine:-
    writeln("").

secondChance:-
    Dial1 = ["","Uma pessoa se aproxima de voce, ela te parece familiar",
            "quando ela fica mais proxima, voce percebe que ela e um amigo de longa data, Meruen.",
            "Um guerreiro que costumava lutar com voce, alguns anos atrás.",
            "Ele está bem magro, comparado ao tempo que ele lutava com voce." ,
            "Ele se aproxima e diz: ",
            "",
            "Meruen: Há quanto tempo, amigo. Há algo de errado em uma mina proxima dessa regiao",
            "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo",
            "Meruen: e provável que ela esteja causando a praga que está assolando essa vila."],
    
    printeTela(Dial1),
    secondChanceChoice.

secondChanceChoice:-
    Dial1 = ["O que voce respondera pra ele:",
    "",
    "1) Voce poderia falar mais sobre essa praga?",
    "2) Voce esta bem?",
    "3) Ha alguma coisa em que eu possa ajudar?"],

    printList(Dial1),

    MeruenResponse1 = [ "",
                        "Meruen: Estao chamando por aqui de praga Carmesim, ela comeca de forma inofensiva",
                        "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana.",
                        "Meruen: Infelizmente eu acabei pegando essa doenca... Nao acho que tenho muitos dias...",
                        "Meruen: Eu te peco, por todos os nossos anos de aventura. Acabe com essa praga, por favor."], 

    MeruenResponse2 = ["",
                       "Meruen: Infelizmente eu acabei pegando essa praga... Nao acho que tenho muitos dias...",
                       "Meruen: Eu te peco, por todos os nossos anos de aventura. Acabe com essa praga, por favor."],

    MeruenResponse3 = ["",
                       "Meruen: Na verdade, tem. Eu acredito que se voce for pra essa mina. Deve haver uma forma de terminar",
                       "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Nao acho que tenho muitos dias...",
                       "Meruen: Entao, o que voce tem a dizer? voce poderia acabar com essa praga?"],
    
    readInt(Choice),

    (
    (Choice =:= 1, printeTela(MeruenResponse1));
    (Choice =:= 2, printeTela(MeruenResponse2));
    (Choice =:= 3, printeTela(MeruenResponse3));
    (writeln("Opçao invalida, tente novamente."), secondChanceChoice)
    ),

    blankLine,
    writeln("voce ira ajudar?"),
    blankLine,

    getYesNo(Answer),


    (
    (Answer =:= 1, printeTela(["Muito obrigado, sempre soube que podia contar com voce."]),confirmBreakLine,entradaMina);
    (Answer =:= 2, printeTela(["Voce é tao vazio quanto sua alma."]), asserta(secondHelp(0)),confirmBreakLine,firstEnding)   
    ).


firstEnding:-
    Dial = ["Conclusao",
            "",
            "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila.",
            "Duas semanas depois, em outra vila a procura de um artefato.",
            "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga.",
            "Aqueles que sobreviveram foram os que fugiram",
            "de Passagem de Duvik enquanto nao tinham sido contaminados",
            "A promissora cidade comerciante, se tornou apenas uma ruina",
            "uma promessa do que poderia se tornar."],
    
    printeTela(Dial).

entradaMina:-
    Dial1 = ["Entrada da caverna",
            "",
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
            "do tunel. Tochas queimadas estao espalhadas pelo chao,",
            "seus suportes quebrados nas paredes do tunel. Atras de",
            "voce, a estrada gasta conduz atraves dos precipicios para o",
            "vale abaixo. Alem do suave assobio do vento, um completo",
            "silencio preenche a abertura nas montanhas."],

    Dial2 = ["voce encontra um kobold, ele parece hostil",
             "E ira atacar voce! Prepare-se para o combate!"],

    printeTela(Dial1),
    confirmBreakLine,
    printeTela(Dial2),
    startBattle(1),
    confirmBreakLine,
    escolhaMina.

escolhaMina :-
    Dial = ["",
            "Voce permanece por um tempo em frente a entrada da caverna.",
            "Por um momento voce hesita em seguir em frente"],

    Opcoes = ["O que voce vai fazer?",
            "",
            "1) Tentar analisar com mais detalhes a entrada da caverna.",
            "2) Procurar por alguma coisa ao redor da entrada.",
            "3) Acender uma tocha e entrar na caverna."],

    printeTela(Dial),
    printList(Opcoes),
    readInt(Z),
    
    (
    (Z =:= 1, primeiraEscolhaEntrada);
    (Z =:= 2, segundaEscolhaEntrada);
    (Z =:= 3, analiseEntrada);
    (writeln("Opcao invalida."), escolhaMina)
    ),
    cavernReception.


analiseEntrada:-
    cls,
    Dial = ["Analisar as coisas e perda de tempo, seus inimigos nao tem",
            "uma chance contra voce mesmo... Voce acende uma tocha, respira",
            "fundo e entra na mina."],
    printList(Dial).

primeiraEscolhaEntrada:-
    cls,
    util:rollDice(20, D),
    Opcao1 = ["Ao analisar a entrada",
              "Voce percebe que os suportes de madeira do tunel",
              "estao lascados e despedacados, como se tivessem danificados",
              "em uma recente batalha.",
              "Voce tambem percebe que elas estao manchadas de sangue."],

    Opcao2 = ["Ao analisar a entrada",
              "Voce percebe que os suportes de madeira do tunel",
              "estao lascados e despedacados, como se tivessem danificados",
              "em uma recente batalha."],

    Opcao3 = ["Voce tenta analisar a entrada, porem nao consegue",
              "encontrar nada relevante na estrutura."],

    Dial = ["voce acende uma tocha e entra na caverna."],
    
    (
    (D >= 15, util:printList(Opcao1));
    (D >= 10, util:printList(Opcao2));
    (util:printList(Opcao3))
    ),

    util:printList(Dial),
    confirmBreakLine.



segundaEscolhaEntrada:-
    cls,
    util:rollDice(20, D),

    Opcao1 = ["Ao procurar ao redor da entrada",
              "No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!",
              "No entanto, voce nao encontrou nada que pode ser util para entender",
              "o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna."],

    Opcao2 = ["Ao procurar ao redor da entrada",
              "No meio as picaretas e pás quebradas, voce encontra duas pocoes de vida!",
              "Possivelmente elas serao uteis... Voce tambem encontra um simbolo",
              "associados a kobolds, pequenas criaturas que sao conhecidas por serem",
              "saqueadores. E provavel que tenha havido um combate por aqui. voce",
              "acende uma tocha e entra na caverna com atencao redobrada."],

    Opcao3 = ["Ao procurar ao redor da entrada",
              "Voce buscar por alguns minutos, no entanto, voce nao encontra",
              "nada relevante pra voce.",
              "voce acende uma tocha e entra na caverna."],
    
    (
    (D >= 15, printList(Opcao2));
    (D >= 10, printList(Opcao1));
    (printList(Opcao3))
    ),
    
    confirmBreakLine.

cavernReception:-
    Dial = ["O tunel se abre em uma camara pequena e aproximadamente",
            "regular. Pedacos espalhados de minerio de prata cercam",
            "um par de carrocas de madeira. A parte de baixo do que",
            "aparenta ser um corpo humano se sobressai debaixo de uma",
            "das carrocas. E nao mostra nenhum sinal de movimento.",
            "Sangue seco mancha a parede norte em varios locais.",
            "Há uma saida para o oeste",
            ""],
    
    printList(Dial),
    receptionChoice.

receptionChoice:-
    Opcao = ["O que voce vai fazer? (digite um numero)",
            "1) Analisar o corpo da carroca.",
            "2) Seguir em frente."],
    printList(Opcao),
    readInt(N),
    
    (
    (N =:= 1, checkWagon1);
    (N =:= 2, checkWagon2);
    (checkWagon3)
    ),

    receptionConclusion.


receptionConclusion:-
    Dial = ["Apos passar da carroca, voce so ve uma grande porta a sua frente.",
    "Voce nao ve outra opcao a nao ser entrar nela.", ""],
    printList(Dial).


checkWagon1:-
    cls,
    util:rollDice(20, D),
    Opcao1 = ["Voce escuta um barulho de",
            "mecanismos, voce rapidamente entende que e uma armadilha",
            "e salta para tras, conseguindo desviar do ataque sonico",
            "produzido pela mesma."],

    Opcao2 = ["Voce escuta um barulho de",
            "mecanismos, e uma armadilha que produz um som ensurdecedor",
            "que deixa voce temporariamente surdo."],
    
    (
    (D >= 12, printList(Opcao1));
    (printList(Opcao2), asserta(activateTrap(1)))),

    wagonDescription.

checkWagon2:-
    cls,
    Dial = ["Voce prefere nao se arriscar e mexer nesse corpo.",
            "e quase certo que havia alguma armadilha ali. Seria uma coin-",
            "cidencia muito grande tantos minerios de prata espalhados uniformemente."],
    printList(DiaL).

checkWagon3:-

    cls,
    Dial = ["", "Opcao invalida!"],
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
    (printList(Dial2))),
    cls.


koboldsCombatConversation:-
    util:rollDice(20, D),
    
    ((D >= 10,koboldsCombatChoice);
    (startBattleKobolds)).

koboldsCombatChoice:-
    cls,
    Opcao1 = ["Ao comecar a falar, os kobolds apesar de receiosos",
    "resolvem escutar o que voce tem a dizer",
    "O que voce ira dizer para eles?",
    "1) Nao precisamos brigar. Nenhum de nos quer isso! (Diplomacia)",
    "2) Nao ousem me atacar se quiserem continuar vivos. (Intimidacao)"],

    blankLine,
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
            "Capitao: Nao temos forca pra lutar, doenca enfraquecer e matar",
            "Capitao amigos. Humano pode seguir em frente."],

    DialOp2 = ["Os kobolds parecem, de fato, ficarem intimidados com voce.",
               "O que parece o capitao daquele pequeno grupo fala:",
               "Capitao: Tudo bem, humano pode passar. So nao nos mate, por favor."],

    blankLine,
    
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
              "e que os kobolds estao muito nervosos e gostariam de deixar as",
              "minas o mais rápido possivel. Infelizmente, seu comandante",
              "determinou que eles devem permanecer por mais um tempo."],

    Opcao2 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. O que voce entende da conversa",
              "e que algum tipo de criatura tem roubado os mortos de seu",
              "acampamento enquanto eles dormem. A maioria dos humanos",
              "já foram roubados e ate mesmo alguns cadáveres de kobolds",
              "se perderam."],

    Opcao3 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. Voce consegue entender bastante da",
              "conversa, o mais importante que voce escuta e que",
              "deve haver alguma maldicao nesta mina. Metade do seu bando",
              "já morreu de estranhas febres ou de uma tosse horrivel."],

    Opcao4 = ["Voce consegue reconhecer que sao kobolds pelo idioma que",
              "estao falando, draconico. Porem, nao consegue enteder quase",
              "nada. No entanto, voce percebe que os kobolds estao nervosos",
              "pelo tom de voz."],
    
    (
    (D >= 16, printList(Opcao3));
    (D >= 12, printList(Opcao2));
    (D >= 8, printList(Opcao1));
    (printList(Opcao4))
    ).

startBattleKobolds:-
    cls,
    Dial = ["O que parece ser o capitao daquele pequeno grupo fala:",
            "Capitao: Nao importa o que humano fale, voce morre agora!"],
    printList(Dial),
    confirmBreakLine.
    % comecar batalha.

refectoryCavern:-

    Opcao = ["Ter ativado a armadilha atraiu muito a atencao daqueles que",
            "estao dentro da caverna, inclusive os kobolds dentro dessa sala.",
            "Voce escuta muitos gritos e passos, voce imagina que eles estao",
            "se preparando para um combate. Ao abrir a porta voce ve o seguinte:"],

    Dial = ["Uma sala larga e quadrada abriga quatro longas mesas de",
            "madeira, cada uma com um banco de cada lado. Em cima",
            "das mesas estao um numero de tigelas de madeira e talheres.",
            "No canto sudeste da sala, um pequeno caldeirao fumega",
            "sobre um fogao cravado no chao. Um cheiro pungente esta",
            "suspenso no ar. ",
            "Voce tambem exerga tres kobolds apontando armas para voce.",
            ""],
    
    ((activateTrap(1), printList(Opcao));
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
    cls,
    Dial = ["Voce imediatamente comeca a preparar o seu ataque enquanto",
            "os kobolds correm em direcao a voce."],
    printList(Dial).
    % Inicia combate

pantryCavern:-
    util:rollDice(20, D),
    Dial1 = ["Uma porta de madeira fechada barra a entrada para essa",
            "sala. Ao abrir porta voce observa que esta sala longa",
            "e estreita possui fileiras de estantes carregadas",
            "de alimentos e outros suprimentos. Pesados sacos",
            "de estopa estao empilhados ate o teto no canto",
            "oposto da camara. Uns poucos rasgados, espalhando",
            "aveia e farinha no chao. Muitos barris estao",
            "agrupados proximos à parede norte.",
            "Ao entrar na sala, uma armadilha e ativada!",
            "Uma flecha e lancada em sua direcao."],
    
    printList(Dial1),
    confirmBreakLine,

    
    Opcao11 = ["Por sorte, a armadilha nao te acerta."],
    
    Opcao12 = ["A flecha perfura o seu ombro. Causando",
    "um ferimento moderado."],
    
    (
    (D >= 11, printList(Opcao11));
    (printList(Opcao12))
    ),

    confirmBreakLine,

    Dial2 = ["A armadilha chama a atencao de uma criatura",
            "que estava em um barril e ela ira atacar voce.",
            "Essas criatura e um rato, no entanto, bem maior",
            "que o normal, e voce tem a impressao que pode pegar",
            "a praga lutando com ela."],

    printList(Dial2),
    % Inicia batalha.

    util:rollDice(20, R),

    Opcao21 = ["Apesar do contato com os ratos, voce consegue",
              "resistir a praga."],

    Opcao22 = ["Apos o combate, voce sente que algo está errado...",
               "voce está se sentindo um pouco mais fraco, talvez",
               "voce tenha contraido a praga."],
    
    (
    (R >= 11, printList(Opcao21));
    (printList(Opcao22), asserta(infected(1)))    
    ),

    confirmBreakLine,

    Dial3 = ["Em um dos barris, voce encontra duas pocoes de vida",
            "e duas pocoes de mana, naturalmente voce guarda elas.",
            "Elas podem ser bastante uteis no futuro."],
    
    printList(Dial3),
    % Adicionar item 2
    % Adicionar item 2
    % Adicionar item 4
    % Adicionar item 4

    Dial4 = ["Apos os achados, voce comeca a descer uma rampa que",
            "leva a uma parte inferior da caverna. Aos poucos ",
            "ela vai ficando muito ingrime, a um ponto que te",
            "faz perder o equilibrio e descer o resto da rampa",
            "deslizando a mesma."],
    
    confirmBreakLine,
    printList(Dial4).

rampCavern:-
    confirmBreakLine,
    Dial1 = ["Apos descer a rampa e chegar no fundo da caverna",
            "voce olha que esta caverna enorme se estende",
            "para cima ate pelo menos 30 m, subindo alto para",
            "dentro das entranhas da montanha. A iluminacao",
            "ocasionalmente reflete pequenos graos prateados,",
            "que brilham na face parede oeste da caverna.",
            "Muitos cabos estao pendurados na beirada de um",
            "largo vazio na parede. O buraco penetra a face",
            "oeste da caverna e comeca a cerca de 6 m de",
            "onde voce está. O ar aqui e mais frio e umido.",
            "De repente, voce escuta vários passos. Nao de",
            "humanoides, mas de um animal. Um imenso",
            "lobo aparece por trás de algumas pedras e",
            "comeca a te cercar, e ele vai te atacar!"],

    printList(Dial1),
    % Inicia batalha.

    Dial2 = ["",
            "Apos o combate, voce percebe que pode escalar",
            "aqueles cabos pendurados. No entanto, tambem",
            "existe um tunel à frente"],
    
    printList(Dial2),
    rampChoice.


rampChoice:-
    Choices = ["",
        "O que voce vai fazer?",
        "1) Escalar os cabos",
        "2) Seguir em frente"],
    
    printList(Choices),
    readInt(Z),
    
    (
    (Z =:= 1, rampProgress1);
    (Z =:= 2, rampProgress2);
    (writeln("Opcao inválida, tente novamente"), rampChoice())
    ).

rampProgress1:-
    cls,
    util:rollDice(20, R),

    Opcao1 = ["Apos escalar os cabos, voce sobe em uma",
              "pedra e exerga uma passagem para o que",
              "parece um acampamento, voce consegue",
              "exergar que existem muitos tesouros",
              "lá dentro."],

    Opcao2 = ["voce escala os cabos, mas devido ao escuro,",
              "voce nao consegue enxergar nada. Sua unica",
              "opcao e voltar e seguir o outro caminho."],
    
    (
    (R >= 5, printList(Opcao1), secretCamp);
    (printList(Opcao2))
    ).



rampProgress2:-
    Dial = ["voce prefere nao se arriscar escalando esses",
            "cabos. e mais sensato manter o foco e seguir",
            "o caminho."],
    
    cls,
    printList(Dial).


secretCamp:-
    confirmBreakLine,
    Dial = ["Ao entrar na passagem, voce encontra o acampa-",
            "mento dos Kobolds, usado como área de estoque",
            "e dormitorio. voce encontra um bau e dois",
            "jovens Kobolds, que estao olhando para voce",
            "e estao amedrontados. Um deles utiliza um capuz",
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
    (writeln("Opcao inválida, tente novamente."), secretCampChoice)
    ).

secretCampDecision1:-
    cls,
    Dial = ["Para voce, a capa e mais valiosa que a vida",
            "deles. voce os mata sem remorso e pega a",
            "capa deles, com um pouco de investigacao",
            "voce descobre que e uma capa da protecao.",
            "Logo apos, voce desce os cabos E segue o outro caminho."],

    % addItem 42

    printList(Dial).

secretCampDecision2:-
    cls,
    Dial = ["voce poupa a vida deles, afinal, eles nao",
            "fizeram absolutamente nada. Simplesmente nao",
            "seria justo. voce pega tres pocoes de vida",
            "e duas de mana. Logo apos, voce desce os cabos",
            "E segue o outro caminho."],
    
    printList(Dial).
    % addItem 2
    % addItem 2 
    % addItem 2 
    % addItem 4 
    % addItem 4 

situacionGettingWorst:-
    Dial = ["A leve fraqueza que voce estava sentindo",
    "está demasiadamente pior, voce já sente","um pouco de dificuldade em movimentos",
    "bruscos ou que precisam de forca. No entanto,","voce continua determinado a acabar com esse","problema."],

    % Reduzir vitalidade.
    printList(Dial).

corpsesGrave:-
    Dial1 = ["Voce passa pelo tunel. Ondas de calor banham",
            "respiracao dificil. Esta caverna pequena e",
            "em forma de tigela possui o chao cheio de",
            "cadáveres humanoides. A abertura de um tunel",
            "e visivel na parede leste da camara",
            "e, na distancia, o som de agua corrente",
            "pode ser ouvido."],

    Opcao1 = ["Voce acredita que aqui seja o fosso da criacao",
              "da praga. Sejá la quem for que está fazendo",
              "isso, nao deve ficar longe de onde voce está."],

    Opcao2 = ["Um zumbi se levanta de um dos montes",
              "de corpos! Prepare-se para o combate!"],

    Dial2 = ["Algo dentro de voce diz que isso esta perto",
            "de acabar. Ao calmo som de agua corrente. voce",
            "entra no estreito tunel a leste."],
    
    printList(Dial1),
    confirmBreakLine,
    printList(Opcao1),
    confirmBreakLine,
    printList(Opcao2),
    confirmBreakLine,
    % iniciaBatalha,
    printList(Dial2),
    confirmBreakLine.


jakkEnding:-
    L = ["Ao entrar, nessa parte da caverna, voce observa um",
        "unico pilar irregular, de pedra e cheio de um musgo",
        "A agua cai pelas suas laterais de uma fonte",
        "proxima ao seu topo, cascateando ate a lagoa abaixo.",
        "A lagoa alimenta uma larga correnteza que flui rapidamente",
        "ao longo da extensao da sala e entao por baixo da parede de",
        "pedra na extremidade sul da caverna. Muitos simbolos estao",
        "entalhados profundamente na face de pedra do pilar, suas",
        "linhas apenas visiveis por baixo da luz do musgo. Uma",
        "sensacao estranha de desconforto impregna este lugar."],
    
    printList(L),
    util:rollDice(20, R),

    A = ["Os simbolos entalhados aqui estao escritos",
        "no idioma orc e servem como uma suplica a",
        "Gruumsh (o deus dos orcs) para destruir",
        "os inimigos com uma terrivel pestilencia.",
        "Eles tambem recontam a historia das minas e o destino",
        "do cla Garra Despedacante."],

    B = ["No centro, voce percebe uma imponente presenca",
        "Um grande orc, com uma armadura de metal e uma",
        "clava de aco na mao direita."],
    
    (
    (R >= 8), printList(A), asserta(understanding(1));
    printList(B)
    ),

    jakkFirstChoice.

jakkFirstChoice:-
    A = ["O que voce vai fazer", 
        "1) Tentar conversar com ele.",
        "2) Atacar imediatamente."],
    
    printList(A),
    readInt(Choice),
    (
    (Choice =:= 1, jakkConversation1);
    (Choice =:= 2, jakkStartBattle);
    (writeln("Opcao invalida! Escolha novamente"), jakkFirstChoice)    
    ).

jakkStartBattle:-
    A = ["O Orc prepara sua arma enquanto voce corre","em sua direcao."],

    cls,
    printList(A),
    confirmBreakLine,
    % Inicia batalha
    printViolentEnding.

jakkConversation1:-
    cls,
    Dial1 = ["Jakk: Meu nome e Jakk, o que voce quer? Voce",
    "Jakk: se arricou muito para chegar aqui.","Jakk: Que tolice.", ""],

    printList(Dial1),

    Dial2 = ["O que voce ira responder?", 
    "1) O que voce sabe sobre a praga?",
    "2) Eu tenho a cura, me mate e voce nunca a obtera.(Enganacao)",
    "3) Nao importa o que voce sabe, eu vim aqui para lutar com voce"],

    printList(Dial2),

    Opcao1 = ["Jakk: Eu que criei e estou matendo essa praga.",
        "Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Portanto, cuspa logo o que voce quer ou lute comigo!"],

    Opcao2 = ["Jakk: Pare de mentir, humano insolente!","Jakk: Eu que criei e estou mantendo essa praga.",
        "Jakk: Eu enfeiticei a agua para causar essa doenca.","Jakk: Entao cuspa logo o que voce quer ou lute comigo!"],

    Opcao3 = ["Jakk: Voce nao tem uma chance, seu verme."],

    readInt(Choice),
    cls,

    (
    (Choice =:= 1, printList(Opcao1), jakkConversation2);
    (Choice =:= 2, printList(Opcao2), jakkConversation2);
    (Choice =:= 3, printList(Opcao3), jakkStartBattle);
    (writeln("Opcao invalida, escolha novamente"), jakkConversation1)    
    ).

jakkConversation2:-
    Dial3 = ["O que voce ira responder?", 
            "1) Por que esta fazendo isso?",
            "2) Entao eu tenho o dever de para-lo."],
    
    printList(Dial3),
    readInt(Choice),
    cls,

    Dial4 = ["Jakk: 10 anos atras, o povo de Passagem de Duvik quase",
        "Jakk: exterminou o meu cla, o cla Garra Despedacante, pois","Jakk: achavam que nos eramos uma ameaca. Eles nao quiseram",
        "Jakk: ter nenhuma forma de conversa. Essa e a vinganca","Jakk: do meu cla."],

    Dial5 = ["Jakk: e hora de morrer, seu verme insolente!"],

    (
    (Choice =:= 1, printList(Dial4), jakkConversation3);
    (Choice =:= 2, printList(Dial5), jakkStartBattle);
    (writeln("Opcao invalida, escolha novamente"), jakkConversation2)    
    ).

jakkConversation3:-
    Dial6 = ["O que voce ira responder?",
    "1) Matando eles voce fica tao errado quanto aquelesque mataram o seu cla. Voce nao combate odio com odio.",
    "2) Voce esta matando ainda mais pessoas do seu cla. Voce nao viu a quantidade de kobolds mortos?",
    "Pare com isso, todos os seus soldados querem sair daqui e esquecer.",
    "3) Isso nao justifica os seus erros. Voce morrera agora!"],

    Dial7 = ["Jakk: O que voce sabe sobre meu cla? Voce nao sabe o que",
        "Jakk: esta falando... Voce nao sabe o quanto meu cla sofreu.","Jakk: Pare de falar sobre o que voce nao tem ideia."],

    Opcao3 = ["Jakk parece um pouco relutante.","Jakk: Eu sei, eu sou o que mais sofro com isso. No entanto,",
        "Jakk: todos eles concordaram com isso, eu tenho que valorizar","Jakk: as mortes daqueles que se sacrificaram pela causa!"],

    printList(Dial6),
    readInt(Choice),
    cls,

    (
    (Choice =:= 1, printList(Dial7), jakkConversation4);
    (Choice =:= 2, printList(Opcao3), jakkConversation4);
    (Choice =:= 3, jakkStartBattle);
    (writeln("Opcao invalida, escolha novamente"), jakkConversation3)    
    ).

jakkConversation4:-
    util:rollDice(20, CheckCharism),

    Interpretou = ["O que voce ira responder?",
        "1) Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
        "2) Seja um pouco racional... Isso nao trara alegria a ninguem.",
        "3) Eu tenho certeza que a vontade de Gruumsh eh que isso acabe pacificamente."],

    NInterpretou = ["O que voce ira responder?",
        "1) Jakk, esqueca isso... Voce salvara a vida de muitas Pessoas do seu cla, desistindo disso.",
        "2) Seja um pouco racional... Isso nao trara alegria a ninguem."],

    (
    (understanding(1), printList(Interpretou));
    (printList(NInterpretou))    
    ),

    SolucaoJakk1 = ["Jakk: e verdade... Meu povo está sofrendo demais com isso.",
        "Jakk: Eu vou quebrar o feitico imediatamente. Obrigado por","Jakk: trazer razao ao meu pensamento, humano."],

    SolucaoJakk2 = ["Jakk: Voce tem toda a razao... O que eu estava pensando?",
        "Jakk: Eu vou quebrar o feitico imediatamente. Obrigado","Jakk: por trazer sensatez, humano."],

    SolucaoJakk3 = ["Jakk: Voce parece sensato, mas tenho que honrar meu cla",
        "Jakk: e hora de lutar, humano."],
    
    readInt(Choice),
    cls,
    
    (
    ((Choice =:= 1; Choice =:= 2), CheckCharism >= 10, printList(SolucaoJakk1), printPacificEnding);
    (Choice =:= 3, understanding(1), printList(SolucaoJakk2), printPacificEnding);
    ((Choice =\= 1, Choice =\= 2), writeln("Opcao invalida, escolha novamente"), jakkConversation4);
    (printList(SolucaoJakk3), jakkStartBattle)    
    ).
    
    

printViolentEnding:-
    cls,
    Dial1 = ["Extremamente abatido, Jakk fala baixo:",
        "Jakk: Eu apenas queria vingar o meu cla...",
        "Jakk: Infelizmente eu acho que o mal prevaleceu...",
        "Jakk, solta sua maca, e cai no chao."],
    
    printList(Dial1),

    Dial2 = ["Derrotar Jakk já possui um efeito visivel imediato",
            "nas aguas da nascente, que comeca a ficar limpa da sujeira",
            "da Febre logo apos sua morte. Os sintomas",
            "da Febre que afetam as pessoas de Passagem de Duvik",
            "comecaram a diminuir. E a ordem voltou a reinar na cidade."],
    
    printList(Dial2).

printVillageFuture:-
    Dial = ["Lentamente, Passagem de Duvik comecou a se",
            "reestruturar e a prosperar novamente. Alguns",
            "anos depois, Passagem de Duvik se tornou uma das maiores",
            "e ricas cidades do reino. No centro dela, há uma estatua sua,",
            "para relembrar quem tornou o sucesso dessa cidade possivel!"],
    
    printList(Dial).

printPacificEnding:-
    confirmBreakLine,
    Dial = ["Apos convencer Jakk a terminar a maldicao. A agua",
            "amaldicoada, que servia como abastecimento de Passagem",
            "de Duvik, foi aos poucos sendo purificada. Os sintomas",
            "da Febre que afetam as pessoas de Passagem de Duvik",
            "comecaram a diminuir. E a ordem voltou a reinar na cidade."],
    
    printList(Dial).

printDefeatEnding:-
    Dial = ["Apesar dos seus esforcos, voce nao conseguiu derrotar Jakk.",
            "Portanto, voce nao conseguiu acabar com o mal da praga.",
            "Todos de Passagem de Duvik pereceram à doenca, e a promissora cidade",
            "comerciante, virou apenas uma promessa do que poderia ser..."],
    
    printList(Dial).

printVariantEnding_A:-
    confirmBreakLine,
    Dial = ["O prefeito se aproxima de voce e fala:",
            "Prefeito: Eu so tenho a agradecer a voce, nobre aventureiro",
            "Prefeito: Voce salvou a vida de quase todos da cidade!",
            "Prefeito: Aqui estao 500 pecas de ouro como recompensa",
            "Prefeito: pelo seu feito. Sempre que voce voltar,",
            "Prefeito: tenha a certeza que voce será sempre bem recebido",
            "Prefeito: aqui!"],
    
    printList(Dial).

printVariantEnding_B:-
    confirmBreakLine,
    Dial = ["O minerador que falou com voce anteriormente, se aproxima",
            "e com um grande sorriso grita:",
            "Minerador: Eu sabia! Eu sabia que voce conseguiria!",
            "Minerador: Voce salvou a vida de todos da cidade. E nos",
            "Minerador: somos extremamente gratos a voce! Eu nao tenho",
            "Minerador: muito, mas aqui está o que eu tenho, 500 pecas",
            "Minerador: de ouro.",
            "Minerador: Ei! Sempre que vir aqui, minha casa sempre estará",
            "Minerador: de portas abertas! Nos nao esqueceremos de voce."],
    
    printList(Dial).

printVariantEnding_C:-
    confirmBreakLine,
    Dial = ["A camponesa que falou com voce anteriormente, se aproxima",
            "e com um grande sorriso fala:",
            "Camponesa: Voce conseguiu! Meus filhos e os outros moradores",
            "Camponesa: já estao melhorando e tudo isso gracas a voce!",
            "Camponesa: Nao me esquecerei do que voce fez aqui!",
            "Camponesa: Aqui estao 500 pecas de ouro por tudo, que voce",
            "Camponesa: fez. Nos da vila nos juntamos para pode pagar",
            "Camponesa: a voce!",
            "Camponesa: Volte aqui de vez em quando! Tenho certeza",
            "Camponesa: que todos daqui adorariam te ver novamente!"],
    
    printList(Dial).

printVariantEnding_Else:-
    confirmBreakLine,
    Dial = ["Meruen, o seu amigo que requisitou a missao, se aproxima",
            "e diz:",
            "Meruen: Eu tinha certeza que voce conseguiria",
            "Meruen: voce nao so salvou minha vida como a de quase",
            "Meruen: todos daqui da vila. Somos todos muito gratos",
            "Meruen: a voce. Aqui estao 500 pecas de ouro, como uma",
            "Meruen: forma de agradadecimento. Por fim, volte",
            "Meruen: aqui de vez em quando. Seria muito bom",
            "Meruen: te ver novamente!"],
    
    printList(Dial).

printEnding:-
    printVillageFuture,
    
    (
    (adventureHanger(1), printVariantEnding_A);
    (adventureHanger(2), printVariantEnding_B);
    (adventureHanger(3), printVariantEnding_C);
    (adventureHanger(4), printVariantEnding_Else)
    ),

    printCredits.

printCredits:-
    confirmBreakLine,
    Creditos = ["Obrigado por jogar: A Praga Carmesim!",
                "Sistema inspirado: Dungeons and Dragons, quinta edicao.",
                "",
                "Feito por:",
                "Jadson Luan",
                "Jesse Souza",
                "Lucas de Medeiros",
                "Mikael Brasileiro",
                "",
                "Existem mais finais para serem desbravados, tente conseguir outro jogando novamente!"],
    
    printList(Creditos).

onceUponATime:-
    introCity,
    adventureClincher,

    (
    (adventureHanger(4), secondChance);
    (asserta(secondHelp(1)))    
    ),

    (
    (secondHelp(0), firstEnding, printCredits);
    (entradaMina, refectoryCavern, pantryCavern, rampCavern, corpsesGrave, jakkEnding, printEnding)
    ).