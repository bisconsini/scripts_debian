#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
apt install --no-install-recommends nginx
#[--------------------------------------------------------------------------------------------]
systemctl stop nginx

mkdir -p /var/www/html/site
rsync -avz site/ /var/www/html/site/
chown -R www-data:www-data /var/www/html/site
chmod -R 755 /var/www/html/site

cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;

    root /var/www/html/site;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

systemctl restart nginx
#[--------------------------------------------------------------------------------------------]
