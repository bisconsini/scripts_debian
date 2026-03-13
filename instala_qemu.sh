#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
apt install -y --no-install-recommends gir1.2-spiceclientgtk-3.0 qemu-system-gui qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon libvirt-daemon-system ovmf virt-manager

virsh net-autostart default
systemctl restart libvirtd

rm -rf /usr/share/applications/remote-viewer.desktop
#[--------------------------------------------------------------------------------------------]
