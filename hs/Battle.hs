module Battle(
    iniciaBatalha
) where

import Util

type Name = String
type Hp = Int
type Atk = Int
type Def = Int

type Monster = (Name, Hp, Atk, Def)
type Character = (Name, Hp, Atk, Def)
-- definindo os tipos para facilitar, ja que
-- a implementaçao não está completa ainda

monsterZeroHP :: Monster -> Bool
monsterZeroHP (n, h, a, d) | (h == 0)  = True
                           | otherwise = False

charZeroHP :: Character -> Bool
charZeroHP (n, h, a, d) | (h == 0)  = True
                        | otherwise = False

--ainda
batalhaFinalizada :: Monster -> Character -> Bool
batalhaFinalizada (nM, hM, aM, dM) (nC, hC, aC, dC) | (monsterZeroHP == True) = True
                                                    | (charZeroHP == True)    = True
                                                    | otherwise               = False

-- a

iniciaBatalha :: Monster -> Character -> Bool
iniciaBatalha (nM, hM, aM, dM) (nC, hC, aC, dC) | (batalhaFinalizada == False)