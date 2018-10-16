module CharInfo.Character (
  Character (..),
  createCharacter,
  getHP,
  getMaxHP,
  getMP,
  getMaxMP,
  levelUp
) where

import CharInfo.Attributes
import CharInfo.Stats
import Util

roles = ["mago", "guerreiro", "ladino"]
mago = "mago"
guerreiro = "guerreiro"
ladino = "ladino"

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

-- Métodos de acesso a informações do personagem
getHP :: Character -> Int
getHP character = hp (stats character)

getMaxHP :: Character -> Int
getMaxHP character = max_hp (stats character)

getMP :: Character -> Int
getMP character = mp (stats character)

getMaxMP :: Character -> Int
getMaxMP character = max_mp (stats character)

-- Métodos relacionadoso a experiência e level do personagem
levelUp :: Character -> Character
levelUp character = updateStats updatedCharacter (addLevel 1 (stats updatedCharacter))
  where updatedCharacter = (updateStats character (setXP 0 (stats character)))

-- Métodos de atualização da ficha do personagem
updateStats :: Character -> Stats -> Character
updateStats c st = Character (name c) (role c) st (attributes c)

updateAttributes :: Character -> Attributes -> Character
updateAttributes c attr = Character (name c) (role c) (stats c) attr

-- criacao de Character
createCharacter :: IO Character
createCharacter = do
  clearScreen
  nome_entrada <- (prompt "Insira seu nome: ")
  clearScreen
  role <- chooseRole
  return $ Character nome_entrada role fillStats (adjustAttr role)
