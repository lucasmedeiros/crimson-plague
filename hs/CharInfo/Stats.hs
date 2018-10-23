module CharInfo.Stats (
  Stats(..),
  fillStats,
  increaseMP,
  increaseHP,
  addXP
) where

-- Stats iniciais
initialHP = 100
initialMP = 30
initialXP = 0
initialLVL = 1
xpToLevelUp = 100

data Stats = Stats {
  hp :: Int,
  max_hp :: Int,
  mp :: Int,
  max_mp :: Int,
  xp :: Int,
  level :: Int
} deriving (Show)

increaseMP :: Int -> Stats -> Stats
increaseMP num stats = Stats (hp stats) (max_hp stats) ((mp stats) + num) (max_mp stats) (xp stats) (level stats)

increaseHP :: Int -> Stats -> Stats
increaseHP num stats = Stats ((hp stats) + num) (max_hp stats) (mp stats) (max_mp stats) (xp stats) (level stats)

addLevel :: Int -> Stats -> Stats
addLevel n stats = Stats (hp stats) (max_hp stats) (mp stats) (max_mp stats) (xp stats) ((level stats) + n)

setXP :: Int -> Stats -> Stats
setXP n stats = Stats (hp stats) (max_hp stats) (mp stats) (max_mp stats) n (level stats)

addXP :: Int -> Stats -> Stats
addXP amount stats = do
  let newXP = amount + (xp stats)
  if (newXP >= xpToLevelUp) then do
    let remnant = newXP `mod` xpToLevelUp
    let levelsGained = newXP `div` xpToLevelUp
    setXP remnant (addLevel levelsGained stats)
  else setXP newXP stats

fillStats :: Stats
fillStats = Stats initialHP initialHP initialMP initialMP initialXP initialLVL
