#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
URL=$(wget -qO- https://api.github.com/repos/lutris/lutris/releases/latest | grep browser_download_url | grep _all.deb | cut -d '"' -f4)

wget -O /tmp/lutris.deb "$URL"

apt install --no-install-recommends -y /tmp/lutris.deb

rm -f /tmp/lutris.deb

cp -a backup/lutris /home/deisy/.local/share/
chown -R deisy:deisy /home/deisy/.local/share/lutris
cp -a backup/lutris /home/loterica/.local/share/
chown -R loterica:loterica /home/loterica/.local/share/lutris
cp -a backup/lutris /home/ricardo/.local/share/
chown -R ricardo:ricardo /home/ricardo/.local/share/lutris
cp -a backup/lutris /home/yuri/.local/share/
chown -R yuri:yuri /home/yuri/.local/share/lutris
#[--------------------------------------------------------------------------------------------]
