#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

apt install -y --no-install-recommends ./google-chrome-stable_current_amd64.deb

rm -rf google-chrome-stable_current_amd64.deb

update-alternatives --set x-www-browser /usr/bin/google-chrome-stable
update-alternatives --set gnome-www-browser /usr/bin/google-chrome-stable
#[--------------------------------------------------------------------------------------------]
