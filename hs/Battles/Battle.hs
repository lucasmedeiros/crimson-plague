module Battles.Battle(
    startBattle
) where

import Util
import CharInfo.Character

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
        resultado <- rollDice(20)
        if (resultado >= 10) then do putStrLn "escapou"
        else do
            putStrLn "nao conseguiu escapar..."
            auxStartBattle char

startBattle :: Character -> IO()
startBattle char = do 
    clearScreen
    startBattleMessage
    auxStartBattle char

auxStartBattle :: Character -> IO()
auxStartBattle char = do
    battleMenu
    option <- getOption
    evaluate char option