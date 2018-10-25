module Itens.Inventory(
    Inventory,
   	addItem,
   	startInventory,
   	removerItemDoInventario
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

loadAllItens :: IO [Item]
loadAllItens = do 
	allItensFromBD <- Item.loadAll
	allItensFromBD

getItens :: Int -> Item
getItens id =  do
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
haveEmptySlot inventory = isNothing getEmptySpace (slots inventory) 


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
				actualItensEquipped  = (itensEquipped inventory) :: [Int]




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

removerItemDoInventario :: Inventory -> Int -> Inventory
removerItemDoInventario inventory id | constainsValue (slots inventory) id == False = inventory
									 | otherwise = do
									 		let index = searchValueInList (slots inventory) id :: Int
									 		checkQtd inventory id index

checkQtd :: Inventory -> Int -> Int -> Inventory
checkQtd inventory id index | ((qtdItens inventory) !! index) == 1 = removerItemUnico inventory id
							| otherwise = removerItemNUnico inventory id

removerItemUnico :: Inventory -> Int -> Inventory
removerItemUnico inventory id = do
						Inventory  newSlots actualClassCharacter newQtds actualItensEquipped
						where
						index = searchValueInList (slots inventory) id :: Int
						newSlots =  addItemInEspecificPosition (slots inventory) 34 index :: [Int]
						actualQtd = (qtdItens inventory) !! index :: Int
						newQtds = addItemInEspecificPosition (qtdItens inventory) 0 index :: [Int]
						actualClassCharacter = (classCharacter inventory) :: Int
						actualItensEquipped  = (itensEquipped inventory) :: [Int]


removerItemNUnico :: Inventory -> Int -> Inventory
removerItemNUnico inventory id = do
						Inventory  slots actualClassCharacter newQtds actualItensEquipped
						where
						index = searchValueInList (slots inventory) id :: Int
						slots =  (slots inventory) :: [Int]
						actualQtd = (qtdItens inventory) !! index :: Int
						newQtds = addItemInEspecificPosition (qtdItens inventory) (actualQtd - 1) index :: [Int]
						actualClassCharacter = (classCharacter inventory) :: Int
						actualItensEquipped  = (itensEquipped inventory) :: [Int]

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






