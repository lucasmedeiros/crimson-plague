import qualified CharInfo.Sheet as Sheet
import qualified CharInfo.Spell as Spells
import qualified Enemies.Monsters as Monsters
import qualified Itens.Item as Item
import qualified GameStory.Story as Story

main = do
  character <- Sheet.createCharacter
  -- Inicializa lista de habilidades
  spells <- Spells.loadAll
  -- Inicializa lista de monstros
  monsters <- Monsters.getMonsters

  -- Inicializa lista de itens, mas não é necessario passar como parametro no inventario
  itens <- Item.loadAll
  Story.start character
