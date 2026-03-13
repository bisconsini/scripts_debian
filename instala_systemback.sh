#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
url="https://sourceforge.net/projects/systemback-install-pack-1-9-4/files/systemback-install_pack-1.9.4.tar.gz"
#[--------------------------------------------------------------------------------------------]
wget -O systemback.tar.gz "$url"

tar xvf systemback.tar.gz
rm -rf systemback.tar.gz 

cd systemback-install_pack-1.9.4/

chmod +x install.sh
./install.sh

cd ..

rm -rf systemback-install_pack-1.9.4/
rm -rf /usr/share/applications/systemback-kde.desktop
rm -rf /usr/share/applications/systemback.desktop
#[--------------------------------------------------------------------------------------------]
