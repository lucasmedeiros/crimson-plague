module Itens.Inventory(
    Equipped(..),
    Bag(..),
    qtdItensInBag,
    getDamage,
    getArmor,
    getQtdItens,
    qtdEmpty

)where

data Inventory = Equipped(
    weapon :: Item,
    armor :: Item,
    helmet :: Item,
    shield :: Item,
    boots :: Item
)deriving (Show)

data Inventory = Bag(
    bagSize :: Int,
    allItens :: [Item],
    bag :: [Item],
    classCharacter :: Int,
    qtdItens :: [Int],
    itensEquipped :: Equipped,
    money :: Int

)deriving (Show)

qtdItensInBag :: [Int] -> Int
qtdItensInBag qtd = sum(qtd)

getDamage :: Inventory -> Int
getDamage inventory = damage (weapon Equipped)

getArmor :: Inventory -> Int
getArmor inventory = (arm (armor Equipped)) + (arm (shield Equipped)) + (arm (helmet Equipped))

getQtdItens :: Inventory -> Int
getQtdItens inventory = money Bag

qtdEmpty :: Inventory -> Int
qtdEmpty inventory = (bagSize Bag) - qtdItensInBag (qtdItens Bag)

--getAgility

--getInteligence :: Inventory -> Int
--getInteligence inteligence = (inventory)






