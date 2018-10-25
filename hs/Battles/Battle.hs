module Battles.Battle(
    startBattle
) where

import qualified Enemies.Monsters as Monsters
import qualified CharInfo.Sheet as Sheet
import qualified CharInfo.Spell as Spells
import Util (clearScreen, getOption, rollDice)

-- algumas constantes (evitando, assim, números mágicos)
zeroHP :: Int
zeroHP = 0

d20 :: Int
d20 = 20

resultMagicDefense :: Int
resultMagicDefense = 10

resultEscape :: Int
resultEscape = 12

-- inicia a batalha entre o personagem e um monstro
startBattle :: Sheet.Character -> Monsters.Monster -> IO()
startBattle char monster = do 
    Util.clearScreen
    showStartBattleMessage monster
    auxStartBattle char monster 

-- exibe a mensagem inicial de batalha
showStartBattleMessage :: Monsters.Monster -> IO()
showStartBattleMessage monster = do
    let monsterName = Monsters.getName (monster)
    putStrLn "BATALHA!"
    putStrLn ("Um "++monsterName++" se aproxima!")

-- função criada para representar um "loop"
auxStartBattle :: Sheet.Character -> Monsters.Monster -> IO()
auxStartBattle char monster = do
    showLife char monster
    showBattleMenu
    option <- Util.getOption
    spells <- Spells.loadAll
    let usable = Sheet.getUsableSpells spells char
    evaluateOption char monster usable option

-- exibe a vida do personagem e do monstro
showLife :: Sheet.Character -> Monsters.Monster -> IO()
showLife char monster = do
    let hpCharacter = Sheet.getHP (char)
    putStrLn ("Seu HP: "++ show hpCharacter)
    let hpMonster = Monsters.getHp (monster)
        monsterName = Monsters.getName (monster)
    putStrLn ("HP do "++monsterName++": "++ show hpMonster)
    putStrLn("")

-- exibe o menu de batalha
showBattleMenu :: IO()
showBattleMenu = do
    putStrLn "1) Atacar / Lançar Magia"
    putStrLn "2) Fugir"

-- avalia opção escolhida pelo usuário no menu
evaluateOption :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> Int -> IO ()
evaluateOption char monster spells option
    | (option == 1) = attack char monster spells
    | otherwise     = tryEscape char monster

-- função chamada ao escolher a opção de fuga
-- avalia e exibe mensagens dependendo (se conseguiu fugir ou não)
tryEscape :: Sheet.Character -> Monsters.Monster -> IO()
tryEscape char monster = do
    Util.clearScreen
    putStrLn "Você tenta fugir e..."
    rollResult <- Util.rollDice(d20)
    if (escaped rollResult)
        then do putStrLn "Escapou..."
    else do
        putStrLn "Não consegue... O monstro está rindo de você..."
        monsterAttack char monster

-- verifica se foi possível escapar da batalha
escaped :: Int -> Bool
escaped rollResult = (rollResult >= resultEscape)

-- executa um ataque do personagem
attack :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> IO()
attack char monster spells = do
    Util.clearScreen
    rollResult <- Util.rollDice(d20)
    if (null spells) then do
        if (miss char monster rollResult) then do
            putStrLn "Errou o ataque... O monstro ri de você..."
            monsterAttack char monster
        else do
            let damageCharacter = Sheet.calculateDamage (char)
                newMonster = Monsters.reduceLife monster damageCharacter
            putStrLn ("Você infligiu um total de " ++ show damageCharacter ++ " danos no monstro!")
            monsterDefeated char newMonster
    else do
        magicalAttack char monster spells rollResult

-- executa um ataque mágico do personagem
magicalAttack :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> Int -> IO()
magicalAttack char monster spells rollResult = do
    putStrLn "Magias disponíveis: "
    showSpellNames spells 0
    option <- Util.getOption
    let spellCasted = spells!!(option-1)
    if (Sheet.hasEnoughMana spellCasted char) then do
        tuple <- Sheet.castSpell spellCasted char
        let damageMagicalAttack = fst tuple
            newChar = snd tuple
            newMonster = Monsters.reduceLife monster damageMagicalAttack
        putStrLn ("Você infligiu um total de " ++ show damageMagicalAttack ++ " danos no monstro!")
        monsterDefeated newChar newMonster
    else do
        putStrLn ("Sem mana suficiente...")
        monsterAttack char monster


-- executa um ataque do monstro
monsterAttack :: Sheet.Character -> Monsters.Monster-> IO()
monsterAttack char monster = do
    rollResult <- Util.rollDice(d20)
    let charDEF = Sheet.calculateDefense char
        monsterDMG = calculateMonsterDMG monster rollResult
    putStrLn "O monstro se prepara para um ataque..."
    if (monsterDMG >= charDEF) then do
        putStrLn ("E inflige um total de "++ show monsterDMG ++ " danos a você!")
        let newChar = Sheet.takeDamage monsterDMG char
        charDefeated newChar monster
    else do
        putStrLn ("E falha miseravelmente...")
        auxStartBattle char monster

-- printa os nomes das magias disponíveis
showSpellNames :: [Spells.Spell] -> Int -> IO()
showSpellNames [] _ = return ()
showSpellNames (x:xs) i = do
    let spellName = Spells.getName x
    putStrLn (show (i + 1) ++ " - " ++ spellName)
    showSpellNames xs (i + 1)

-- faz o cálculo para o dano do monstro
calculateMonsterDMG :: Monsters.Monster -> Int -> Int
calculateMonsterDMG monster rollResult = monsterDMG + rollResult
                where monsterDMG = Monsters.getDmg monster

-- verifica se o monstro foi derrotado
monsterDefeated :: Sheet.Character -> Monsters.Monster -> IO()
monsterDefeated char monster = do
    if (won monster) then do
        putStrLn "VITÓRIA!"
    else monsterAttack char monster

charDefeated :: Sheet.Character -> Monsters.Monster -> IO()
charDefeated char monster = do
    if (lose char) then
        putStrLn "DERROTADO!"
    else auxStartBattle char monster

-- verifica se o personagem errou ou não o ataque
miss :: Sheet.Character -> Monsters.Monster -> Int -> Bool
miss char monster rollResult =
    ((rollResult + damage) < monsterDEF)
        where
            damage = Sheet.calculateDamage char
            monsterDEF = Monsters.getCa monster

-- avalia se o monstro chegou a 0HP e o jogador venceu
won :: Monsters.Monster -> Bool
won monster = (hpMonster <= zeroHP) 
        where hpMonster = Monsters.getHp monster

-- avalia se o personagem chegou a 0HP e perdeu
lose :: Sheet.Character -> Bool
lose char = (hpCharacter <= zeroHP)
        where hpCharacter = Sheet.getHP char