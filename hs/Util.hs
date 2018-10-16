module Util (
  getOption,
  clearScreen,
  prompt
) where

import qualified System.Process

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

-- Retona o tamanho de uma lista genérica.
size_list :: (Eq t) => [t] -> Int
size_list [] = 0
size_list (h:t) = 1 + size_list t

-- Procura um item em uma lista de mesmo tipo,
-- retorna True se encontrar, False caso contrário.
contains :: (Eq t) => t -> [t] -> Bool
contains _ [] = False
contains a (h:t) = if a == h then True else contains a t

-- Verifica se duas listas são iguais.
lists_equals :: (Eq t) => [t] -> [t] -> Bool
lists_equals [] [] = True
lists_equals _ [] = False
lists_equals [] _ = False
lists_equals (h:t) (x:xs) = if h == x then lists_equals t xs else False