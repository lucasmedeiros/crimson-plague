module Util (
  getOption,
  clearScreen
) where

import qualified System.Process

clearScreen :: IO()
clearScreen = do
  _ <- System.Process.system "clear"
  return ()

getOption :: IO Int
getOption = do
  putStr "Informe o número da opção desejada: "
  option <- getLine
  return $ read option
