#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
wget https://github.com/emanuelescarabattoli/xstl/releases/download/v1.0.6/Xstl_1.0.6_amd64.deb -O /tmp/xstl.deb

apt install --no-install-recommends -y /tmp/xstl.deb

rm -f /tmp/xstl.deb
#[--------------------------------------------------------------------------------------------]
