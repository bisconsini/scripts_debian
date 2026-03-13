#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
echo "== Instalando ferramentas =="
apt update
apt install -y --no-install-recommends ffmpeg mkvtoolnix

echo "== Limpando metadata de MKV (title) =="
find /arquivos/publicos/downloads/temp -type f -iname "*.mkv" -exec mkvpropedit {} --edit info --set "title=" \;

echo "== Limpando metadata de MP4 (todas as tags) =="
find /arquivos/publicos/downloads/temp -type f -iname "*.mp4" -exec sh -c '
for f do
  ffmpeg -y -i "$f" -map_metadata -1 -c copy "${f}.limpo.mp4" &&
  mv "${f}.limpo.mp4" "$f"
done
' sh {} +

echo "== Pronto. Arquivos limpos =="
#[--------------------------------------------------------------------------------------------]
