module Itens.Item(
    AtrbItens,
    Item,
    loadAllItens,
    getName,
    getRecHPMax,
    getRecMPMax

)where

import qualified Database


-- Tipo equipavel 
-- NEQUIPAVEL = 0, ARMA,ARMADURA,BOTAS,CAPACETE,ESCUDO

-- classe equipavel
-- GUERREIRO = 1,MAGO, LADINO, TODOS

data AtrbItens = AtrbItens{
    dam :: Int,
    arm :: Int,
    str :: Int,
    int :: Int,
    dex :: Int,
    vit :: Int,
    classItem :: Int,
    equippedType :: Int
} deriving (Show)

data Item = Item{
    id :: Int,
    name :: String,
    description :: String,
    consumable :: Bool,
    recHPMax :: Int,
    recMPMax :: Int,
    atrb :: AtrbItens
} deriving (Show)

buildAtributes :: [String] -> AtrbItens
buildAtributes txt = do
    let dam = read (txt !!8) :: Int
    let arm = read (txt !!9) :: Int
    let str = read (txt !!10) :: Int
    let vit = read (txt !!11) :: Int
    let dex = read (txt !!12) :: Int
    let int = read (txt !!13) :: Int
    -- De alguma forma ou tratar os enums como int ou tentar outra solucao
    let classItem = read (txt !!7) :: Int
    let equippedType = read (txt !!8) :: Int

    AtrbItens dam arm str int dex vit classItem equippedType

buildItem :: [String]  -> Item
buildItem itemtxt =  do
    let id = read (itemtxt !!0) :: Int
    let name = itemtxt !!1 :: String
    let description = itemtxt !!2 :: String
    let consumable = trueOrFalse (itemtxt !!3) :: Bool
    let recHPMax = read (itemtxt !!4) :: Int
    let recMPMax = read (itemtxt !!5) :: Int
    let atributes = buildAtributes itemtxt :: AtrbItens
        
    Item id name description consumable recHPMax recMPMax atributes

-- testado
trueOrFalse :: String -> Bool
trueOrFalse string | string == "0" = True
                   | otherwise = False
 
loadAll :: IO [Item]
loadAll = do
    itensTxt <- Database.importFromDB "./ItemDB.txt" 3
    return $ map buildItem itensTxt

getName :: Item -> String
getName item = name item

getRecHPMax :: Item -> Int
getRecHPMax item =  recHPMax item

getRecMPMax :: Item -> Int
getRecMPMax item = recMPMax item




