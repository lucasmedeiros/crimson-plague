module Itens.Inventory(
   	Equipped(..),
    Bag(..),
   	initializeSlot,
   	addItem,
   	getEmptySpace,
   	qtdItensInBag,
   	addItemInList,
   	addItemInEspecificPosition,
   {-	shiftList,
   	lastToFront,
-}
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


-- testado
getEmptySpace :: [Int] -> Maybe Int
getEmptySpace bag = elemIndex 34 bag 

-- testado
qtdItensInBag :: Inventory -> Int
qtdItensInBag inventory = sum(qtdItens inventory)

--testado
haveEmptySlot :: Inventory -> Bool
haveEmptySlot inventory = isNothing (elemIndex 34 (slots inventory))


addItem :: Inventory -> Int -> Inventory
addItem inventory id
		| haveEmptySlot inventory == False = inventory 
		| otherwise = do
			Inventory actualBagSize newSlots actualClassCharacter newQtds actualItensEquipped
			
			where
				newSlots =  addItemInList (slots inventory) id :: [Int]
				index = fromJust $ (getEmptySpace slots inventory) :: Int
				actualQtd = (qtdItens inventory) !! index :: Int
				newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd + 1) index :: [Int]
				actualBagSize = (bagSize inventory) :: Int
				actualClassCharacter = (classCharacter inventory) :: Int
				actualItensEquipped  = (itensEquipped inventory) :: Equipped 


--testado
addItemInList :: [Int] -> Int -> [Int]
addItemInList [] id = []
addItemInList (x:xs) id | x == 34 = id:addItemInList xs id
						| otherwise = x:addItemInList xs id

-- testado
addItemInEspecificPosition :: [Int] -> Int -> Int -> [Int]
addItemInEspecificPosition [] value index = []
addItemInEspecificPosition (x:xs) value index | index == 0 = (value:xs)
										  | otherwise = x:(addItemInEspecificPosition xs value (index-1))

										  
{---testado
shiftList :: [Int] -> [Int]
shiftList [] = []
shiftList (x:xs) | x == 34 = lastToFront (x:xs)
				 | otherwise = (x: shiftList xs)


--testado
lastToFront :: [Int] -> [Int]
lastToFront [] = []
lastToFront (x:xs) = lastToFront xs++[x]
 -}






