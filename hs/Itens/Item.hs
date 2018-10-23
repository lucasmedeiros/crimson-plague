module Itens.Item(
    AtrbItens(..),
    Item(..),
    generateAtributes,
    buildItens,
    getName,
    getRecHPMax,
    getRecMPMax,

)where

-- Tipo equipavel 
-- NEQUIPAVEL = 0, ARMA,ARMADURA,BOTAS,CAPACETE,ESCUDO

-- classe equipavel
-- GUERREIRO = 1,MAGO, LADINO, TODOS

data Item = AtrbItens(
    dam :: Int,
    arm :: Int,
    str :: Int,
    int :: Int,
    dex :: Int,
    vit :: Int,
    classItem :: Int,
    equippedType :: Int,
) deriving (Show)

data Item = Item(
    id :: Int,
    name :: String,
    description :: String,
    sell :: Int,
    consumable :: Bool,
    recHPMax :: Int,
    recMPMax :: Int,
    atrb :: AtrbItens
) deriving (Show)

generateAtributes :: [String] -> AtrbItens
generateAtributes txt = do
    let dam = read (txt !!1) :: Int
    let arm = read (txt !!2) :: Int
    let str = read (txt !!3) :: Int
    let vit = read (txt !!4) :: Int
    let dex = read (txt !!5) :: Int
    let int = read (txt !!6) :: Int
    -- De alguma forma ou tratar os enums como int ou tentar outra solucao
    let classItem = read (txt !!7) :: Int
    let equippedType = read (txt !!8) :: Int

    AtrbItens dam arm str int dex vit classItem equippedType

BuildItem :: [String] -> [String] -> Item
BuildItem Itemtxt atrbtxt =  do
    let id = read (Itemtxt !!0) :: Int
    let name = Itemtxt !!1 :: String
    let description = Itemtxt !!2 :: String
    let sell = read (Itemtxt !!6) :: Int
    let consumable = Itemtxt !!3 :: Bool
    let recHPMax = read (Itemtxt !!4) :: Int
    let recMPMax = read (Itemtxt !!5) :: Int
    let atrb = generateAtributes atrbtxt :: AtrbItens
    
    Item id name description sell consumable recHPMax recMPMax atrb

loadAllItens :: IO [Item]
loadAllItens = do
    itensTxt <- Database.importFromDB "../db/itens_db.txt" 3
    atrbTxt <- Database.importFromDB "../db/atributos_itens_db.txt" 4
    return $ map BuildItem itensTxt atrbTxt

getName :: Item -> String
getName Item = name Item

getRecHPMax :: Item -> Int
getRecHPMax Item =  recHPMax Item

getRecMPMax :: Item -> Int
getRecMPMax Item = recMPMax Item




