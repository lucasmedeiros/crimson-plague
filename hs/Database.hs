module Database (
  importFromDB
) where

import System.IO
import Control.Monad
import Util (split)

importFromDB :: Int -> IO [[String]]
importFromDB numComments = do
  let list = []
  handle <- openFile "../db/habilidades_db.txt" ReadMode
  contents <- hGetContents handle
  let list = drop numComments (lines contents)
  -- hClose handle
  return $ map (`split` ';') list
