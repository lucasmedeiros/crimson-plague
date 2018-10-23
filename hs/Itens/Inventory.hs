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
)deriving (Show)

generateInventory :: Int -> Inventory
generateInventory classType = do
	Inventory 5 itens classType qtd equipped
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
		let slots = (slots inv)
		let newSlots = shiftList [(slots !!0), (slots !!1), (slots !!2),(slots !!3), id]
		let classType = (classCharacter inv) 
		let qtd = (qtdItens inv)
		let equipped = (equipped inv)
	
		Inventory 5 newSlots classType qtd equipped



shiftList :: [Int] -> [Int]
shiftList [] = []
shiftList (x:xs) | x == 34 = lastToFront (x:xs)
				 | otherwise = (x: shiftList xs)


lastToFront :: [Int] -> [Int]
lastToFront [] = []
lastToFront (x:xs) = lastToFront xs++[x]
 






