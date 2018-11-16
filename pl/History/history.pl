%:- ['../util'].

:- dynamic(adventureHanger/1).

printList([]) :-
    write("").

printList([Head| Tail]) :-
    writeln(Head),
    printList(Tail).

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
    read(),
    
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
    printList(D))),

    writeln(""),
    writeln("Você irá ajudar? (Digite s ou n)"),
    writeln(""),

    get(Z),
    ((Z =\= 115,
    writeln("Com um olhar de desaprovação, lentamente começam a se afastar de você."));
    (writeln("Mal sei o que dizer. Muito obrigado!!"))).