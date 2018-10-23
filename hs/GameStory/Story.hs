module GameStory.Story (
	getYesNo,
	introducaoCidade,
	ganchoAventura
) where

import Util

getYesNo :: IO Char 
getYesNo = do
	putStrLn "O que você irá responder? "
	option <- getLine
	return $ read option

introducaoCidade :: IO()
introducaoCidade = do
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
	clearScreen

mudaDirecionamento :: Int -> IO()
mudaDirecionamento 1 = escolhaGancho1
mudaDirecionamento 2 = escolhaGancho2
mudaDirecionamento 3 = escolhaGancho3
mudaDirecionamento 4 = escolhaGancho4
mudaDirecionamento n = mensagemErro

mensagemErro :: IO()
mensagemErro = do
	putStrLn "Opção inválida. Tente novamente!"
escolhaGancho1 :: IO()
escolhaGancho1 = do
	putStrLn "Ao se aproximar dele, voce escuta:"
	putStrLn "Prefeito: Saudações. Eu sou o prefeito dessa cidade."
	putStrLn "Prefeito: muitos dos moradores da vila estão sofrendo de uma"
	putStrLn "Prefeito: doenca extremamente letal. Não pude deixar de notar"
	putStrLn "Prefeito: que você é um aventureiro, você poderia nos ajudar"
	putStrLn "Prefeito: a acabar com essa doença? Por favor, muitos já"
	putStrLn "Prefeito: morreram com essa praga."

escolhaGancho2 :: IO()
escolhaGancho2 = do
	putStrLn "Você nao demora muito pra perceber que eles sao mineradores"
	putStrLn "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:\n"
	putStrLn "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte."
	putStrLn "Minerador: voce parece forte. Por favor, acabe com esse mal!"

escolhaGancho3 :: IO()
escolhaGancho3 = do
	putStrLn "Voce encontra diversos moradores atonitos na vila."
	putStrLn "Uma das moradoras se aproxima de voce e diz:"
	putStrLn "Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro"
	putStrLn "Minerador: voce parece forte. Por favor, acabe com esse mal!"

escolhaGancho4 :: IO()

-- 
Marcella Medeiros Siqueira Coutinho de Almeida
Graduanda em Ciência da Computação - Universidade Federal de Campina Grande
Coordenadora do grupo Elas@Computação UFCG
Embaixadora Regional do Technovation Challenge Brasil