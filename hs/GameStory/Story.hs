module GameStory.Story (
	getYesNo,
	introducaoCidade,
	ganchoAventura,
	segundaChance
) where

import Util

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

ganchoAventura :: IO()
ganchoAventura = do
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
	option <- getLine
	mudaDirecionamento option

mudaDirecionamento :: Int -> IO()
mudaDirecionamento 1 = escolhaGancho1
mudaDirecionamento 2 = escolhaGancho2
mudaDirecionamento 3 = escolhaGancho3
mudaDirecionamento 4 = escolhaGancho4
mudaDirecionamento n = errorMessage

errorMessage :: IO()
errorMessage = do
	putStrLn "Opção inválida. Tente novamente!"
	clearScreen
	ganchoAventura

answerMessage1 :: Char -> IO()
answerMessage1 = do
    answer <- getYesNo
    if (answer == "s") 
        then do 
            putStrLn "Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina."
            putStrLn "Meruen: Muito obrigado, amigo."
    else do
        putStrLn "Meruen: Você é tão vazio quanto sua alma."
        putStrLn "Meruen se afasta lentamente de você."

answerMessage2 :: Char -> IO()
answerMessage2 = do
	answer <- getYesNo
	if (answer == "s") 
		then do 
			putStrLn "Mal sei o que dizer. Muito obrigado!!"
	else do
		putStrLn "Com um olhar de desaprovação, lentamente começam a se afastar de você."				

escolhaGancho1 :: IO()
escolhaGancho1 = do
	clearScreen
	putStrLn "Ao se aproximar dele, voce escuta:"
	putStrLn "Prefeito: Saudações. Eu sou o prefeito dessa cidade."
	putStrLn "Prefeito: muitos dos moradores da vila estão sofrendo de uma"
	putStrLn "Prefeito: doenca extremamente letal. Não pude deixar de notar"
	putStrLn "Prefeito: que você é um aventureiro, você poderia nos ajudar"
	putStrLn "Prefeito: a acabar com essa doença? Por favor, muitos já"
	putStrLn "Prefeito: morreram com essa praga."
	answerMessage1	

escolhaGancho2 :: IO()
escolhaGancho2 = do
	clearScreen
	putStrLn "Você nao demora muito pra perceber que eles sao mineradores"
	putStrLn "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:"
	putStrLn "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte."
	putStrLn "Minerador: voce parece forte. Por favor, acabe com esse mal!"
	answerMessage1

escolhaGancho3 :: IO()
escolhaGancho3 = do
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
	if (option == 1) 
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

escolhaGancho4 :: IO()
escolhaGancho4 = do
    clearScreen
    putStrLn "Isso não é problema seu. Você já tem problemas demais pra resolver."
    putStrLn "Esses camponeses conseguem resolver esse problema sozinho."
    putStrLn "Ao menos você acha isso."

segundaChance :: IO()
segundaChance = do
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
    if (option == 1)
        then do
            putStrLn "Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva"
            putStrLn "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana."
            putStrLn "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias..."
            putStrLn "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."
    else if (option == 2)
        then do
            putStrLn "Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..."
            putStrLn "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."
    else do
        putStrLn "Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar"
        putStrLn "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..."
        putStrLn "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?"
    answerMessage2

primeiroFinal :: IO()
primeiroFinal = do
    clearScreen
    putStrLn "Conclusao"
    putStrLn "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila."
    putStrLn "Duas semanas depois, em outra vila a procura de um artefato."
    putStrLn "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga."
    putStrLn "Aqueles que sobreviveram foram os que fugiram"
    putStrLn "de Passagem de Duvik enquanto nao tinham sido contaminados"
    putStrLn "A promissora cidade comerciante, se tornou apenas uma ruina"
    putStrLn "uma promessa do que poderia se tornar."

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
	clearScreen
	putStrLn "Você encontra um kobolds, ele parece hostil"
	putStrLn "E irá atacar você! Prepare-se para o combate!"
	
	--inicia batalha
	
	putStrLn "Voce permanece por um tempo em frente a entrada"
	putStrLn "Por um momento voce hesita em seguir em frente"
	putStrLn "O que voce vai fazer?"	
	clearScreen
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
	putStrLn "O que você vai fazer? (digite um número)"
	putStrLn "1) Analisar o corpo da carroca."
	putStrLn "2) Seguir em frente."
	choice <- getLine
	activate <- (checkWagon choice)
	clearScreen
	return $ activate

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

