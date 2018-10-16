module Battles.Battle(
    startBattle
) where

import Util
import CharInfo.Character

hpMonster :: Int
hpMonster = 20

atkMonster :: Int
atkMonster = 10

defMonster :: Int
defMonster = 5

escape :: String
escape = "escape!"

attack :: String
attack = "attack!"

startBattleMessage :: IO()
startBattleMessage = do
    putStrLn "Uma batalha se aproxima..."

battleMenu :: IO()
battleMenu = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

evaluate :: Int -> String
evaluate escolha | (escolha == 1) = attack
                 | otherwise      = escape

startBattle :: Character -> IO()
startBattle char = do 
    startBattleMessage
    auxStartBattle char

auxStartBattle :: Character -> IO()
auxStartBattle char = do
    clearScreen
    battleMenu
    escolha <- getOption
    putStrLn (evaluate escolha)