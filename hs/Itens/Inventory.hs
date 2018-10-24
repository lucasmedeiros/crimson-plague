module Itens.Inventory(
   	Equipped(..),
    Inventory(..),
   	addItem,
   	getEmptySpace,
   	qtdItensInBag,
   	addItemInList,
   	addItemInEspecificPosition,
   	initializeEquipped,
   	startInventory,
   	haveEmptySlot,
   {-	shiftList,
   	lastToFront,
-}
) where

import Data.List
import Data.Maybe
import qualified Database
import Itens.Item 
import Util (convertStringToInt)


{-roles = ["mago", "guerreiro", "ladino"]
mago = "mago"
guerreiro = "guerreiro"
ladino = "ladino"-}


data Equipped = Equipped {
    weapon :: Item,
    armor :: Item,
    helmet :: Item,
    shield :: Item,
    boots :: Item
} deriving (Show)

data Inventory = Inventory{
    slots :: [Int],
    classCharacter :: Int,
    qtdItens :: [Int],
    itensEquipped :: Equipped
} deriving (Show)

-- Passa como parametro a classe do personagem
startInventory :: Int -> Inventory
startInventory classType = do
	Inventory itens classType qtd equipped
	where 
		itens = [34,34,34,34,34]
		qtd = [0,0,0,0,0]
		equipped = initializeEquipped classType


initializeEquipped :: Int -> Equipped
initializeEquipped classe = do

	let weapon = getClassWeapon classe
	let armor = getItem 35 ::  Item
	let helmet = getItem 39 ::  Item
	let shield = getItem 34 ::  Item
	let boots = getItem 24 ::  Item

	Equipped weapon armor helmet shield boots


getClassWeapon :: Int -> Item
getClassWeapon classe
			 | classe == 1 = getItem 29
			 | classe == 2 = getItem 36
			 | otherwise = getItem 37

getIOItem :: Int -> IO Item
getIOItem id =  do
	allItensFromBD <- loadAllItens
	let item = allItensFromBD !! id
	item

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
				Inventory  newSlots actualClassCharacter newQtds actualItensEquipped
			where
				newSlots =  addItemInList (slots inventory) id :: [Int]
				index = fromJust $ (getEmptySpace (slots inventory)) :: Int
				actualQtd = (qtdItens inventory) !! index :: Int
				newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd + 1) index :: [Int]
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

-- Precisa lidar com o caso de ter mais de um item igual armazenado
removerItemDoInventario :: Inventory -> Int -> Inventory
removerItemDoInventario inventory id | constainsValue (slots inventory) id == False = inventory
									 | otherwise = do
									 		Inventory  newSlots actualClassCharacter newQtds actualItensEquipped
										where
											index = searchValueInList (slots inventory) id :: Int
											newSlots =  addItemInEspecificPosition (slots inventory) 34 index :: [Int]
											actualQtd = (qtdItens inventory) !! index :: Int
											newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd - 1) index :: [Int]
											actualClassCharacter = (classCharacter inventory) :: Int
											actualItensEquipped  = (itensEquipped inventory) :: Equipped



-- testado
constainsValue :: [Int] -> Int-> Bool
constainsValue (x:xs) value | searchValueInList (x:xs) 0 value == (-1) = False
					 | otherwise = True

-- testado
searchValueInList :: [Int] -> Int -> Int -> Int
searchValueInList [] index value= (-1)
searchValueInList (x:xs) index value | value == x = index
									 | otherwise = searchValueInList xs (index+1) value
										  
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






