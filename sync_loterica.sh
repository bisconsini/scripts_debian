#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
rsync -avz --delete -e ssh /arquivos/loterica/ loterica@192.168.1.50:/arquivos/loterica/
if [ $? -eq 0 ]; then
    echo "Sincronização concluída com sucesso."
else
    echo "Ocorreu um erro durante a sincronização."
fi
#[--------------------------------------------------------------------------------------------]
