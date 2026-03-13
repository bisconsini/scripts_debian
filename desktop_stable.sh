#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
#Configura contrib e non-free no sources.list
echo "deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware" > /etc/apt/sources.list
#[--------------------------------------------------------------------------------------------]
#Adiciona repositorio do brave
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list

wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null
#[--------------------------------------------------------------------------------------------]
#Cria script para atualização e limpeza do sistema
cat << 'EOF' > /usr/bin/atualizar
#!/bin/bash

sudo apt update 
sudo apt upgrade -y
sudo apt autoremove -y --purge
sudo apt clean
sudo apt autoclean

sudo rm -rf /vmlinuz.old /initrd.img.old /tmp/* /var/tmp/* /lost+found
EOF

chmod +x /usr/bin/atualizar
#[--------------------------------------------------------------------------------------------]
#Instala aplicativos
apt update && apt upgrade -y

apt install -y --no-install-recommends bash-completion brave-browser gedit gimp gnome-core gnome-shell-extension-prefs gnome-shell-extension-hide-activities gnome-shell-extension-dashtodock gnome-shell-extension-tiling-assistant gzip inkscape libreoffice libreoffice-l10n-pt-br nautilus-admin nautilus-extension-gnome-terminal ncdu openssh-client openssh-server p7zip-full qbittorrent rsync sudo tar ttf-mscorefonts-installer ufw unrar-free unzip vlc vlc-l10n wget zstd
#[--------------------------------------------------------------------------------------------]
#Remove aplicativos
apt remove --purge -y baobab* evolution firefox-esr* gnome-calendar* gnome-contacts* gnome-characters* gnome-clocks* gnome-color-manager* gnome-connections* gnome-font-viewer* gnome-games* gnome-logs* gnome-maps* gnome-music* gnome-software* gnome-sound-recorder* gnome-text-editor* gnome-tweaks gnome-tour* gnome-snapshot* gnome-weather* im-config* malcontent* nm-connection-editor* nautilus-extension-brasero rhythmbox* simple-scan* seahorse* shotwell* synaptic* totem-common* vim* xterm* yelp* 

rm -rf /usr/bin/remote-viewer
rm -rf /usr/share/applications/remote-viewer.desktop
rm -rf /usr/share/applications/nm-connection-editor.desktop
rm -rf /usr/share/applications/org.gnome.Connections.desktop

apt autoremove --purge -y
apt autoclean -y
apt clean -y
#[--------------------------------------------------------------------------------------------]
#Configura firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp comment 'SSH'
ufw allow 6881:6999/tcp comment 'Torrent TCP'
ufw allow 6881:6999/udp comment 'Torrent UDP'
ufw logging off
ufw --force enable
#[--------------------------------------------------------------------------------------------]
#Configura GDM
mkdir -p /var/lib/gdm3/.config

cat > /var/lib/gdm3/.config/monitors.xml << 'EOF'
<monitors version="2">
  <configuration>
    <logicalmonitor>
      <x>0</x>
      <y>0</y>
      <scale>1</scale>
      <primary>yes</primary>
      <monitor>
        <monitorspec>
          <connector>HDMI-1</connector>
          <vendor>unknown</vendor>
          <product>unknown</product>
          <serial>unknown</serial>
        </monitorspec>
        <mode>
          <width>1280</width>
          <height>720</height>
          <rate>60</rate>
        </mode>
      </monitor>
    </logicalmonitor>
  </configuration>
</monitors>
EOF

chown Debian-gdm:Debian-gdm /var/lib/gdm3/.config/monitors.xml
chmod 644 /var/lib/gdm3/.config/monitors.xml

sed -i 's/^# disable-user-list=true/disable-user-list=true/' /etc/gdm3/greeter.dconf-defaults

sed -i '/^\[org\/gnome\/desktop\/a11y\]/a always-show-universal-access-status=false' /etc/gdm3/greeter.dconf-defaults
#[--------------------------------------------------------------------------------------------]
#Restaura arquivo de modelo para novos usuarios
#tar -xvzf backup/skel.tar.gz -C /
#[--------------------------------------------------------------------------------------------]
#Cria usuarios e restaura backup
adduser --disabled-password --gecos "" deisy
adduser deisy sudo
usermod -p "$(openssl passwd -6 1532)" deisy
tar -xzf backup/deisy.tar.gz -C /

adduser --disabled-password --gecos "" loterica
adduser loterica sudo
usermod -p "$(openssl passwd -6 1532)" loterica
tar -xzf backup/loterica.tar.gz -C /

adduser --disabled-password --gecos "" ricardo
adduser ricardo sudo
usermod -p "$(openssl passwd -6 1532)" ricardo
tar -xzf backup/ricardo.tar.gz -C /

adduser --disabled-password --gecos "" yuri
adduser yuri sudo
usermod -p "$(openssl passwd -6 1532)" yuri
tar -xzf backup/yuri.tar.gz -C /
#[--------------------------------------------------------------------------------------------]
#Configura GRUB
sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
update-grub
#[--------------------------------------------------------------------------------------------]
#Configura icones personalizados do sistema
cp -r icones/. /usr/share/applications/
#[--------------------------------------------------------------------------------------------]
#Cria diretorios 
mkdir -p /arquivos
mkdir -p /arquivos/deisy/{backups,documentos}
mkdir -p /arquivos/loterica/{backups,documentos}
mkdir -p /arquivos/ricardo/{backups,documentos}
mkdir -p /arquivos/yuri/{backups,documentos}
mkdir -p /arquivos/publicos/{backups,documentos,downloads,ebooks,emuladores,filmes,imagens,jogos,musicas,series,scripts,softwares,temporarios,videos}

chmod -R 777 /arquivos
#[--------------------------------------------------------------------------------------------]
#Limpa e reinicia o sistema
apt --fix-broken install -y
apt autoremove -y --purge
apt clean
apt autoclean

rm -rf /vmlinuz.old /initrd.img.old /tmp/* /var/tmp/* /lost+found

rm -f /root/.bash_history

shutdown -r now
#[--------------------------------------------------------------------------------------------]
