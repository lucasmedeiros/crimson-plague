module Battles.Battle(
    startBattle
) where

import Util
import CharInfo.Sheet

zeroHP = 0
d20 = 20
resultMagicDefense = 10

startBattle :: Character -> IO()
startBattle char = do 
    clearScreen
    showStartBattleMessage
    auxStartBattle char

auxStartBattle :: Character -> IO()
auxStartBattle char = do
    battleMenu
    option <- Util.getOption
    evaluateOption char option

showStartBattleMessage :: IO()
showStartBattleMessage = do
    putStrLn "Uma batalha se aproxima..."

battleMenu :: IO()
battleMenu = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

attack :: Character -> IO ()
attack char = do
    putStrLn "atacou!"

wasAbleToEscape :: Int -> Bool
wasAbleToEscape rollResult = 
    if (rollResult >= resultMagicDefense) then True
    else False

tryEscape :: Character -> IO()
tryEscape char = do
    rollResult <- rollDice(d20)
    if (wasAbleToEscape rollResult)
        then do putStrLn "adios, amigo..."
    else do
        putStrLn "not today, amigo..."
        auxStartBattle (char)

evaluateOption :: Character -> Int -> IO ()
evaluateOption char option
    | (option == 1) = attack (char)
    | otherwise     = tryEscape (char)