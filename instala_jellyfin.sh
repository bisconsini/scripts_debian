#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
wget -q -O- https://repo.jellyfin.org/install-debuntu.sh | bash
systemctl enable jellyfin
systemctl start jellyfin
#[--------------------------------------------------------------------------------------------]
