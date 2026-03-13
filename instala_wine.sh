#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
dpkg --add-architecture i386
apt update
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
apt update
apt install --install-recommends winehq-stable
#apt install winetricks
#[--------------------------------------------------------------------------------------------]
