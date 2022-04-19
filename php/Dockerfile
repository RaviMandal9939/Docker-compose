FROM alpine:3.12
RUN apk update && apk add curl net-tools php7 shadow nano curl vim git tree python3 g++ make php7-fpm php7-bcmath php7-cli php7-ctype php7-curl php7-dom php7-fpm php7-gd php7-iconv php7-intl php7-json php7-mbstring php7-mcrypt php7-openssl php7-pdo_mysql php7-phar php7-session php7-simplexml php7-soap php7-tokenizer php7-xml php7-xmlwriter php7-xsl php7-zip php7-zlib php7-sockets php7-sodium php7-fileinfo &&\
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
php composer-setup.php && php -r "unlink('composer-setup.php');" &&\
mv composer.phar /usr/local/bin/composer

COPY auth.json /root/.composer/auth.json
COPY startup.sh /startup.sh
COPY php.ini /etc/php7/php.ini
COPY www.conf /etc/php7/php-fpm.d/
WORKDIR /var/www/html/magento
ENTRYPOINT ["/startup.sh"]

