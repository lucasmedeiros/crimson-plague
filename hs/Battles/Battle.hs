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

-- inicia a batalha entre o personagem e um monstro
startBattle :: Character -> Monster -> IO()
startBattle char monster = do 
    clearScreen
    showStartBattleMessage monster
    auxStartBattle char monster 

-- função criada para representar um "loop"
auxStartBattle :: Character -> Monster -> IO()
auxStartBattle char monster = do
    showLife char monster
    showBattleMenu
    option <- Util.getOption
    evaluateOption char monster option

-- exibe a vida do personagem e do monstro
showLife :: Character -> Monster -> IO()
showLife char monster = do
    let hpCharacter = CharInfo.Sheet.getHP (char)
    putStrLn ("Seu HP: "++ show hpCharacter)
    let hpMonster = Enemies.Monsters.getHp (monster)
        monsterName = Enemies.Monsters.getName (monster)
    putStrLn ("HP do "++monsterName++": "++ show hpMonster)
    putStrLn("")

-- exibe a mensagem inicial de batalha
showStartBattleMessage :: Monster -> IO()
showStartBattleMessage monster = do
    let monsterName = Enemies.Monsters.getName (monster)
    putStrLn "BATALHA!"
    putStrLn ("Um "++monsterName++" se aproxima!")

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
        monsterAttack char monster

-- verifica se foi possível escapar da batalha
escaped :: Int -> Bool
escaped rollResult = (rollResult >= resultEscape)

-- executa um ataque do monstro
monsterAttack :: Character -> Monster-> IO()
monsterAttack char monster = do
    rollResult <- rollDice(d20)
    let charDEF = CharInfo.Sheet.calculateDefense char
        monsterDMG = calculateMonsterDMG monster rollResult
    putStrLn "O monstro se prepara para um ataque..."
    if (monsterDMG >= charDEF) then do
        putStrLn ("E inflige um total de "++ show monsterDMG ++ " danos a você!")
        let newChar = CharInfo.Sheet.takeDamage monsterDMG char
        charDefeated newChar monster
    else do
        putStrLn ("E erra miseravelmente...")
        auxStartBattle char monster

-- executa um ataque do personagem
attack :: Character -> Monster -> IO()
attack char monster = do
    rollResult <- rollDice(d20)
    if (miss char monster rollResult) then do
        putStrLn "Errou o ataque... O monstro ri de você..."
        auxStartBattle char monster
    else do
        let damageCharacter = CharInfo.Sheet.calculateDamage (char)
            newMonster = Enemies.Monsters.reduceLife monster damageCharacter
        putStrLn ("Você infligiu um total de " ++ show damageCharacter ++ " danos no monstro!")
        monsterDefeated char newMonster

-- faz o cálculo para o dano do monstro
calculateMonsterDMG :: Monster -> Int -> Int
calculateMonsterDMG monster rollResult = monsterDMG + rollResult
                where monsterDMG = Enemies.Monsters.getDmg monster

-- verifica se o monstro foi derrotado
monsterDefeated :: Character -> Monster -> IO()
monsterDefeated char monster = do
    if (won monster) then do
        putStrLn "VITÓRIA!"
    else monsterAttack char monster

charDefeated :: Character -> Monster -> IO()
charDefeated char monster = do
    if (lose char) then
        putStrLn "DERROTADO!"
    else auxStartBattle char monster

-- verifica se o personagem errou ou não o ataque
miss :: Character -> Monster -> Int -> Bool
miss char monster rollResult =
    ((rollResult + damage) < monsterDEF)
        where
            damage = CharInfo.Sheet.calculateDamage char
            monsterDEF = Enemies.Monsters.getCa monster

-- avalia se o monstro chegou a 0HP e o jogador venceu
won :: Monster -> Bool
won monster = (hpMonster <= zeroHP) 
                where hpMonster = Enemies.Monsters.getHp monster

-- avalia se o personagem chegou a 0HP e perdeu
lose :: Character -> Bool
lose char = (hpCharacter <= zeroHP)
            where hpCharacter = CharInfo.Sheet.getHP char