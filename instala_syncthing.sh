#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
USERNAME="admin"
PASSWORD="1532"
CONFIG="/var/lib/syncthing/config.xml"
#[--------------------------------------------------------------------------------------------]
mkdir -p /etc/apt/keyrings
wget -q -O /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list
#[--------------------------------------------------------------------------------------------]
apt update
apt install --no-install-recommends -y syncthing
#[--------------------------------------------------------------------------------------------]
useradd -r -s /usr/sbin/nologin syncthing || true
mkdir -p /var/lib/syncthing
chown syncthing:syncthing /var/lib/syncthing
#[--------------------------------------------------------------------------------------------]
cat <<EOF > /etc/systemd/system/syncthing.service
[Unit]
Description=Syncthing Daemon (system-wide)
After=network.target

[Service]
User=syncthing
ExecStart=/usr/bin/syncthing -home=/var/lib/syncthing
Restart=on-failure
SuccessExitStatus=3 4

[Install]
WantedBy=multi-user.target
EOF
#[--------------------------------------------------------------------------------------------]
systemctl daemon-reexec
systemctl enable --now syncthing

sleep 5

systemctl stop syncthing

sed -i 's|<address>127\.0\.0\.1:8384</address>|<address>0.0.0.0:8384</address>|' "$CONFIG"

HASH=$(syncthing generate --gui-password "$PASSWORD")

sed -i '/<gui /,/<\/gui>/d' "$CONFIG"
sed -i "/<\/configuration>/i \  <gui enabled=\"true\" tls=\"false\">\n    <user>${USERNAME}</user>\n    <password>${HASH}</password>\n  </gui>" "$CONFIG"

systemctl start syncthing
#[--------------------------------------------------------------------------------------------]
echo ""
echo "[→] Interface web: http://IP_DO_SERVIDOR:8384"
echo "[→] Usuário: $USERNAME"
echo "[→] Senha: $PASSWORD"
#[--------------------------------------------------------------------------------------------]
