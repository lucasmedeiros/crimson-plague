module Itens.Inventory(
   	Equipped(..),
    Bag(..),
   	initializeSlot,

)where

import Data.List
import Data.Maybe
import qualified DataBase
import Itens.Item (loadAllItens)
import qualified Util (convertStringToInt)

allItensFromBD = loadAllItens


data Inventory = Equipped(
    weapon :: Item,
    armor :: Item,
    helmet :: Item,
    shield :: Item,
    boots :: Item
)deriving (Show)

data Inventory = Inventory(
    bagSize :: Int,
    slots :: [Int],
    classCharacter :: Int,
    qtdItens :: [Int],
    itensEquipped :: Equipped,
    money :: Int,
)deriving (Show)

generateInventory :: Int -> Inventory
generateInventory classType = do
	Inventory 5 itens classType qtd equipped 0
	where 
		arq = importFromDB "./inventory.txt" 4
		itens = convertStringToInt (arq !!0)
		qtd = convertStringToInt (arq !!2)
		equipped = initializeEquipped convertStringToInt (arq !!1)


initializeEquippd :: [Int] -> Equipped
initializeEquiped itens = do
	Equipped weapon armor helmet shield boots
	where
		weapon = allItensFromBD !! (itens !!0) :: Item
		armor = allItensFromBD !! (itens !!1) :: Item
		helmet = allItensFromBD !! (itens !!2) :: Item
		shield = allItensFromBD !! (itens !!3) :: Item
		boots = allItensFromBD !! (itens !!4) :: Item


getEmptySpace :: [Int] -> Int
getEmptySpace bag = fromJust $ elemIndex 34 bag 

qtdItensInBag :: Inventory -> Int
qtdItensInBag inventory = sum(qtdItens inventory)

haveEmptySlot :: Inventory -> Bool
haveEmptySlot inventory = isNothing (elemIndex 34 (slots inventory))


addItem :: Inventory -> Int -> Inventory
addItem inv id
	| isNothing == False = inv
	| otherwise = do
		let EmptyIndex = getEmptySpace inv 









