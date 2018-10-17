module Itens.Item(
    AtrbItens(..),
    Item(..),

)where

data Item = AtrbItens(
    dam :: Int,
    arm :: Int,
    str :: Int,
    int :: Int,
    dex :: Int,
    vit :: Int
) deriving (Show)

data Item = Item(
    id :: Int
    name :: String
    description :: String
    sell :: Int
    consumable :: Bool
    recHPMax :: Int
    recMPMax :: Int
) deriving (Show)


