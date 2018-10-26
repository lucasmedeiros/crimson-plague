module GameStory.Story (
	getYesNo,
	adventureClincher,
	secondChance
) where

import Util
import Battles.Battle
import CharInfo.Sheet

-- algumas constantes para evitar números mágicos
d20 :: Int
d20 = 20

jakkPos :: Int
jakkPos = 6
-- Fim da declaração de constantes.

getYesNo :: IO String
getYesNo = do
	putStrLn "O que você irá responder? "
	putStrLn "Sim (digite s)"
	putStrLn "Não (digite n)"
	option <- getLine
	return $ (read $ show option :: String)

introCity :: IO()
introCity = do
	putStrLn "Uma manhã ensolarada, você se encontra em Passagem de Duvik, uma pequena cidade"
	putStrLn "situada em um dos pequenos vales que cruzam as Montanhas Serpente."
	putStrLn "Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros"
	putStrLn "procurando descansar membros doloridos e afogar memórias ruins dentro de seus portões."
	putStrLn "E você não é uma exceção. No entanto algo te parece estranho, a cidade parece bem vazia"
	putStrLn "Você não consegue encontrar, os inúmeros animais que existiam ao redor da cidade."

adventureClincher :: IO Char
adventureClincher = do
	clearScreen
	putStrLn "Você está na praça principal da cidade e, percebe"
	putStrLn "algumas pessoas que te chamam a atenção:"
	putStrLn "Um homem com roupas nobres, não parece ser dessa cidade."
	putStrLn "Um grupo de pessoas com manchas de carvão no rosto e braços."
	putStrLn "Alguns moradores que estão claramente abatidos."
	putStrLn ""
	clearScreen
	putStrLn "Qual deles voce ira se aproximar:"
	putStrLn "1 - O homem aparentemente rico."
	putStrLn "2 - As pessoas sujas de carvao."
	putStrLn "3 - Os moradores da cidade."
	putStrLn "4 - Ninguem."
	putStrLn ""
	option <- Util.getOption
	changeDirection option

changeDirection :: Int -> IO Char
changeDirection 1 = clincherChoice1
changeDirection 2 = clincherChoice2
changeDirection 3 = clincherChoice3
changeDirection 4 = clincherChoice4
changeDirection n = errorMessage

errorMessage :: IO Char
errorMessage = do
	putStrLn "Opção inválida. Tente novamente!"
	clearScreen
	adventureClincher

answerMessage1 :: IO ()
answerMessage1 = do
    answer <- getYesNo
    if (answer == "s")
		then do
			putStrLn "Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina."
			putStrLn "Meruen: Muito obrigado, amigo."
	else do
		putStrLn "Meruen: Você é tão vazio quanto sua alma."
		putStrLn "Meruen se afasta lentamente de você."

answerMessage2 :: IO ()
answerMessage2 = do
	answer <- getYesNo
	if (answer == "s")
		then do
			putStrLn "Mal sei o que dizer. Muito obrigado!!"
	else do
		putStrLn "Com um olhar de desaprovação, lentamente começam a se afastar de você."

clincherChoice1 :: IO Char
clincherChoice1 = do
	clearScreen
	putStrLn "Ao se aproximar dele, voce escuta:"
	putStrLn "Prefeito: Saudações. Eu sou o prefeito dessa cidade."
	putStrLn "Prefeito: muitos dos moradores da vila estão sofrendo de uma"
	putStrLn "Prefeito: doenca extremamente letal. Não pude deixar de notar"
	putStrLn "Prefeito: que você é um aventureiro, você poderia nos ajudar"
	putStrLn "Prefeito: a acabar com essa doença? Por favor, muitos já"
	putStrLn "Prefeito: morreram com essa praga."
	answerMessage1
	return 'a'

clincherChoice2 :: IO Char
clincherChoice2 = do
	clearScreen
	putStrLn "Você nao demora muito pra perceber que eles sao mineradores"
	putStrLn "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:"
	putStrLn "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte."
	putStrLn "Minerador: voce parece forte. Por favor, acabe com esse mal!"
	answerMessage1
	return 'b'

clincherChoice3 :: IO Char
clincherChoice3 = do
	clearScreen
	putStrLn "Voce encontra diversos moradores atonitos na vila."
	putStrLn "Uma das moradoras se aproxima de voce e diz:"
	putStrLn "Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro"
	putStrLn "Senhora: meus dois filhos ja foram pegaram praga. Eu imploro, por favor acabe com isso."
	putStrLn "O que voce respondera pra ela:"
	putStrLn "1 - Voce poderia falar mais sobre essa praga?"
	putStrLn "2 - Onde eu posso acabar com isso?"
	option <- getLine
	clearScreen
	if (option == "1")
		then do
			 putStrLn "Senhora: Chamam de praga Carmesim, ela começa de forma inofensiva."
			 putStrLn "Senhora: Porem, aos poucos ela vai ficando pior. Cada vez mais roubando a sua forca."
			 putStrLn "Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca."
			 putStrLn "Senhora: Fazem quatro dias que meus filhos estao doentes..."
			 putStrLn "Ela comeca a chorar. Solucando um pouco, ela diz:"
			 putStrLn "Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la. Por favor, me ajude..."
	else do
		putStrLn "Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la."
		putStrLn "Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca."
		putStrLn "Senhora: Fazem quatro dias que meus filhos estao doentes..."
		putStrLn "Senhora: Eu nao sei quanto tempo eles ainda podem aguentar... Por favor, acabe com essa praga."
		putStrLn "Apesar de tentar disfaçar, você percebe que ela começa a chorar."
	answerMessage1
	return 'c'

clincherChoice4 :: IO Char
clincherChoice4 = do
	clearScreen
	putStrLn "Isso não é problema seu. Você já tem problemas demais pra resolver."
	putStrLn "Esses camponeses conseguem resolver esse problema sozinho."
	putStrLn "Ao menos você acha isso."
	return 'd'

secondChance :: IO ()
secondChance = do
    clearScreen
    putStrLn "Uma pessoa se aproxima de você, ela te parece familiar"
    putStrLn "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen."
    putStrLn "Um guerreiro que costumava lutar com você, alguns anos atrás."
    putStrLn "Ele está bem magro, comparado ao tempo que ele lutava com você."
    putStrLn "Ele se aproxima e diz: "
    putStrLn "Meruen: Há quanto tempo, amigo. Há algo de errado em uma mina próxima dessa região"
    putStrLn "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo"
    putStrLn "Meruen: é provável que ela esteja causando a praga que está assolando essa vila."
    putStrLn "O que voce respondera pra ele:"
    putStrLn "1 - Voce poderia falar mais sobre essa praga?"
    putStrLn "2 - Voce esta bem?"
    putStrLn "3 - Ha alguma coisa em que eu possa ajudar?"
    option <- getLine
    clearScreen
    putStrLn "Meruen responde: "
    if (option == "1")
        then do
            putStrLn "Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva"
            putStrLn "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana."
            putStrLn "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias..."
            putStrLn "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."
    else if (option == "2")
        then do
            putStrLn "Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..."
            putStrLn "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."
    else do
        putStrLn "Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar"
        putStrLn "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..."
        putStrLn "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?"
    answerMessage2

firstEnding :: IO()
firstEnding = do
    clearScreen
    putStrLn "Conclusao"
    putStrLn "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila."
    putStrLn "Duas semanas depois, em outra vila a procura de um artefato."
    putStrLn "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga."
    putStrLn "Aqueles que sobreviveram foram os que fugiram"
    putStrLn "de Passagem de Duvik enquanto nao tinham sido contaminados"
    putStrLn "A promissora cidade comerciante, se tornou apenas uma ruina"
    putStrLn "uma promessa do que poderia se tornar."
    skip

entradaMina :: IO()
entradaMina = do
	clearScreen
	putStrLn "Entrada da caverna"
	putStrLn "Apos algumas horas de caminhada, voce chega na caverna."
	putStrLn "Uma brisa fria desce dos picos da Montanha Serpente"
	putStrLn "Enrolada enquanto voce contempla a entrada para as"
	putStrLn "cavernas. O chao coberto de neve esta cheio de ferramentas,"
	putStrLn "picaretas e pas, muitas das quais sobressaindo dos montes"
	putStrLn "de neve. Um unico corredor escuro conduz as profundezas"
	putStrLn "da mina a frente. O caminho de terra abaixo, que possui"
	putStrLn "estruturas de suporte de madeira, esta coberto com escombros"
	putStrLn "de pedra, uns pedacos ocasionalmente brilham com o menor"
	putStrLn "pedaco de minerio. Nenhuma luz lanca-se para fora"
	putStrLn "do tunel. Tochas queimadas estão espalhadas pelo chao,"
	putStrLn "seus suportes quebrados nas paredes do tunel. Atras de"
	putStrLn "voce, a estrada gasta conduz atraves dos precipicios para o"
	putStrLn "vale abaixo. Alem do suave assobio do vento, um completo"
	putStrLn "silencio preenche a abertura nas montanhas."
	skip
	putStrLn "Você encontra um kobolds, ele parece hostil"
	putStrLn "E irá atacar você! Prepare-se para o combate!"

	--inicia batalha

	putStrLn "Voce permanece por um tempo em frente a entrada"
	putStrLn "Por um momento voce hesita em seguir em frente"
	putStrLn "O que voce vai fazer?"
	skip
	putStrLn "a) Tentar analisar com mais detalhes a entrada da caverna."
	putStrLn "b) Procurar por alguma coisa ao redor da entrada."
	putStrLn "c) Acender uma tocha e entrar na caverna."

	resposta <- getLine

	analiseEntrada resposta

	clearScreen

analiseEntrada :: String -> IO()
analiseEntrada "a" = primeiraEscolhaEntrada
analiseEntrada "b" = segundaEscolhaEntrada
analiseEntrada "c" = do
	putStrLn "Analisar as coisas é perda de tempo, seus inimigos não tem"
	putStrLn "uma chance contra você mesmo... Voce acende uma tocha, respira"
	putStrLn "fundo e entra na mina."

primeiraEscolhaEntrada :: IO()
primeiraEscolhaEntrada = do

	dadoObservar <- (rollDice 20)

	if(dadoObservar >= 15)
		then do
			putStrLn "Ao analisar a entrada"
			putStrLn "Voce percebe que os suportes de madeira do tunel"
			putStrLn "estao lascados e despedacados, como se tivessem danificados"
			putStrLn "em uma recente batalha."
			putStrLn "Voce também percebe que elas estão manchadas de sangue."
	else if(dadoObservar >= 10)
		then do
			putStrLn "Ao analisar a entrada"
			putStrLn "Voce percebe que os suportes de madeira do tunel"
			putStrLn "estao lascados e despedacados, como se tivessem danificados"
			putStrLn "em uma recente batalha."
	else do
		putStrLn "Voce tenta analisar a entrada, porém não consegue"
		putStrLn "encontrar nada relevante na estrutura."

	putStrLn "Você acende uma tocha e entra na caverna."

segundaEscolhaEntrada :: IO()
segundaEscolhaEntrada = do

	dadoObservar <- (rollDice 20)

	if(dadoObservar >= 10 && dadoObservar < 15)
		then do
			putStrLn "Ao procurar ao redor da entrada"
			putStrLn "No meio as picaretas e pas quebradas, voce encontra uma pedra preciosa!"
			putStrLn "No entanto, voce nao encontrou nada que pode ser util para entender"
			putStrLn "o que aconteceu nessa mina. Voce acende uma tocha e entra na caverna."
			-- Aumentar xp 300
	else if(dadoObservar >= 15)
		then do
			putStrLn "Ao procurar ao redor da entrada"
			putStrLn "No meio as picaretas e pás quebradas, você encontra duas poções de vida!"
			putStrLn "Possivelmente elas serao úteis... Voce tambem encontra um simbolo"
			putStrLn "associados a kobolds, pequenas criaturas que são conhecidas por serem"
			putStrLn "saqueadores. E provavel que tenha havido um combate por aqui. Você"
			putStrLn "acende uma tocha e entra na caverna com atenção redobrada."
			-- Adicionar item id 1
			-- Aumentar Xp 500
	else do
		putStrLn "Ao procurar ao redor da entrada"
		putStrLn "Voce buscar por alguns minutos, no entanto, voce nao encontra"
		putStrLn "nada relevante pra voce."
		putStrLn "Você acende uma tocha e entra na caverna."

printCredits :: IO()
printCredits = do
	putStrLn "Obrigado por jogar: A Praga Carmesim!"
	putStrLn "Sistema inspirado: Dungeons and Dragons, quinta edição."
	putStrLn ""
	putStrLn "Feito por:"
	putStrLn "Jadson Luan"
	putStrLn "Jesse Souza"
	putStrLn "Lucas de Medeiros"
	putStrLn "Marcella Siqueira"
	putStrLn "Mikael Brasileiro"
	putStrLn ""
	putStrLn "Existem mais finais para serem desbravados, tente conseguir outro jogando novamente!"
	clearScreen

cavernReception :: IO String
cavernReception = do
	putStrLn "O tunel se abre em uma camara pequena e aproximadamente"
	putStrLn "regular. Pedacos espalhados de minerio de prata cercam"
	putStrLn "um par de carroças de madeira. A parte de baixo do que"
	putStrLn "aparenta ser um corpo humano se sobressai debaixo de uma"
	putStrLn "das carrocas. E nao mostra nenhum sinal de movimento."
	putStrLn "Sangue seco mancha a parede norte em varios locais."
	putStrLn "Há uma saída para o oeste"
	clearScreen
	receptionChoice
	choice <- receptionChoice
	activate <- (checkWagon choice)
	clearScreen
	return $ activate

receptionChoice :: IO String
receptionChoice = do
	putStrLn "O que você vai fazer? (digite um número)"
	putStrLn "1) Analisar o corpo da carroca."
	putStrLn "2) Seguir em frente."
	choice <- getLine
	return $ choice

checkWagon :: String -> IO String
checkWagon "1" = do
	checkReflex <- (rollDice 20)
	if(checkReflex >= 12)
		then do
			putStrLn "Voce escuta um barulho de"
			putStrLn "mecanismos, voce rapidamente entende que e uma armadilha"
			putStrLn "e salta para tras, conseguindo desviar do ataque sonico"
			putStrLn "produzido pela mesma."
			-- Adiciona xp 250
			wagonDescription
			return $ "y"
	else do
		putStrLn "Voce escuta um barulho de"
		putStrLn "mecanismos, e uma armadilha que produz um som ensurdecedor"
		putStrLn "que deixa voce temporariamente surdo."
		-- Hp -3
		return $ "n"

checkWagon "2" = do
	putStrLn "Voce prefere nao se arriscar e mexer nesse corpo."
	putStrLn "É quase certo que havia alguma armadilha ali. Seria uma coin-"
	putStrLn "cidencia muito grande tantos minerios de prata espalhados uniformemente."
	return $ "n"

checkWagon str = do
	putStrLn "Opção invalida!"
	clearScreen
	receptionChoice

wagonDescription :: IO()
wagonDescription = do
	putStrLn "Ao analisar o corpo, voce percebe que ele tem marcas parecidos com"
	putStrLn "as vitimas da praga. Ele tem uma roupa diferente dos outros mineradores"
	putStrLn "Provavelmente era o chefe deles. Ele parece ter sido uma vitima de um ataque"
	putStrLn "tendo muitos ferimentos perfurantes no peito e pescoco."
	clearScreen
	putStrLn "Voce tambem percebe inumeros pedacoes de prata ao redor da carroca."
	putStrLn "Voce ira coletar?"
	choice <- getYesNo
	(getSilver choice)

getSilver :: String -> IO()
getSilver "s" = do
	putStrLn "Voce coleta os minerios sem problemas."
	-- Adiciona Dinheiro 250
	-- Add xp 250
getSilver str = do
	putStrLn "Voce prefere nao arricar a pegar esses minerios."
	-- Add xp 250

checkListenKnowledge :: IO()
checkListenKnowledge = do
	checkListen <- (rollDice 20)
	if(checkListen >= 10)
		then do
			putStrLn "Voce consegue escutar varios passos do outro lado da porta"
			putStrLn "Alem disso, voce escuta varias vozes"
			checkKnowledge <- (rollDice 20)
			(auxCheckKnowledge checkKnowledge)
			-- Add xp 250
	else do
		putStrLn "Voce nao consegue entender quase nada do que estao falando."
		putStrLn "No entanto, voce tem a impressao que sao kobolds."

	putStrLn "Voce abre a grande porta de madeira e enxerga:"

auxCheckKnowledge :: Int -> IO()
auxCheckKnowledge check = do
	if(check >= 8 && check < 12)
		then do
			putStrLn "Voce consegue reconhecer que sao kobolds pelo idioma que"
			putStrLn "estao falando, draconico. O pouco que voce entende da conversa"
			putStrLn "é que os kobolds estão muito nervosos e gostariam de deixar as"
			putStrLn "minas o mais rápido possível. Infelizmente, seu comandante"
			putStrLn "determinou que eles devem permanecer por mais um tempo."
			-- Add xp 150
	else if (check >= 12 && check < 16)
		then do
			putStrLn "Voce consegue reconhecer que sao kobolds pelo idioma que"
			putStrLn "estao falando, draconico. O que voce entende da conversa"
			putStrLn "é que algum tipo de criatura tem roubado os mortos de seu"
			putStrLn "acampamento enquanto eles dormem. A maioria dos humanos"
			putStrLn "já foram roubados e até mesmo alguns cadáveres de kobolds"
			putStrLn "se perderam."
			-- Add xp 200
	else if (check >= 16)
		then do
			putStrLn "Voce consegue reconhecer que sao kobolds pelo idioma que"
			putStrLn "estao falando, draconico. Voce consegue entender bastante da"
			putStrLn "conversa, o mais importante que voce escuta é que"
			putStrLn "deve haver alguma maldição nesta mina. Metade do seu bando"
			putStrLn "já morreu de estranhas febres ou de uma tosse horrível."
			--Aumentar xp 250
	else do
		putStrLn "Voce consegue reconhecer que sao kobolds pelo idioma que"
		putStrLn "estao falando, draconico. Você não consegue enteder quase"
		putStrLn "nada. No entanto, você percebe que os kobolds estão nervosos"
		putStrLn "pelo tom de voz."

koboldsCombatDialogue :: IO()
koboldsCombatDialogue = do
	checkCha <- (rollDice 20)

	if(checkCha >= 13)
		then do
			koboldsCombatConversation
	else do
		startBattleKobolds

koboldsCombatConversation :: IO()
koboldsCombatConversation = do
	putStrLn "Ao comecar a falar, os kobolds apesar de receiosos"
	putStrLn "resolvem escutar o que voce tem a dizer"
	putStrLn "O que você irá dizer para eles?"
	putStrLn "1) Nao precisamos brigar. Nenhum de nos quer isso! (Diplomacia)"
	putStrLn "2) Nao ousem me atacar se quiserem continuar vivos. (Intimidacao)"
	checkPersuation <- (rollDice 20)
	choice <- getLine
	--putStrLn "3) Eu posso pagar uma quantia generosa se vocês esquecerem que me viram. (Suborno)"
	(koboldsCombatDialogue2 choice checkPersuation)

koboldsCombatDialogue2 :: String -> Int -> IO()
koboldsCombatDialogue2 "1" n = do
	if(n >= 13)
		then do
			putStrLn "Os kobolds parecem concordar com voce e abaixam as armas."
			putStrLn "O que parece ser o capitao daquele pequeno grupo fala:"
			putStrLn "Capitão: Nao temos forca pra lutar, doenca enfraquecer e matar"
			putStrLn "Capitão amigos. Humano pode seguir em frente."
			--Aumentar xp 2250
	else do
		startBattleKobolds

koboldsCombatDialogue2 "2" n = do
	if(n >= 13)
		then do
			putStrLn "Os kobolds parecem, de fato, ficarem intimidados com voce."
			putStrLn "O que parece o capitao daquele pequeno grupo fala:"
			putStrLn "Capitão: Tudo bem, humano pode passar. Só não nos mate, por favor."
			--Aumentar xp 2500
	else do
		startBattleKobolds

koboldsCombatDialogue2 str _ = do
	putStrLn "Opção invalida!"
	clearScreen
	koboldsCombatConversation

startBattleKobolds :: IO()
startBattleKobolds = do
	putStrLn "O que parece ser o capitao daquele pequeno grupo fala:"
	putStrLn "Capitao: Nao importa o que humano fale, voce morre agora!"
	-- Inicia batalha

refectoryCavern :: String -> IO()
refectoryCavern str = do
	if (str /= "s")
		then do
			checkListenKnowledge
	else do
		putStrLn "Ter ativado a armadilha atraiu muito a atencao daqueles que"
		putStrLn "estao dentro da caverna, inclusive os kobolds dentro dessa sala."
		putStrLn "Voce escuta muitos gritos e passos, voce imagina que eles estao"
		putStrLn "se preparando para um combate. Ao abrir a porta você ve o seguinte:"
		clearScreen

	putStrLn "Uma sala larga e quadrada abriga quatro longas mesas de"
	putStrLn "madeira, cada uma com um banco de cada lado. Em cima"
	putStrLn "das mesas estao um numero de tigelas de madeira e talheres."
	putStrLn "No canto sudeste da sala, um pequeno caldeirao fumega"
	putStrLn "sobre um fogao cravado no chao. Um cheiro pungente esta"
	putStrLn "suspenso no ar. "
	putStrLn "Voce também exerga três kobolds apontando para voce."
	refectoryChoice

refectoryChoice :: IO()
refectoryChoice = do
	putStrLn "Os kobolds parecem bastante nervosos, o que voce ira fazer?"
	putStrLn "1) Tentar conversar com eles."
	putStrLn "2) Atacar imediatamente."
	choice <- getLine
	refectoryChoice2 choice

refectoryChoice2 :: String -> IO()
refectoryChoice2 "1" = koboldsCombatDialogue
refectoryChoice2 "2" = do
	putStrLn "Voce imediatamente comeca a preparar o seu ataque enquanto"
	putStrLn "os kobolds correm em direcao a voce."
	--Inicia combate
refectoryChoice2 str = do
	putStrLn "Opção invalida!"
	clearScreen
	refectoryChoice

pantryCavern :: IO()
pantryCavern = do
	putStrLn "Uma porta de madeira fechada barra a entrada para essa"
	putStrLn "sala. Ao abrir porta você observa que esta sala longa"
	putStrLn "e estreita possui fileiras de estantes carregadas"
	putStrLn "de alimentos e outros suprimentos. Pesados sacos"
	putStrLn "de estopa estão empilhados até o teto no canto"
	putStrLn "oposto da câmara. Uns poucos rasgados, espalhando"
	putStrLn "aveia e farinha no chão. Muitos barris estão"
	putStrLn  "agrupados próximos à parede norte."
	putStrLn "Ao entrar na sala, uma armadilha é ativada!"
	putStrLn "Uma flecha é lançada em sua direção."
	checkResistance <- (rollDice 20)
	if (checkResistance >= 11)
		then do
			putStrLn "Por sorte, a armadilha não te acerta."
	else do
		putStrLn "A flecha perfura o seu ombro. Causando"
		putStrLn "um ferimento moderado."
	--Diminuir vida
	clearScreen
	putStrLn "A armadilha chama a atenção de uma criatura"
	putStrLn "que estava em um barril e ela irá atacar você."
	putStrLn "Essas criatura é um rato, no entanto, bem maior"
	putStrLn "que o normal, e você tem a impressão que pode pegar"
	putStrLn "a praga lutando com ela."
	--inicia batalha
	checkResistance <- (rollDice 20)
	--add xp 2000
	if (checkResistance >= 10)
		then do
			putStrLn "Apesar do contato com os ratos, você consegue"
			putStrLn "resistir a praga."
			return $ "n"
	else do
		putStrLn "Após o combate, você sente que algo está errado..."
		putStrLn "Você está se sentindo um pouco mais fraco, talvez"
		putStrLn "você tenha contraído a praga."
		return $ "s"
	putStrLn "Em um dos barris, você encontra duas poções de vida"
	putStrLn "e duas poções de mana, naturalmente você guarda elas."
	putStrLn "Elas podem ser bastante úteis no futuro."
	--adicionar item 2
	--adicionar item 2
	--adicionar item 4
	--adicionar item 4
	putStrLn "Após os achados, você começa a descer uma rampa que"
	putStrLn "leva a uma parte inferior da caverna. Aos poucos "
	putStrLn "ela vai ficando muito íngrime, a um ponto que te"
	putStrLn "faz perder o equilíbrio e descer o resto da rampa"
	putStrLn "deslizando a mesma."

corpsesGrave :: IO()
corpsesGrave = do
	putStrLn "Você passa pelo túnel. Ondas de calor banham"
	putStrLn "respiração difícil. Esta caverna pequena e"
	putStrLn "em forma de tigela possui o chão cheio de"
	putStrLn "cadáveres humanóides. A abertura de um túnel"
	putStrLn "é visível na parede leste da câmara"
	putStrLn "e, na distância, o som de água corrente"
	putStrLn "pode ser ouvido."
	skip
	checkInteligence <- (rollDice 20)
	if (checkInteligence >= 8)
		then do
			putStrLn "Você acredita que aqui é o fosso da criação"
			putStrLn "da praga. Sejá la quem for que está fazendo"
			putStrLn "isso, não deve ficar longe de onde você está."
	else do putStr ""
	putStrLn "Quatro zumbis levantam-se de um dos montes"
	putStrLn "de corpos! Prepare-se para o combate!"
	--inicia batalha
	--add xp 2000
	putStrLn "Algo dentro de você diz que isso está perto"
	putStrLn "de acabar. Ao calmo som de água corrente. Você"
	putStrLn "entra no estreito túnel a leste."

jakkEnding :: IO()
jakkEnding = do
	putStrLn "Ao entrar, nessa parte da caverna, você observa um"
	putStrLn "único pilar irregular, de pedra e cheio de um musgo"
	putStrLn "emerge das profundezas de um lago no centro da caverna."
	putStrLn "A água cai pelas suas laterais de uma fonte"
	putStrLn "próxima ao seu topo, cascateando até a lagoa abaixo."
	putStrLn "A lagoa alimenta uma larga correnteza que flui rapidamente"
	putStrLn "ao longo da extensão da sala e então por baixo da parede de"
	putStrLn "pedra na extremidade sul da caverna. Muitos símbolos estão"
	putStrLn "entalhados profundamente na face de pedra do pilar, suas"
	putStrLn "linhas apenas visíveis por baixo da luz do musgo. Uma"
	putStrLn "sensação estranha de desconforto impregna este lugar."
	skip
	religionDice <- (rollDice 20)
	if (religionDice >= 8)
		then do
			putStrLn "Os símbolos entalhados aqui estão escritos"
			putStrLn "no idioma orc e servem como uma súplica a"
			putStrLn "Gruumsh (o deus dos orcs) para destruir"
			putStrLn "os inimigos com uma terrível pestilência."
			putStrLn "Eles também recontam a história das minas e o destino"
			putStrLn "do clã Garra Despedaçante."
			skip
	else do putStr ""
	putStrLn "No centro, voce percebe uma imponente presenca"
	putStrLn "Um grande orc, com uma armadura de metal e uma"
	putStrLn "clava de aço na mão direita."
	skip
	putStrLn "O que voce vai fazer?"
	putStrLn "1 - Tentar conversar com ele."
	putStrLn "2 - Atacar imediatamente."
	option <- getLine
	if (option == "1")
		then do
			putStrLn "AQUI INICIA UMA BATALHA..."
			--inicia batalha
	else do
		putStrLn "O Orc prepara sua maça enquanto você corre"
		putStrLn "em sua direção."
		--fugiu da batalha ou nao venceu

chatJakk :: IO()
chatJakk = do
	putStrLn "Jakk: Meu nome é Jakk, o que voce quer? Voce"
	putStrLn "Jakk: se arricou muito para chegar aqui."
	putStrLn "Jakk: Que tolice."
	skip
	putStrLn "O que voce ira responder:"
	putStrLn "1 - O que voce sabe sobre a praga?"
	putStrLn "2 - Eu tenho a cura, me mate e voce nunca a obtera.(Enganacao)"
	putStrLn "3 - Nao importa o que voce sabe, eu vim aqui para lutar com voce"
	option <- getLine
	if (option == "1")
		then do
			putStrLn "Jakk: Eu que criei e estou matendo essa praga."
			putStrLn "Jakk: Eu enfeiticei a agua para causar essa doenca."
			putStrLn "Jakk: Portanto, cuspa logo o que voce quer ou lute comigo!"
	else if (option == "2")
		then do
			putStrLn "Jakk: Pare de mentir, humano insolente!"
			putStrLn "Jakk: Eu que criei e estou mantendo essa praga."
			putStrLn "Jakk: Eu enfeiticei a agua para causar essa doenca."
			putStrLn "Jakk: Entao cuspa logo o que voce quer ou lute comigo!"
	else if (option == "3")
		then do
			putStrLn "Jakk: Voce nao tem uma chance, seu verme."
	else do putStr ""



rampCavern :: IO()
rampCavern = do
	putStrLn "Após descer a rampa e chegar no fundo da caverna"
	putStrLn "você olha que esta caverna enorme se estende"
	putStrLn "para cima até pelo menos 30 m, subindo alto para"
	putStrLn "dentro das entranhas da montanha. A iluminação"
	putStrLn "ocasionalmente reflete pequenos grãos prateados,"
	putStrLn "que brilham na face parede oeste da caverna."
	putStrLn "Muitos cabos estão pendurados na beirada de um"
	putStrLn "largo vazio na parede. O buraco penetra a face"
	putStrLn "oeste da caverna e começa a cerca de 6 m de"
	putStrLn "onde você está. O ar aqui é mais frio e úmido."
	clearScreen
	putStrLn "De repente, você escuta vários passos. Não de"
	putStrLn "humanoides, mas de um animal. Um imenso"
	putStrLn "lobo aparece por trás de algumas pedras e"
	putStrLn "começa a te cercar, e ele vai te atacar!"
	-- Inicia batalha
	clearScreen
	rampChoice
	putStrLn "Após o combate, você percebe que pode escalar"
	putStrLn "aqueles cabos pendurados. No entanto, também"
	putStrLn "existe um túnel à frente"

rampChoice :: IO()
rampChoice = do
	putStrLn "O que voce vai fazer?"
	putStrLn "1) Escalar os cabos"
	putStrLn "2) Seguir em frente"
	choice <- getLine
	rampProgress choice

rampProgress :: String -> IO()
rampProgress "1" = do
	checkLook <- (rollDice 20)
	if(checkLook >= 5)
		then do
			putStrLn "Aṕos escalar os cabos, você sobe em uma"
			putStrLn "pedra e exerga uma passagem para o que"
			putStrLn "parece um acampamento, você consegue"
			putStrLn "exergar que existem muitos tesouros"
			putStrLn "lá dentro."
			--secretCamp
	else do
		putStrLn "Você escala os cabos, mas devido ao escuro,"
		putStrLn "você não consegue enxergar nada. Sua única"
		putStrLn "opção é voltar e seguir o outro caminho."

rampProgress "2" = do
	putStrLn "Você prefere não se arriscar escalando esses"
	putStrLn "cabos. É mais sensato manter o foco e seguir"
	putStrLn "o caminho."

rampProgress str = do
	putStrLn "Opção inválida!"
	clearScreen
	rampChoice

secretCamp :: IO()
secretCamp = do
	putStrLn "Ao entrar na passagem, você encontra o acampa-"
	putStrLn "mento dos Kobolds, usado como área de estoque"
	putStrLn "e dormitório. Você encontra um baú e dois"
	putStrLn "jovens Kobolds, que estão olhando para você"
	putStrLn "e estão amedrontados. Um deles utiliza um capuz"
	putStrLn "que parece valioso."
	putStrLn ""
	secretCampChoice

secretCampChoice :: IO()
secretCampChoice = do
	putStrLn "O que voce ira fazer?"
	putStrLn "Matar eles e ficar com a capa."
	putStrLn "Poupar a vida deles e pegar apenas o tesouro."
	choice <- getLine
	putStrLn ""
	secretCampDecision choice

secretCampDecision :: String -> IO()
secretCampDecision "1" = do
	putStrLn "Para você, a capa é mais valiosa que a vida"
	putStrLn "deles. Você os mata sem remorso e pega a"
	putStrLn "capa deles, com um pouco de investigação"
	putStrLn "você descobre que é uma capa da proteção."
	-- Add item 42

secretCampDecision "2" = do
	putStrLn "Você poupa a vida deles, afinal, eles não"
	putStrLn "fizeram absolutamente nada. Simplesmente não"
	putStrLn "seria justo. Você pega três poções de vida"
	putStrLn "e duas de mana. Logo após, você desce os cabos"
	putStrLn "E segue o outro caminho."
	-- Add item 1
	-- Add item 1
	-- Add item 1
	-- Add item 2
	-- Add item 2
	-- Add xp 1000

secretCampDecision str = do
	putStrLn "Opção inválida!"
	clearScreen
	secretCampChoice

printViolentEnding = do
	putStrLn "Extremamente abatido, Jakk fala baixo:"
	putStrLn "Jakk: Eu apenas queria vingar o meu clã..."
	putStrLn "Jakk: Infelizmente eu acho que o mal prevaleceu..."
	putStrLn "Jakk, solta sua maça, e cai no chão."
	skip

	putStrLn "Derrotar Jakk já possui um efeito visível imediato"
	putStrLn "nas águas da nascente, que começa a ficar limpa da sujeira"
	putStrLn "da Febre logo após sua morte. Os sintomas"
	putStrLn "da Febre que afetam as pessoas de Passagem de Duvik"
	putStrLn "começaram a diminuir. E a ordem voltou a reinar na cidade."
	skip

printVillageFuture = do
	putStrLn "Lentamente, Passagem de Duvik começou a se"
	putStrLn "reestruturar e a prosperar novamente. Alguns"
	putStrLn "anos depois, Passagem de Duvik se tornou uma das maiores"
	putStrLn "e ricas cidades do reino. No centro dela, há uma estatua sua,"
	putStrLn "para relembrar quem tornou o sucesso dessa cidade possível!"
	skip

printPacificEnding = do
	putStrLn "Após convencer Jakk a terminar a maldição. A água"
	putStrLn "amaldiçoada, que servia como abastecimento de Passagem"
	putStrLn "de Duvik, foi aos poucos sendo purificada. Os sintomas"
	putStrLn "da Febre que afetam as pessoas de Passagem de Duvik"
	putStrLn "começaram a diminuir. E a ordem voltou a reinar na cidade."
	skip

printDefeatEnding = do
	putStrLn "Apesar dos seus esforços, você não conseguiu derrotar Jakk."
	putStrLn "Portanto, você não conseguiu acabar com o mal da praga."
	putStrLn "Todos de Passagem de Duvik pereceram à doença, e a promissora cidade"
	putStrLn "comerciante, virou apenas uma promessa do que poderia ser..."
	skip

printVariantEnding :: Char -> IO ()
printVariantEnding choice = do
	if 			(choice == 'a') then printVariantEnding_A
	else if (choice == 'b') then printVariantEnding_B
	else if (choice == 'c') then printVariantEnding_C
	else printVariantEnding_Else

printVariantEnding_A = do
	putStrLn "O prefeito se aproxima de voce e fala:"
	putStrLn "Prefeito: Eu só tenho a agradecer a você, nobre aventureiro"
	putStrLn "Prefeito: Voce salvou a vida de quase todos da cidade!"
	putStrLn "Prefeito: Aqui estão 500 peças de ouro como recompensa"
	putStrLn "Prefeito: pelo seu feito. Sempre que você voltar,"
	putStrLn "Prefeito: tenha a certeza que você será sempre bem recebido"
	putStrLn "Prefeito: aqui!"
	skip

printVariantEnding_B = do
	putStrLn "O minerador que falou com voce anteriormente, se aproxima"
	putStrLn "e com um grande sorriso grita:"
	putStrLn "Minerador: Eu sabia! Eu sabia que você conseguiria!"
	putStrLn "Minerador: Voce salvou a vida de todos da cidade. E nós"
	putStrLn "Minerador: somos extremamente gratos a você! Eu não tenho"
	putStrLn "Minerador: muito, mas aqui está o que eu tenho, 500 peças"
	putStrLn "Minerador: de ouro."
	putStrLn "Minerador: Ei! Sempre que vir aqui, minha casa sempre estará"
	putStrLn "Minerador: de portas abertas! Nós não esqueceremos de você."
	skip

printVariantEnding_C = do
	putStrLn "A camponesa que falou com você anteriormente, se aproxima"
	putStrLn "e com um grande sorriso fala:"
	putStrLn "Camponesa: Voce conseguiu! Meus filhos e os outros moradores"
	putStrLn "Camponesa: já estão melhorando e tudo isso graças a você!"
	putStrLn "Camponesa: Não me esquecerei do que você fez aqui!"
	putStrLn "Camponesa: Aqui estão 500 peças de ouro por tudo, que você"
	putStrLn "Camponesa: fez. Nós da vila nos juntamos para pode pagar"
	putStrLn "Camponesa: a você!"
	putStrLn "Camponesa: Volte aqui de vez em quando! Tenho certeza"
	putStrLn "Camponesa: que todos daqui adorariam te ver novamente!"
	skip

printVariantEnding_Else = do
	putStrLn "Meruen, o seu amigo que requisitou a missão, se aproxima"
	putStrLn "e diz:"
	putStrLn "Meruen: Eu tinha certeza que você conseguiria"
	putStrLn "Meruen: Você não só salvou minha vida como a de quase"
	putStrLn "Meruen: todos daqui da vila. Somos todos muito gratos"
	putStrLn "Meruen: a você. Aqui estão 500 peças de ouro, como uma"
	putStrLn "Meruen: forma de agradadecimento. Por fim, volte"
	putStrLn "Meruen: aqui de vez em quando. Seria muito bom"
	putStrLn "Meruen: te ver novamente!"
	skip
