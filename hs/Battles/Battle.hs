module Battles.Battle(
    iniciaBatalha
) where

import Util
import CharInfo.Character

hpMonstro :: Int
hpMonstro = 20

atkMonstro :: Int
atkMonstro = 10

defMonstro :: Int
defMonstro = 5

tentaFugir :: String
tentaFugir = "Tentou Fugir!"

atacou :: String
atacou = "Atacou!"

escolhaAcao = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

executarAcao :: Int -> String
executarAcao escolha | (escolha == 1) = atacou
                     | otherwise = tentaFugir

iniciaBatalha :: IO()
iniciaBatalha = do
    clearScreen
    escolhaAcao
    escolha <- getOption
    putStrLn (executarAcao escolha)