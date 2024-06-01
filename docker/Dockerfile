FROM nginx:latest
LABEL maintainer="Fábio Frade - fabiomfrade@gmail.com"
COPY start.sh /opt
RUN bash -x \
    # Instalacao do PHP
    && apt update && apt install -y php-fpm php-bz2 php-mbstring php-gd php-intl php-xml curl php-zip php-ldap php-ctype \
    # Configuracao adicional
    && sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 200M|g" /etc/php/8.2/fpm/php.ini \
    # Baixando a Wiki
    && mkdir -p /var/www/localhost/htdocs/dokuwiki && ln -s /var/www/localhost/htdocs/dokuwiki /dokuwiki && cd /opt/ \
    && curl -s -L  https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz | tar -xzvf - \
    && mv dokuwiki-* dokuwiki && chmod +x start.sh
    # && mv dokuwiki-* /var/www/localhost/htdocs/dokuwiki && chown -R nginx:nginx /var/www/ 
EXPOSE 80
STOPSIGNAL SIGQUIT
WORKDIR /var/www/localhost/htdocs
VOLUME /dokuwiki
# ENTRYPOINT [ "/opt/start.sh" ]