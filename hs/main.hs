import qualified CharInfo.Sheet as Sheet
import qualified CharInfo.Spell as Spells
import qualified Enemies.Monsters as Monsters
-- import qualified Itens.Item as Item

main = do
  character <- Sheet.createCharacter
  -- Inicializa lista de habilidades
  spells <- Spells.loadAll
  -- Inicializa lista de monstros
  monsters <- Monsters.getMonsters

  -- Inicializa lista de itens (not tested yet)
  -- itens <- Item.loadAllItens
  return character
