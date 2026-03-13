#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
apt update
apt install -y --no-install-recommends wimtools grub2-common grub-pc-bin

cp softwares/woeusb/woeusb /usr/bin/

echo "woeusb --device arquivo.iso /dev/sdx"
#[--------------------------------------------------------------------------------------------]
