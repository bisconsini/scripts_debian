#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
apt install --no-install-recommends -y samba
#[--------------------------------------------------------------------------------------------]
smbpasswd -a deisy
usermod -aG sambashare deisy
#[--------------------------------------------------------------------------------------------]
smbpasswd -a loterica
usermod -aG sambashare loterica
#[--------------------------------------------------------------------------------------------]
smbpasswd -a ricardo
usermod -aG sambashare ricardo
#[--------------------------------------------------------------------------------------------]
smbpasswd -a yuri
usermod -aG sambashare yuri
#[--------------------------------------------------------------------------------------------]
cd /
mkdir arquivos
#[--------------------------------------------------------------------------------------------]
cd arquivos
mkdir deisy loterica ricardo yuri
#[--------------------------------------------------------------------------------------------]
cd deisy
mkdir backups documentos
cd ..
#[--------------------------------------------------------------------------------------------]
cd ricardo
mkdir backups documentos
cd ..
#[--------------------------------------------------------------------------------------------]
cd yuri
mkdir backups documentos
cd ..
#[--------------------------------------------------------------------------------------------]
cd loterica
mkdir backups documentos
cd ..
#[--------------------------------------------------------------------------------------------]
cd /
mkdir publico
#[--------------------------------------------------------------------------------------------]
cd publico
mkdir backups documentos downloads ebooks emuladores filmes imagens jogos musicas roms series scripts softwares temporarios videos
cd ..
#[--------------------------------------------------------------------------------------------]
chmod -R 777 /arquivos
chmod -R 777 /publicos
#[--------------------------------------------------------------------------------------------]
echo "[global]
workgroup = WORKGROUP

[deisy]
comment = Arquivos pessoais da Deisy
path = /arquivos/deisy
read raw = yes
write raw = yes
public = yes
security = share
browseable = yes
writable = yes
read only = no
valid users = deisy
create mask = 0777
directory mask = 0777

[loterica]
comment = Arquivos pessoais da Loterica
path = /arquivos/loterica
read raw = yes
write raw = yes
public = yes
security = share
browseable = yes
writable = yes
read only = no
valid users = loterica
create mask = 0777
directory mask = 0777

[multimidia]
comment = Arquivos multimidia
path = /multimidia
read raw = yes
write raw = yes
public = yes
security = share
browseable = yes
writable = yes
read only = no
create mask = 0777
directory mask = 0777

[publicos]
comment = Arquivos publicos
path = /arquivos/publicos
read raw = yes
write raw = yes
public = yes
security = share
browseable = yes
writable = yes
read only = no
create mask = 0777
directory mask = 0777

[ricardo]
comment = Arquivos pessoais do Ricardo
path = /arquivos/ricardo
read raw = yes
write raw = yes
public = yes
security = share
browseable = yes
writable = yes
read only = no
valid users = ricardo
create mask = 0777
directory mask = 0777

[yuri]
comment = Arquivos pessoais do Yuri
path = /arquivos/yuri
read raw = yes
write raw = yes
public = yes
security = share
browseable = yes
writable = yes
read only = no
valid users = yuri
create mask = 0777
directory mask = 0777" > /etc/samba/smb.conf

systemctl enable smbd
systemctl restart smbd
#[--------------------------------------------------------------------------------------------]
