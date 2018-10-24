module Util (
  getOption,
  clearScreen,
  prompt,
  rollDice,
  rollDices,
  split,
  convertStringToInt
) where

import qualified System.Process
import qualified System.Random (randomRIO)

split :: String -> Char -> [String]
split [] delimit = [""]
split (x:xs) delimit
    | x == delimit = "" : remain
    | otherwise = (x : head remain) : tail remain
    where
        remain = split xs delimit

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
rollDice num = System.Random.randomRIO (1::Int, num)

-- Converte uma lista de String em uma lista de inteiros
convertStringToInt :: [String] -> [Int]
convertStringToInt string = map (read :: String -> Int) string 

rollDices :: Int -> Int -> IO Int
rollDices sides 1 = rollDice sides
rollDices sides num = do
  value <- (rollDice sides)
  value2 <- (rollDices sides (num - 1))
  return $ value + value2
  
