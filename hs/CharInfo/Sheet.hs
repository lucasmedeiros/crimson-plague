module CharInfo.Sheet (
  Character (..),
  createCharacter,
  getHP,
  getMaxHP,
  getMP,
  getMaxMP,
  getLevel,
  calculateDamage,
  calculateDefense,
  getStrModifier,
  getDexModifier,
  getIntModifier,
  increaseExperience,
  castSpell,
  takeDamage,
  getUsableSpells,
  hasEnoughMana
) where

import CharInfo.Attributes
import CharInfo.Stats
import Util
import qualified CharInfo.Spell as Spells

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

getLevel :: Character -> Int
getLevel character = level (stats character)

getRole :: Character -> String
getRole character = role character

-- Métodos de acesso aos modificadores
getDexModifier :: Character -> Int
getDexModifier c = (dex (attributes c)) `div` 4

getStrModifier :: Character -> Int
getStrModifier c = (str (attributes c)) `div` 4

getIntModifier :: Character -> Int
getIntModifier c = (int (attributes c)) `div` 4

-- Métodos de cálculo de defesa e ataque (temporários, aguardando equipamentos)
calculateDamage :: Character -> Int
calculateDamage character = do
  let weapon = 5
  let classe = getRole character
  let modifier = (if (classe == mago) then (getIntModifier character)
                  else if (classe == guerreiro) then (getStrModifier character)
                  else if (classe == ladino) then (getDexModifier character)
                  else 0)

  modifier + weapon

calculateDefense :: Character -> Int
calculateDefense character = do
  let armadura = 0
  10 + armadura + (getDexModifier character)

takeDamage :: Int -> Character -> Character
takeDamage dmg character = updateStats character (increaseHP (-dmg) (stats character))

-- Métodos relacionadoso a experiência e level do personagem
increaseExperience :: Int -> Character -> Character
increaseExperience xp' character = updateStats character (addXP xp' (stats character))

-- Métodos de atualização da ficha do personagem
updateStats :: Character -> Stats -> Character
updateStats c st = Character (name c) (role c) st (attributes c)

updateAttributes :: Character -> Attributes -> Character
updateAttributes c attr = Character (name c) (role c) (stats c) attr

-- Métodos relacionados a habilidades
spentMana :: Spells.Spell -> Character -> Character
spentMana spell character = do
  updateStats character (increaseMP (Spells.getMP spell) (stats character))

castSpell :: Spells.Spell -> Character -> IO (Int, Character)
castSpell spell character = do
  dmg <- (Spells.calculateDamage spell)
  let characterUpdated = (spentMana spell character)
  return $ (dmg, characterUpdated)

getUsableSpells :: [Spells.Spell] -> Character -> [Spells.Spell]
getUsableSpells spells character = do
  if (getRole character) == "mago" then
    Spells.getUsableSpells (getLevel character) spells
  else
    []

hasEnoughMana :: Spells.Spell -> Character -> Bool
hasEnoughMana spell character = (getMP character) >= (Spells.getMP spell)

-- criacao de Character
createCharacter :: IO Character
createCharacter = do
  clearScreen
  nome_entrada <- (prompt "Insira seu nome: ")
  clearScreen
  role <- chooseRole
  return $ Character nome_entrada role fillStats (adjustAttr role)
