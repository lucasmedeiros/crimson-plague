module Util (
  getOption,
  clearScreen,
  prompt,
  rollDice,
  sizeList,
  contains,
  listsEquals
) where

import qualified System.Process
import System.Random

-- Dado um titulo, apresenta o titulo e aguarda uma resposta
-- Por fim, retorna a resposta.
prompt :: String -> IO String
prompt text = do
  putStr text
  response <- getLine
  return response

-- Limpa a tela.
clearScreen :: IO()
clearScreen = do
  _ <- System.Process.system "clear"
  return ()

-- Mostra uma mensagem pedindo para inserir uma opção,
-- e em seguida, retorna essa opção.
getOption :: IO Int
getOption = do
  putStr "Informe o número da opção desejada: "
  option <- getLine
  return $ read option

-- Rola um dado de numero determinado por parametro
rollDice :: Int -> IO Int
rollDice num = randomRIO (1::Int, num)

-- Retona o tamanho de uma lista genérica.
sizeList :: (Eq t) => [t] -> Int
sizeList [] = 0
sizeList (h:t) = 1 + sizeList t

-- Procura um item em uma lista de mesmo tipo,
-- retorna True se encontrar, False caso contrário.
contains :: (Eq t) => t -> [t] -> Bool
contains _ [] = False
contains a (h:t) = if a == h then True else contains a t

-- Verifica se duas listas são iguais.
listsEquals :: (Eq t) => [t] -> [t] -> Bool
listsEquals [] [] = True
listsEquals _ [] = False
listsEquals [] _ = False
listsEquals (h:t) (x:xs) = if h == x then listsEquals t xs else False