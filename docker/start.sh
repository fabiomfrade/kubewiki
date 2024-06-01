#!/bin/sh

# Verify if mounted volume data is empty; Case true, copy necessary files else nothing.

if [ -z "$(ls -A /dokuwiki)" ]
then
    cp -rap /opt/dokuwiki/* /dokuwiki
    /docker-entrypoint.sh
    chown -R nginx:nginx /var/www
else
    echo "Iniciando Nginx"
    chown -R nginx:nginx /var/www
    /docker-entrypoint.sh
fi