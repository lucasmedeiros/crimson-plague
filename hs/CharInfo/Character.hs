module CharInfo.Character (
  Stats (..),
  Character (..),
  createCharacter
) where

import CharInfo.Attributes
import qualified System.Process
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

-- end

-- Stats
data Stats = Stats {
  hp :: Int,
  mp :: Int,
  xp :: Int,
  xp_max :: Int,
  level :: Int
} deriving (Show)

data Character = Character {
  name :: String,
  role :: String,
  stats :: Stats,
  attributes :: Attributes
} deriving (Show)

clearScreen :: IO()
clearScreen = do
  _ <- System.Process.system "clear"
  return ()

getOption :: IO Int
getOption = do
  putStr "Informe o número da opção desejada: "
  option <- getLine
  return $ read option

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

fillStats :: Stats
fillStats = Stats initial_hp initial_mp initial_xp max_xp initial_lvl

-- criacao de Character
createCharacter :: IO Character
createCharacter = do
  clearScreen
  putStr "Insira o nome do seu personagem: "
  nome_entrada <- getLine
  clearScreen
  role <- chooseRole
  return $ Character nome_entrada role fillStats (adjustAttr role)
