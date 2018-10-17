module Enemies.Monster (
    Monster(..),
    geraMonstro,
    getMonstros,
    calculaVida,
    getId,
    getName,
    getHp,
    getXp,
    getDrops,
    getCa,
    getDano,
    reduceLife
) where

import qualified Database
import Data.Char

data Monster = Monster {
    monsterId :: Int,
    name :: String,
    hp ::Int,
    xp :: Int,
    drops :: Int,
    ca :: Int,
    damage :: Int
} deriving (Show)

geraMonstro :: [String] -> Monster
geraMonstro x = do
    Monster id nome hp xp drops ca dano
    where id = read (x !!0) :: Int
          nome = x !!1
          hp = calculaVida (x !!2) div som
          xp = read (x !!5) :: Int
          drops = read (x !!6) :: Int
          ca = read (x !!7) :: Int
          dano = read (x !!8) :: Int 
          div = read (x!!3) ::Int
          som = read (x!!4) ::Int

getMonstros :: [[String]] -> [Monster]
getMonstros [] = []
getMonstros (x:xs) = (geraMonstro x : getMonstros xs)

calculaVida :: String -> Int -> Int -> Int
calculaVida str divisor somador = do
    ((mult * max) `div` divisor) + somador
    where mult = digitToInt (str !!0)
          max = digitToInt (str !!2) 

getId :: Monster -> Int
getId monster = monsterId monster

getName :: Monster -> String
getName monster = name monster

getHp :: Monster -> Int
getHp monster = hp monster

getXp :: Monster -> Int
getXp monster = xp monster

getDrops :: Monster -> Int
getDrops monster = drops monster

getCa :: Monster -> Int
getCa monster = ca monster

getDano :: Monster -> Int
getDano monster = damage monster

reduceLife :: Monster -> Int -> Monster
reduceLife monster r = Monster (monsterId monster) (name monster) ((hp monster) - r) (xp monster) (drops monster) (ca monster) (damage monster)