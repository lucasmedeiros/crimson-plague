module Util (
  getOption,
  clearScreen,
  prompt
) where

import qualified System.Process

-- Dado um titulo, apresenta o titulo e aguarda uma resposta
-- Por fim, retorna a resposta
prompt :: String -> IO String
prompt text = do
  putStr text
  response <- getLine
  return response

-- Limpa a tela
clearScreen :: IO()
clearScreen = do
  _ <- System.Process.system "clear"
  return ()

-- Mostra uma mensagem pedindo para inserir uma opção,
-- e em seguida, retorna essa opção
getOption :: IO Int
getOption = do
  putStr "Informe o número da opção desejada: "
  option <- getLine
  return $ read option
