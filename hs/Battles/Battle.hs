module Battles.Battle(
    startBattle
) where

import Util
import CharInfo.Sheet

zeroHP = 0
d20 = 20
resultadoDefesaMagica = 10

startBattle :: Character -> IO()
startBattle char = do 
    clearScreen
    startBattleMessage
    auxStartBattle char

auxStartBattle :: Character -> IO()
auxStartBattle char = do
    battleMenu
    option <- Util.getOption
    evaluate char option

attack :: String
attack = "atacou!"

startBattleMessage :: IO()
startBattleMessage = do
    putStrLn "Uma batalha se aproxima..."

battleMenu :: IO()
battleMenu = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

evaluate :: Character -> Int -> IO ()
evaluate char option = do
    if (option == 1) then do putStrLn attack
    else do
        rolling <- rollDice(d20)
        if (rolling >= resultadoDefesaMagica) then do putStrLn "escapou"
        else do
            putStrLn "nao conseguiu escapar..."
            auxStartBattle char