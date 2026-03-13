#!/bin/bash

set -e
# ============================================================
# DEISY
# ============================================================
mkdir -p /home/deisy/.config/brave-wa
mkdir -p /home/deisy/.local/share/applications
mkdir -p /home/deisy/.local/share/icons

wget -q -O /home/deisy/.local/share/icons/whatsapp.png https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/512px-WhatsApp.svg.png

cat <<EOF > /home/deisy/.local/share/applications/whatsapp.desktop
[Desktop Entry]
Name=WhatsApp
Exec=brave-browser --user-data-dir=/home/deisy/.config/brave-wa --app=https://web.whatsapp.com
Icon=/home/deisy/.local/share/icons/whatsapp.png
Type=Application
Categories=Network;
StartupWMClass=Brave-browser
EOF

chmod +x /home/deisy/.local/share/applications/whatsapp.desktop
chown -R deisy:deisy /home/deisy/.local /home/deisy/.config

# ============================================================
# LOTERICA
# ============================================================
mkdir -p /home/loterica/.config/brave-wa
mkdir -p /home/loterica/.local/share/applications
mkdir -p /home/loterica/.local/share/icons

wget -q -O /home/loterica/.local/share/icons/whatsapp.png https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/512px-WhatsApp.svg.png

cat <<EOF > /home/loterica/.local/share/applications/whatsapp.desktop
[Desktop Entry]
Name=WhatsApp
Exec=brave-browser --user-data-dir=/home/loterica/.config/brave-wa --app=https://web.whatsapp.com
Icon=/home/loterica/.local/share/icons/whatsapp.png
Type=Application
Categories=Network;
StartupWMClass=Brave-browser
EOF

chmod +x /home/loterica/.local/share/applications/whatsapp.desktop
chown -R loterica:loterica /home/loterica/.local /home/loterica/.config

# ============================================================
# RICARDO
# ============================================================
mkdir -p /home/ricardo/.config/brave-wa
mkdir -p /home/ricardo/.local/share/applications
mkdir -p /home/ricardo/.local/share/icons

wget -q -O /home/ricardo/.local/share/icons/whatsapp.png https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/512px-WhatsApp.svg.png

cat <<EOF > /home/ricardo/.local/share/applications/whatsapp.desktop
[Desktop Entry]
Name=WhatsApp
Exec=brave-browser --user-data-dir=/home/ricardo/.config/brave-wa --app=https://web.whatsapp.com
Icon=/home/ricardo/.local/share/icons/whatsapp.png
Type=Application
Categories=Network;
StartupWMClass=Brave-browser
EOF

chmod +x /home/ricardo/.local/share/applications/whatsapp.desktop
chown -R ricardo:ricardo /home/ricardo/.local /home/ricardo/.config

# ============================================================
# YURI
# ============================================================
mkdir -p /home/yuri/.config/brave-wa
mkdir -p /home/yuri/.local/share/applications
mkdir -p /home/yuri/.local/share/icons

wget -q -O /home/yuri/.local/share/icons/whatsapp.png https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/512px-WhatsApp.svg.png

cat <<EOF > /home/yuri/.local/share/applications/whatsapp.desktop
[Desktop Entry]
Name=WhatsApp
Exec=brave-browser --user-data-dir=/home/yuri/.config/brave-wa --app=https://web.whatsapp.com
Icon=/home/yuri/.local/share/icons/whatsapp.png
Type=Application
Categories=Network;
StartupWMClass=Brave-browser
EOF

chmod +x /home/yuri/.local/share/applications/whatsapp.desktop
chown -R yuri:yuri /home/yuri/.local /home/yuri/.config
