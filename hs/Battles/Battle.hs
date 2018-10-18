module Battles.Battle(
    startBattle
) where

import Util
import Enemies.Monsters
import CharInfo.Sheet

-- algumas constantes (evitando, assim, números mágicos)
zeroHP = 0
d20 = 20
resultMagicDefense = 10
resultEscape = 12

-- inicia a batalha entre o personagem e um monstro
startBattle :: Character -> Monster -> IO()
startBattle char monster = do 
    clearScreen
    showStartBattleMessage monster
    let hpMonster = Enemies.Monsters.getHp monster
    let hpChar = CharInfo.Sheet.getHP char
    auxStartBattle char monster 

-- função criada para representar um "loop"
auxStartBattle :: Character -> Monster -> IO()
auxStartBattle char monster = do
    showBattleMenu
    option <- Util.getOption
    evaluateOption char monster option

-- exibe a mensagem inicial de batalha
showStartBattleMessage :: Monster -> IO()
showStartBattleMessage monster = do
    let nome = getName (monster)
    putStrLn "BATALHA!"
    putStrLn ("Um "++nome++" se aproxima!")

-- exibe o menu de batalha
showBattleMenu :: IO()
showBattleMenu = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

-- executa um ataque do personagem
attack :: Character -> Monster -> IO ()
attack char monster = do
    putStrLn "atacou!"

-- verifica se foi possível escapar da batalha
wasAbleToEscape :: Int -> Bool
wasAbleToEscape rollResult = 
    if (rollResult >= resultEscape) then True
    else False

-- função chamada ao escolher a opção de fuga
-- avalia e exibe mensagens dependendo (se conseguiu fugir ou não)
tryEscape :: Character -> Monster -> IO()
tryEscape char monster = do
    rollResult <- rollDice(d20)
    if (wasAbleToEscape rollResult)
        then do putStrLn "Você escapou..."
    else do
        putStrLn "Não conseguiu escapar..."
        auxStartBattle char monster

-- avalia opção escolhida pelo usuário no menu
evaluateOption :: Character -> Monster -> Int -> IO ()
evaluateOption char monster option
    | (option == 1) = attack char monster
    | otherwise     = tryEscape char monster