module Battles.Battle(
    startBattle,
    escaped,
    lost
) where

import qualified Enemies.Monsters as Monsters
import qualified CharInfo.Sheet as Sheet
import qualified CharInfo.Spell as Spells
import qualified Itens.Inventory as Inventory
import qualified Itens.Item as Item
import Util (clearScreen, getOption, rollDice)

-- algumas constantes (evitando, assim, números mágicos)
zeroHP :: Int
zeroHP = 0

oneHP :: Int
oneHP = 1

d20 :: Int
d20 = 20

resultMagicDefense :: Int
resultMagicDefense = 10

resultEscape :: Int
resultEscape = 12
-- fim da declaração de constantes!

-- inicia a batalha entre o personagem e um monstro
-- retorna um personagem com as modificações que foram feitas
-- as modificações podem ser: personagem perdeu vida, perdeu mana, etc...
startBattle :: Sheet.Character -> Monsters.Monster -> IO (Sheet.Character, Monsters.Monster)
startBattle char monster = do 
    Util.clearScreen
    showStartBattleMessage monster
    auxStartBattle char monster

-- função criada para representar um "loop"
auxStartBattle :: Sheet.Character -> Monsters.Monster -> IO (Sheet.Character, Monsters.Monster)
auxStartBattle char monster = do
    showLife char monster
    showBattleMenu
    option <- Util.getOption
    if (option < 1 || option > 2) then
        auxStartBattle char monster
    else do
        spells <- Spells.loadAll
        let usable = Sheet.getUsableSpells spells char
        evaluateOption char monster usable option

-- avalia opção escolhida pelo usuário no menu
evaluateOption :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> Int -> IO (Sheet.Character, Monsters.Monster)
evaluateOption char monster spells option
    | (option == 1) = attack char monster spells
    | (option == 2) = openBag char monster
    | otherwise     = tryEscape char monster

-- executa um ataque do personagem
attack :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> IO (Sheet.Character, Monsters.Monster)
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
        analyzeMana char monster spells rollResult

-- analisa se o personagem tem mana para alguma habilidade
analyzeMana :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> Int -> IO (Sheet.Character, Monsters.Monster)
analyzeMana char monster spells rollResult =
    if (hasManaForSpells char spells) then
        magicalAttackOption char monster spells rollResult
    else do
        putStrLn "Não há mana alguma para suas habilidades..."
        putStrLn "Você recupera 1 de MP a cada rodada..."
        let newChar = Sheet.recoverMP char
        monsterAttack newChar monster

-- abre menu de ataque mágico do personagem
magicalAttackOption :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> Int -> IO (Sheet.Character, Monsters.Monster)
magicalAttackOption char monster spells rollResult = do
    putStrLn "Magias disponíveis: "
    showSpellNames spells 0
    option <- Util.getOption
    if (option < 1 || option > (length spells)) then
        magicalAttackOption char monster spells rollResult
    else
        magicalAttack char monster spells rollResult option

-- executa um ataque mágico pelo personagem.
magicalAttack :: Sheet.Character -> Monsters.Monster -> [Spells.Spell] -> Int -> Int -> IO (Sheet.Character, Monsters.Monster)
magicalAttack char monster spells rollResult option = do
    let spellCasted = spells!!(option-1)
    if (Sheet.hasEnoughMana spellCasted char) then do
        tuple <- Sheet.castSpell spellCasted char
        let damageMagicalAttack = fst tuple
            char = snd tuple
            newChar = Sheet.recoverMP char
            newMonster = Monsters.reduceLife monster damageMagicalAttack
        putStrLn ("Você infligiu um total de " ++ show damageMagicalAttack ++ " danos no monstro!")
        monsterDefeated newChar newMonster
    else do
        putStrLn "Sem mana suficiente..."
        putStrLn "Você recupera 1 de MP a cada rodada..."
        let newChar = Sheet.recoverMP char
        monsterAttack newChar monster

-- executa um ataque do monstro
monsterAttack :: Sheet.Character -> Monsters.Monster-> IO (Sheet.Character, Monsters.Monster)
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

-- verifica se o monstro foi derrotado
monsterDefeated :: Sheet.Character -> Monsters.Monster -> IO (Sheet.Character, Monsters.Monster)
monsterDefeated char monster =
    if (won monster) then do
        putStrLn "VITÓRIA!"
        let drop = Monsters.getDrops monster
            newChar = Sheet.addItemInventory drop char
        item <- Inventory.getItem drop
        let dropName = Item.getName item
        putStrLn ("O monstro deixou cair um " ++ dropName)
        return (newChar, monster)
    else monsterAttack char monster

-- Função que verifica se o personagem morreu.
-- Caso ele tenha morrido, retorna um personagem com 1HP
charDefeated :: Sheet.Character -> Monsters.Monster -> IO (Sheet.Character, Monsters.Monster)
charDefeated char monster =
    if (lose char) then do
        putStrLn "DERROTADO!"
        let newChar = Sheet.die char
        return (newChar, monster)
    else auxStartBattle char monster

-- função chamada ao escolher a opção de abrir mochila
openBag :: Sheet.Character -> Monsters.Monster -> IO (Sheet.Character, Monsters.Monster)
openBag char monster = do
    newChar <- Sheet.openBag char
    monsterAttack newChar monster

-- função chamada ao escolher a opção de fuga
-- avalia e exibe mensagens dependendo (se conseguiu fugir ou não)
tryEscape :: Sheet.Character -> Monsters.Monster -> IO (Sheet.Character, Monsters.Monster)
tryEscape char monster = do
    Util.clearScreen
    putStrLn "Você tenta fugir e..."
    rollResult <- Util.rollDice(d20)
    if (escapedDiceResult rollResult)
        then do
        putStrLn "Escapou..."
        return (char, monster)
    else do
        putStrLn "Não consegue... O monstro está rindo de você..."
        monsterAttack char monster

-- exibe a mensagem inicial de batalha
showStartBattleMessage :: Monsters.Monster -> IO()
showStartBattleMessage monster = do
    let monsterName = Monsters.getName (monster)
    putStrLn "BATALHA!"
    putStrLn ("Um "++monsterName++" se aproxima!")

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
    putStrLn "2) Abrir mochila"
    putStrLn "3) Fugir"

-- printa os nomes das magias disponíveis
showSpellNames :: [Spells.Spell] -> Int -> IO()
showSpellNames [] _ = return ()
showSpellNames (x:xs) index = do
    let spellName = Spells.getName x
    putStrLn (show (index + 1) ++ " - " ++ spellName)
    showSpellNames xs (index + 1)

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

-- verifica se foi possível escapar da batalha
escapedDiceResult :: Int -> Bool
escapedDiceResult rollResult = (rollResult >= resultEscape)

-- faz o cálculo para o dano do monstro
calculateMonsterDMG :: Monsters.Monster -> Int -> Int
calculateMonsterDMG monster rollResult = monsterDMG + rollResult
                where monsterDMG = Monsters.getDmg monster

-- verifica se o personagem tem mana para alguma habilidade
hasManaForSpells :: Sheet.Character -> [Spells.Spell] -> Bool
hasManaForSpells _ [] = False
hasManaForSpells char (x:xs) =
    if (Sheet.hasEnoughMana x char) then True
    else hasManaForSpells char xs

-- verifica se o personagem sobreviveu
charSurvived :: Sheet.Character -> Bool
charSurvived char =
    (charHP > oneHP)
    where charHP = Sheet.getHP char

monsterSurvived :: Monsters.Monster -> Bool
monsterSurvived monster =
    (not (monsterHP <= zeroHP))
    where monsterHP = Monsters.getHp monster

-- verifica se o personagem perdeu
lost :: Sheet.Character -> Bool
lost char =
    (charHP == oneHP)
    where charHP = Sheet.getHP char

-- verifica se o personagem abandonou a batalha
escaped :: Sheet.Character -> Monsters.Monster -> Bool
escaped char monster = ((charSurvived char) && (monsterSurvived monster))