module Itens.Inventory(
    Inventory,
   	addItem,
   	removeItem,
   	startInventory,
   	qtdItensInBag,
   	getArm,
   	getStr,
   	getIntel,
   	getDex,
   	equipItem,

) where

import qualified Database as Database
import qualified Itens.Item as Item
import Data.List
import Data.Maybe
import System.IO.Unsafe

---Metodos para implementar
-- imprimeMochila


data Inventory = Inventory{
    slots :: [Int],
    classCharacter :: Int,
    qtdItens :: [Int],
    itensEquipped :: [Int]

} deriving (Show)

--------------------------------- INICIALIZANDO O INVENTÁRIO ---------------------------------

startInventory :: Int -> Inventory
startInventory classType = do
	Inventory itens classType qtd equipped
	where 
		itens = [34,34,34,34,34] :: [Int]
		qtd = [0,0,0,0,0] :: [Int]
		equipped = initialItens classType :: [Int]

		
initialItens :: Int -> [Int]
initialItens classType  | classType == 1 = [34,29,35,24,39,46]
					    | classType == 2 = [34,36,38,24,40,34]
					    | classType == 3 = [34,37,44,24,42,34]



 --------------- Funcionalidades ---------------

equipItem :: Inventory -> Int -> Inventory
equipItem inventory pos = do
					    let id = (slots inventory) !! (pos - 1) :: Int
					    let item = unsafePerformIO (getItem id) :: Item.Item
					    equipItemAux inventory item (pos - 1) id
					   			
addItem :: Inventory -> Int -> Inventory
addItem inventory id 
		| isNotFull inventory == True = inventory 
		| otherwise = redirectAdd inventory id


removeItem :: Inventory -> Int -> Inventory
removeItem inventory id | containsValue (slots inventory) id == False = inventory
									 | otherwise = do
									 		let index = searchValueInList (slots inventory) 0 id :: Int
									 		redirectRemove inventory id index


--------------- Verificacoes ----------------

isEquippable :: Item.Item -> Bool
isEquippable item | Item.getType(item) == 0 = False
				  | otherwise = True
	
--testado
isNotFull :: Inventory -> Bool
isNotFull inventory = (isNothing (getEmptySpace (slots inventory))) 





--------------------- Gets ------------------------

getDamage :: Inventory -> Int
getDamage inventory = do
	let id = (itensEquipped inventory)!! 1 :: Int
	let item = unsafePerformIO (getItem id) :: Item.Item
	let damage = Item.getDamage (item) :: Int
	damage

getIntel :: Inventory -> Int
getIntel inventory = contIntel (itensEquipped inventory) 0

getDex :: Inventory -> Int
getDex inventory = contDex (itensEquipped inventory) 0

getStr :: Inventory -> Int
getStr inventory = contStr (itensEquipped inventory) 0

getArm :: Inventory -> Int
getArm inventory = contArm (itensEquipped inventory) 0

-- testado
getEmptySpace :: [Int] -> Maybe Int
getEmptySpace bag = elemIndex 34 bag 


--- testado
getItem :: Int -> IO Item.Item
getItem id =  do
	allItensFromBD <- Item.loadAll
	item <- allItensFromBD !! (id - 1) :: IO Item.Item
	return item

											  
------------------ Ajudas -------------------------

-- testado
qtdItensInBag :: Inventory -> Int
qtdItensInBag inventory = sum(qtdItens inventory)

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
containsValue :: [Int] -> Int-> Bool
containsValue (x:xs) value | searchValueInList (x:xs) 0 value == (-1) = False
					 		| otherwise = True

-- testado
searchValueInList :: [Int] -> Int -> Int -> Int
searchValueInList [] index value= (-1)
searchValueInList (x:xs) index value | value == x = index
									 | otherwise = searchValueInList xs (index+1) value


contIntel :: [Int] -> Int -> Int
contIntel [] cont = cont 
contIntel (x:xs) cont = do
	let item = unsafePerformIO (getItem x) :: Item.Item
	let newCont = cont + Item.getIntelig (item) :: Int
	contIntel xs newCont

contDex :: [Int] -> Int -> Int
contDex [] cont = cont 
contDex (x:xs) cont = do
	let item = unsafePerformIO (getItem x) :: Item.Item
	let newCont = cont + Item.getIntelig (item) :: Int
	contDex xs newCont

contStr :: [Int] -> Int -> Int
contStr [] cont = cont 
contStr (x:xs) cont = do
	let item = unsafePerformIO (getItem x) :: Item.Item
	let newCont = cont + Item.getIntelig (item) :: Int
	contStr xs newCont

contArm :: [Int] -> Int -> Int
contArm [] cont = cont 
contArm (x:xs) cont = do
	let item = unsafePerformIO (getItem x) :: Item.Item
	let newCont = cont + Item.getIntelig (item) :: Int
	contArm xs newCont


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


redirectAdd :: Inventory -> Int -> Inventory
redirectAdd inventory id
	   | containsValue (slots inventory) id == True = addExistentItem inventory id
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


equipItemAux :: Inventory -> Item.Item -> Int -> Int -> Inventory
equipItemAux inventory item pos id | isEquippable item == False = inventory
								   | otherwise =  do
											let typeEquiped = Item.getType (item) :: Int
											equipItemAux2 inventory typeEquiped id pos

equipItemAux2 :: Inventory -> Int -> Int -> Int-> Inventory
equipItemAux2 inventory typeEquiped id pos = do
							Inventory newSlots nclassCharacter nqtdItens newEquipped
							where
							nqtdItens = (qtdItens inventory) :: [Int]
							nclassCharacter = (classCharacter inventory) :: Int 
							actualItem = (itensEquipped inventory) !! typeEquiped :: Int
						   	newEquipped = addItemInEspecificPosition (itensEquipped inventory) id typeEquiped :: [Int]
						   	newSlots = addItemInEspecificPosition (slots inventory) actualItem pos :: [Int]