#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
apt install --no-install-recommends -y lighttpd net-tools
wget -q -O- https://install.pi-hole.net | bash
systemctl stop lighttpd
nano /etc/lighttpd/lighttpd.conf
systemctl enable lighttpd
systemctl start lighttpd
pihole -a -p
#[--------------------------------------------------------------------------------------------]
