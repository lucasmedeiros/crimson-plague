module Enemies.Monsters (
    Monster(..),
    buildMonster,
    getMonsters,
    generateHP,
    getId,
    getName,
    getHp,
    getXp,
    getDrops,
    getCa,
    getDmg,
    reduceLife
) where

import qualified Database
import Data.Char
import Util

data Monster = Monster {
    monsterId :: Int,
    name :: String,
    hp ::Int,
    xp :: Int,
    drops :: Int,
    ca :: Int,
    damage :: Int
} deriving (Show)

buildMonster :: [String] -> IO Monster
buildMonster x = do
    hp <- (generateHP (x !!2) div som)
    return $ (Monster id nome hp xp drops ca dano)
    where id = read (x !!0) :: Int
          nome = x !!1
          xp = read (x !!5) :: Int
          drops = read (x !!6) :: Int
          ca = read (x !!7) :: Int
          dano = read (x !!8) :: Int 
          div = read (x!!3) ::Int
          som = read (x!!4) ::Int

getMonsters :: IO [IO Monster]
getMonsters = do
  monstersTxt <- Database.importFromDB "../db/monstros_db.txt" 2
  return $ map buildMonster monstersTxt

generateHP str divisor somador = do
    hp <- (rollDices max mult)
    return $ ((hp `div` divisor) + somador)
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

getDmg :: Monster -> Int
getDmg monster = damage monster

reduceLife :: Monster -> Int -> Monster
reduceLife monster r = Monster (monsterId monster) (name monster) ((hp monster) - r) (xp monster) (drops monster) (ca monster) (damage monster)