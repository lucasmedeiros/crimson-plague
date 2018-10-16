module Stats (
  Stats(..),
  fillStats
) where

-- Stats iniciais
initial_hp = 100
initial_mp = 30
initial_xp = 0
initial_lvl = 1
max_xp = 1000

data Stats = Stats {
  hp :: Int,
  max_hp :: Int,
  mp :: Int,
  max_mp :: Int,
  xp :: Int,
  level :: Int
} deriving (Show)

fillStats :: Stats
fillStats = Stats initial_hp initial_hp initial_mp initial_mp initial_xp initial_lvl
