module Itens.Inventory(
    Equipped(..),
    getDamage,

)where

data Inventory = Equipped(
    weapon :: Item
    armor :: Item
    helmet :: Item
    shield :: Item
    boots :: Item
)

getDamage :: Inventory -> Int
getDamage inventory = damage (weapon Equipped)

getArmor :: Inventory -> Int
getArmor armor = (arm (armor Equipped)) + (arm (shield Equipped)) + (arm (helmet Equipped))

--getAgility

--getInteligence :: Inventory -> Int
--getInteligence inteligence = (inventory)






