module Itens.Inventory(
    Inventory,
   	addItem,
   	removeItem,
   	startInventory,
) where

import qualified Database as Database
import qualified Itens.Item as Item
import Data.List
import Data.Maybe


{-roles = ["mago", "guerreiro", "ladino"]
mago = "mago"
guerreiro = "guerreiro"
ladino = "ladino"-}

data Inventory = Inventory{
    slots :: [Int],
    classCharacter :: Int,
    qtdItens :: [Int],
    itensEquipped :: [Int]
} deriving (Show)

-- Passa como parametro a classe do personagem
startInventory :: Int -> Inventory
startInventory classType = do
	Inventory itens classType qtd equipped
	where 
		itens = [34,34,34,34,34] :: [Int]
		qtd = [0,0,0,0,0] :: [Int]
		weaponId = getClassWeapon classType :: Int
		equipped = [weaponId,35,39,34,24] :: [Int]

getClassWeapon :: Int -> Int
getClassWeapon classe
			 | classe == 1 =  29
			 | classe == 2 =  36
			 | otherwise = 37


getItem :: Int -> IO Item.Item
getItem id =  do
	allItensFromBD <- Item.loadAll
	item <- allItensFromBD !! id :: IO Item.Item
	return item
	

-- testado
getEmptySpace :: [Int] -> Maybe Int
getEmptySpace bag = elemIndex 34 bag 

-- testado
qtdItensInBag :: Inventory -> Int
qtdItensInBag inventory = sum(qtdItens inventory)

--testado
isNotFull :: Inventory -> Bool
isNotFull inventory = (isNothing (getEmptySpace (slots inventory))) 


addItem :: Inventory -> Int -> Inventory
addItem inventory id 
		| isNotFull inventory == True = inventory 
		| otherwise = redirectAdd inventory id

redirectAdd :: Inventory -> Int -> Inventory
redirectAdd inventory id
	   | constainsValue (slots inventory) id == True = addExistentItem inventory id
	   | otherwise = addNewItem inventory id



addExistentItem :: Inventory -> Int -> Inventory
addExistentItem inventory id = do
				Inventory  (slots inventory) actualClassCharacter newQtds actualItensEquipped
				where
				index = fromJust $ (elemIndex id (slots inventory)) :: Int
				actualQtd = (qtdItens inventory) !! index :: Int
				newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd + 1) index :: [Int]
				actualClassCharacter = (classCharacter inventory) :: Int
				actualItensEquipped  = (itensEquipped inventory) :: [Int]

addNewItem :: Inventory -> Int -> Inventory
addNewItem inventory id = do
				Inventory  newSlots actualClassCharacter newQtds actualItensEquipped
				where
				newSlots =  addItemInBag (slots inventory) id :: [Int]
				index = fromJust $ (getEmptySpace (slots inventory)) :: Int
				actualQtd = (qtdItens inventory) !! index :: Int
				newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd + 1) index :: [Int]
				actualClassCharacter = (classCharacter inventory) :: Int
				actualItensEquipped  = (itensEquipped inventory) :: [Int]



removeItem :: Inventory -> Int -> Inventory
removeItem inventory id | constainsValue (slots inventory) id == False = inventory
									 | otherwise = do
									 		let index = searchValueInList (slots inventory) 0 id :: Int
									 		redirectRemove inventory id index

redirectRemove :: Inventory -> Int -> Int -> Inventory
redirectRemove inventory id index | ((qtdItens inventory) !!index) == 1 = removeAloneItem inventory id index
							| otherwise = removeNotAloneItem inventory id index

removeAloneItem :: Inventory -> Int -> Int -> Inventory
removeAloneItem inventory id index = do
						Inventory  newSlots actualClassCharacter newQtds actualItensEquipped
						where
						newSlots =  addItemInEspecificPosition (slots inventory) 34 index :: [Int]
						actualQtd = (qtdItens inventory) !! index :: Int
						newQtds = addItemInEspecificPosition (qtdItens inventory) 0 index :: [Int]
						actualClassCharacter = (classCharacter inventory) :: Int
						actualItensEquipped  = (itensEquipped inventory) :: [Int]


removeNotAloneItem :: Inventory -> Int ->Int-> Inventory
removeNotAloneItem inventory id index = do
						Inventory  nslots actualClassCharacter newQtds actualItensEquipped
						where
						nslots =  (slots inventory) :: [Int]
						actualQtd = (qtdItens inventory) !! index :: Int
						newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd - 1) index :: [Int]
						actualClassCharacter = (classCharacter inventory) :: Int
						actualItensEquipped  = (itensEquipped inventory) :: [Int]

{-
equipItem :: Inventory -> Int -> Inventory
equipItem inventory indice = do-}
						



										  
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

-- Ajudas --
--testado

addItemInBag :: [Int] -> Int -> [Int]
addItemInBag [] id = []
addItemInBag (x:xs) id | x == 34 = id:xs
						| otherwise = x:addItemInBag xs id

-- testado
addItemInEspecificPosition :: [Int] -> Int -> Int -> [Int]
addItemInEspecificPosition [] value index = []
addItemInEspecificPosition (x:xs) value index | index == 0 = (value:xs)
										  	  | otherwise = x:(addItemInEspecificPosition xs value (index-1))


-- testado
constainsValue :: [Int] -> Int-> Bool
constainsValue (x:xs) value | searchValueInList (x:xs) 0 value == (-1) = False
					 		| otherwise = True

-- testado
searchValueInList :: [Int] -> Int -> Int -> Int
searchValueInList [] index value= (-1)
searchValueInList (x:xs) index value | value == x = index
									 | otherwise = searchValueInList xs (index+1) value


