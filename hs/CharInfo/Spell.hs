module CharInfo.Spell (
  Spell,
  getID,
  getName,
  getDice,
  getCircle,
  getMP,
  buildSpell
) where

import Database
import Util (split)

-- id;nome;descr;circulo;dado;mp
data Spell = Spell {
  spellID :: Int,
  name :: String,
  description :: String,
  circle :: Int,
  dice :: (Int, Int),
  mp :: Int
} deriving (Show)

-- buildSpell :: [String] -> Spell
buildSpell txt = do
  let id' = read (txt !! 0) :: Int
  let name' = txt !! 1
  let descr = txt !! 2
  let circle' = read (txt !! 3) :: Int
  let dice' = split (txt !! 4) 'd'
  let dice'' = ((read (dice' !! 0) :: Int), (read (dice' !! 1) :: Int))
  let mp' = read (txt !! 5) :: Int
  -- print id'
  return $ Spell id' name' descr circle' dice'' mp'

-- Métodos de acesso a informações da habilidade
getID :: Spell -> Int
getID spell = spellID spell

getName :: Spell -> String
getName spell = name spell

-- Retorna o circulo mágico a qual a habilidade pertence
getCircle :: Spell -> Int
getCircle spell = circle spell

-- Retorna as informações sobre o dano (dado) da habilidade
-- Retorno = (numero de dados, qtd de lados do dado)
getDice :: Spell -> (Int, Int)
getDice spell = dice spell

-- Retorna a quantidade de MP que a habilidade gasta
getMP :: Spell -> Int
getMP spell = mp spell
