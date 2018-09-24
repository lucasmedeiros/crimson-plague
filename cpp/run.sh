#!/bin/bash

# =================================IMPORTANTE=================================
# se não estiver executando, basta você executar o seguinte comando na pasta |
# onde o script está:                                                        |
# $chmod +x run.sh (sem a $)                                                 |
#=============================================================================

echo "Iniciando a criação de arquivo executável do jogo 'Crimson Plague'..."

make
make clean
./crimsonPlague
