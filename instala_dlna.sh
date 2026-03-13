#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
apt install --no-install-recommends -y minidlna
#[--------------------------------------------------------------------------------------------]
systemctl stop minidlna
#[--------------------------------------------------------------------------------------------]
echo "friendly_name=Jack Sparrow

media_dir=V,/multimidia/filmes
media_dir=V,/multimidia/series
media_dir=A,/multimidia/musicas
media_dir=P,/multimidia/imagens

root_container=B
inotify=yes
port=8200

user=minidlna
db_dir=/var/cache/minidlna
log_dir=/var/log/minidlna
media_dir=/var/lib/minidlna
log_level=warn" > /etc/minidlna.conf
#[--------------------------------------------------------------------------------------------]
chown -R minidlna:minidlna /multimidia
chmod -R 777 /multimidia

chown -R minidlna:minidlna /var/cache/minidlna
chmod 777 /var/cache/minidlna
#[--------------------------------------------------------------------------------------------]
rm -rf /var/cache/minidlna/*
rm -f /run/minidlna/minidlna.pid
systemctl enable minidlna
systemctl start minidlna
#[--------------------------------------------------------------------------------------------]
cat << 'EOF' > /usr/bin/dlna
#!/bin/bash

sudo systemctl stop minidlna
sudo rm -f /var/cache/minidlna/files.db
sudo minidlnad -R
sudo systemctl start minidlna
EOF
#[--------------------------------------------------------------------------------------------]
chmod +x /usr/bin/dlna
#[--------------------------------------------------------------------------------------------]
