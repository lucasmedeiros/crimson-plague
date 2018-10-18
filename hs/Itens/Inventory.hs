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

data Inventory = ItensBag(
    slot1 :: Item,
    slot2 :: Item,
    slot3 :: Item,
    slot4 :: Item,
    slot5 :: Item
)deriving (Show)

data Inventory = Bag(
    bagSize :: Int,
    allItens :: [Item],
    itens :: ItensBag,
    classCharacter :: Int,
    qtdItens :: [Int],
    itensEquipped :: Equipped,
    money :: Int

)deriving (Show)

fillInitialItensBag :: [Item] -> ItensBag
fillInitialItensBag inventory itens = do
    let slot1 = itens !!30
    let slot2 = itens !!30
    let slot3 = itens !!30
    let slot4 = itens !!30
    let slot5 = itens !!30

    ItensBag slot1 slot2 slot3 slot4 slot5

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






