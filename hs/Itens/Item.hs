module Itens.Item(
    Item,
    loadAll,
    getName,
    getRecHPMax,
    getRecMPMax,
    getArm,
    getDamage,
    getAgility,
    getStrenth,
    getIntelig
)where

import qualified Database


-- Tipo equipavel 
-- NEQUIPAVEL = 0, ARMA,ARMADURA,BOTAS,CAPACETE,ESCUDO

-- classe equipavel
-- GUERREIRO = 1,MAGO, LADINO, TODOS

data Item = Item{
    id :: Int,
    name :: String,
    description :: String,
    consumable :: Bool,
    recHPMax :: Int,
    recMPMax :: Int,
    dam :: Int,
    arm :: Int,
    str :: Int,
    int :: Int,
    dex :: Int,
    vit :: Int,
    classItem :: Int,
    equippedType :: Int
} deriving (Show)

buildItem :: [String]  -> IO Item
buildItem itemtxt =  do
    return $ (Item id name description consumable recHPMax recMPMax dam arm str int dex vit classItem equippedType)
    where
    id = read (itemtxt !!0) :: Int
    name = itemtxt !!1 :: String
    description = itemtxt !!2 :: String
    consumable = trueOrFalse (itemtxt !!3) :: Bool
    recHPMax = read (itemtxt !!4) :: Int
    recMPMax = read (itemtxt !!5) :: Int
    dam = read (itemtxt !!8) :: Int
    arm = read (itemtxt !!9) :: Int
    str = read (itemtxt !!10) :: Int
    vit = read (itemtxt !!11) :: Int
    dex = read (itemtxt !!12) :: Int
    int = read (itemtxt !!13) :: Int
    classItem = read (itemtxt !!7) :: Int
    equippedType = read (itemtxt !!8) :: Int
        

-- testado
trueOrFalse :: String -> Bool
trueOrFalse string | string == "0" = True
                   | otherwise = False
 
loadAll :: IO [IO Item]
loadAll = do
    itensTxt <- Database.importFromDB "../db/ItemDB.txt" 3
    return $ map buildItem itensTxt

getName :: Item -> String
getName item = name item

getRecHPMax :: Item -> Int
getRecHPMax item =  recHPMax item

getRecMPMax :: Item -> Int
getRecMPMax item = recMPMax item

getArm :: Item -> Int
getArm item = arm item

getDamage :: Item -> Int
getDamage item = dam item

getAgility :: Item -> Int
getAgility item = dex item

getStrenth :: Item -> Int
getStrenth item = str item

getIntelig :: Item ->  Int
getIntelig item = int item




