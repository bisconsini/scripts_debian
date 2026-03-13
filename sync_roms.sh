#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
rsync -avz --delete -e ssh /publicos/roms/ ricardo@192.168.1.50:/publicos/roms/
if [ $? -eq 0 ]; then
    echo "Sincronização concluída com sucesso."
else
    echo "Ocorreu um erro durante a sincronização."
fi
#[--------------------------------------------------------------------------------------------]
