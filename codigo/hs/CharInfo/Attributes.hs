module CharInfo.Attributes (
  Attributes (..),
  addAttribute,
  adjustAttr
) where

initial_int = 9
initial_dex = 9
initial_str = 9
initial_chr = 9
initial_vit = 9
initial_luk = 9

data Attributes = Attributes {
  int :: Int,
  dex :: Int,
  str :: Int,
  chr :: Int,
  vit :: Int,
  luk :: Int
} deriving (Show)

addAttribute :: Attributes -> Int -> Int -> Int -> Int -> Int -> Int -> Attributes
addAttribute attr i d s c v l = (Attributes newInt newDex newStr newChr newVit newLuk)
                                where
                                  newInt = (int attr) + i
                                  newDex = (dex attr) + d
                                  newStr = (str attr) + s
                                  newChr = (chr attr) + c
                                  newVit = (vit attr) + v
                                  newLuk = (luk attr) + l

adjustAttr :: String -> Attributes
adjustAttr role = do
  let initAttr = Attributes initial_int initial_dex initial_str initial_chr initial_vit initial_luk
  if (role == "mago")
    then addAttribute initAttr 2 (-1) (-2) 0 0 1
  else if (role == "guerreiro")
    then addAttribute initAttr (-2) (-1) 2 0 1 0
  else if (role == "ladino")
    then addAttribute initAttr 1 2 0 (-1) (-2) 0
  else initAttr
