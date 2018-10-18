module Battles.Battle(
    startBattle
) where

import Util
import Enemies.Monsters
import CharInfo.Sheet

zeroHP = 0
d20 = 20
resultMagicDefense = 10
resultEscape = 12

startBattle :: Character -> Monster -> IO()
startBattle char monster = do 
    clearScreen
    showStartBattleMessage monster
    auxStartBattle char monster

auxStartBattle :: Character -> Monster -> IO()
auxStartBattle char monster = do
    showBattleMenu
    option <- Util.getOption
    evaluateOption char monster option

showStartBattleMessage :: Monster -> IO()
showStartBattleMessage monster = do
    let nome = getName (monster)
    putStrLn "BATALHA!"
    putStrLn ("Um "++nome++" se aproxima!")

showBattleMenu :: IO()
showBattleMenu = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

attack :: Character -> Monster -> IO ()
attack char monster = do
    putStrLn "atacou!"

wasAbleToEscape :: Int -> Bool
wasAbleToEscape rollResult = 
    if (rollResult >= resultEscape) then True
    else False

tryEscape :: Character -> Monster -> IO()
tryEscape char monster = do
    rollResult <- rollDice(d20)
    if (wasAbleToEscape rollResult)
        then do putStrLn "adios, amigo..."
    else do
        putStrLn "not today, amigo..."
        auxStartBattle char monster

evaluateOption :: Character -> Monster -> Int -> IO ()
evaluateOption char monster option
    | (option == 1) = attack char monster
    | otherwise     = tryEscape char monster