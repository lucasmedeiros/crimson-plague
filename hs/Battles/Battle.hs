module Battles.Battle(
    startBattle
) where

import Util
import Enemies.Monsters
import CharInfo.Sheet

-- algumas constantes (evitando, assim, números mágicos)
zeroHP = 0
d20 = 20
resultMagicDefense = 10
resultEscape = 12
defenseMonster = 3

-- inicia a batalha entre o personagem e um monstro
startBattle :: Character -> Monster -> IO()
startBattle char monster = do 
    clearScreen
    showStartBattleMessage monster
    let hpMonster = Enemies.Monsters.getHp monster
    let hpChar = CharInfo.Sheet.getHP char
    auxStartBattle char monster 

-- função criada para representar um "loop"
auxStartBattle :: Character -> Monster -> IO()
auxStartBattle char monster = do
    showBattleMenu
    option <- Util.getOption
    evaluateOption char monster option

-- exibe a mensagem inicial de batalha
showStartBattleMessage :: Monster -> IO()
showStartBattleMessage monster = do
    let nome = getName (monster)
    putStrLn "BATALHA!"
    putStrLn ("Um "++nome++" se aproxima!")

-- exibe o menu de batalha
showBattleMenu :: IO()
showBattleMenu = do
    putStrLn "1) Atacar"
    putStrLn "2) Fugir"

-- avalia opção escolhida pelo usuário no menu
evaluateOption :: Character -> Monster -> Int -> IO ()
evaluateOption char monster option
    | (option == 1) = attack char monster
    | otherwise     = tryEscape char monster

-- função chamada ao escolher a opção de fuga
-- avalia e exibe mensagens dependendo (se conseguiu fugir ou não)
tryEscape :: Character -> Monster -> IO()
tryEscape char monster = do
    putStrLn "Você tenta fugir e..."
    rollResult <- rollDice(d20)
    if (escaped rollResult)
        then do putStrLn "Escapou..."
    else do
        putStrLn "Não consegue... O monstro está rindo de você..."
        auxStartBattle char monster

-- verifica se foi possível escapar da batalha
escaped :: Int -> Bool
escaped rollResult = (rollResult >= resultEscape)

-- executa um ataque do personagem
attack :: Character -> Monster -> IO ()
attack char monster = do
    rollResult <- rollDice(d20)
    if (miss char monster rollResult) then do
        putStrLn "Errou o ataque... O monstro ri de você..."
        auxStartBattle char monster
    else do
        let damageCharacter = CharInfo.Sheet.calculateDamage (char)
            newMonster = Enemies.Monsters.reduceLife monster damageCharacter
        putStrLn ("Você infligiu um total de " ++ show damageCharacter ++ " danos no monstro!")
        auxStartBattle char newMonster

miss :: Character -> Monster -> Int -> Bool
miss char monster rollResult =
    ((rollResult + damage) < defenseMonster)
        where
            damage = CharInfo.Sheet.calculateDamage char

-- avalia se o monstro chegou a 0HP e o jogador venceu
won :: Character -> Monster -> Bool
won char monster = (hpMonster <= zeroHP) 
                where hpMonster = Enemies.Monsters.getHp monster
