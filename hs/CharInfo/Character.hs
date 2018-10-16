module CharInfo.Character (
  Stats (..),
  Character (..),
  createCharacter,
  getHP,
  getMaxHP,
  getMP,
  getMaxMP
) where

import CharInfo.Attributes
import Util

-- Stats iniciais
initial_hp = 100
initial_mp = 30
initial_xp = 0
initial_lvl = 1

max_xp = 1000

roles = ["mago", "guerreiro", "ladino"]
mago = "mago"
guerreiro = "guerreiro"
ladino = "ladino"

-- Stats
data Stats = Stats {
  hp :: Int,
  max_hp :: Int,
  mp :: Int,
  max_mp :: Int,
  xp :: Int,
  level :: Int
} deriving (Show)

data Character = Character {
  name :: String,
  role :: String,
  stats :: Stats,
  attributes :: Attributes
} deriving (Show)

showRolesInfo = do
  putStrLn "Guerreiros são exímios lutadores marciais, sempre prontos para lutar."
  putStrLn "Possuem extremas habilidades de combate corpo a corpo."
  putStrLn ""
  putStrLn "Magos são pesquisadores das artes arcanas da Idade Média e utilizam-as em suas batalhas,"
  putStrLn "porém são fisicamente fracos e não possuem habilidades de combate com armas."
  putStrLn ""
  putStrLn "Furtivos e escorregadios, ladinos, se não estão roubando algo, estão trabalhando numa busca por um tesouro."
  putStrLn "Possuem altas habilidades em combates de longa distância e armas de longo alcance."

-- chooseRole :: IO String
chooseRole = do
  putStrLn "Escolha uma classe: "
  putStrLn "0. Mago"
  putStrLn "1. Guerreiro"
  putStrLn "2. Ladino"
  putStrLn "3. Informações"
  putStrLn ""
  option <- getOption
  if (option >= 0 && option <= 2) then return (roles !! option)
  else if (option == 3)
    then do
      clearScreen
      showRolesInfo
      putStrLn ""
      chooseRole
  else chooseRole

getHP :: Character -> Int
getHP character = hp (stats character)

getMaxHP :: Character -> Int
getMaxHP character = max_hp (stats character)

getMP :: Character -> Int
getMP character = mp (stats character)

getMaxMP :: Character -> Int
getMaxMP character = max_mp (stats character)

fillStats :: Stats
fillStats = Stats initial_hp initial_hp initial_mp initial_mp initial_xp initial_lvl

-- criacao de Character
createCharacter :: IO Character
createCharacter = do
  clearScreen
  nome_entrada <- (prompt "Insira seu nome: ")
  clearScreen
  role <- chooseRole
  return $ Character nome_entrada role fillStats (adjustAttr role)
