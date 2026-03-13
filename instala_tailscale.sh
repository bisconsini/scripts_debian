#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
mkdir -p /etc/apt/keyrings
wget -q -O /etc/apt/keyrings/tailscale-archive-keyring.gpg https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg 
#[--------------------------------------------------------------------------------------------]
echo "deb [signed-by=/etc/apt/keyrings/tailscale-archive-keyring.gpg] https://pkgs.tailscale.com/stable/debian bookworm main" | tee /etc/apt/sources.list.d/tailscale.list
#[--------------------------------------------------------------------------------------------]
apt update
apt install --no-install-recommends -y tailscale
#[--------------------------------------------------------------------------------------------]
tailscale up
#[--------------------------------------------------------------------------------------------]
