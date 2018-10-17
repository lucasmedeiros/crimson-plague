import qualified CharInfo.CharacterSheet as Sheet
import qualified CharInfo.Spell as Spells

main = do
  character <- Sheet.createCharacter
  -- Inicializa lista de habilidades
  spells <- Spells.loadAll
  return character
