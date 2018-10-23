module Database (
  importFromDB
) where

import System.IO
import Control.Monad
import Util (split)

importFromDB :: String -> Int -> IO [[String]]
importFromDB path numComments = do
  let list = []
  handle <- openFile path ReadMode
  contents <- hGetContents handle
  let list = drop numComments (lines contents)
  -- hClose handle
  return $ map (`split` ';') list


  write :: String -> String -> IO()
  write path text = do
  	arq <- openFile path WriteMode
  	hPutStr arq text
  	hFlush arq
  	hClose arq
