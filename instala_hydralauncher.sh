#!/bin/sh

set -e

echo "Baixando informações da versão mais recente do Hydra Launcher..."

URL=$(wget -qO- https://api.github.com/repos/hydralauncher/hydra/releases/latest \
  | grep browser_download_url \
  | grep amd64.deb \
  | cut -d '"' -f 4)

if [ -z "$URL" ]; then
    echo "Não foi possível encontrar o .deb amd64."
    exit 1
fi

echo "Baixando pacote..."
wget -O /tmp/hydra-launcher.deb "$URL"

echo "Instalando..."
sudo apt install --no-install-recommends -y /tmp/hydra-launcher.deb

echo "Limpeza..."
rm -f /tmp/hydra-launcher.deb

echo "Hydra Launcher instalado com sucesso."

echo "Fontes para download:

https://hydralinks.pages.dev/sources/fitgirl.json

https://raw.githubusercontent.com/Wkeynhk/RuTracker-Linux/refs/heads/main/rutrackerlinux.json

https://ggvv13.github.io/Linux-Games.json"

