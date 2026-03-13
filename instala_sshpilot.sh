#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
wget https://github.com/mfat/sshpilot/releases/download/v4.7.9/sshpilot_4.7.9-1_all.deb -O /tmp/sshpilot.deb

apt install --no-install-recommends -y /tmp/sshpilot.deb

rm -f /tmp/sshpilot.deb
#[--------------------------------------------------------------------------------------------]
