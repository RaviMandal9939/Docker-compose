#!/bin/sh
#php
php-fpm7
if [[ ! -f "/var/www/html/magento/nginx.conf.sample" ]]; then
rm -rf /var/www/html/magento
composer create-project --no-interaction --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.3 /var/www/html/magento 
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + 
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + 
addgroup www-data
chown -R root:www-data .
chmod u+x bin/magento && chmod -R 777 var generated
php bin/magento setup:install --base-url=http://alpcomposerv.com/ --db-host=mysql --db-name=magento --db-user=magento --db-password=magento --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=Asia/Kolkata --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=elasticsearch --elasticsearch-port=9200
fi
#cp /root/.composer/auth.json /var/www/html/magento/var/composer_home/auth.json
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + 
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + 
chown -R root:www-data . 
chmod u+x bin/magento 
chmod -R 777  pub/static generated/ var/cache/ 
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento c:c && php bin/magento c:f
chown -R root:www-data .
chmod -R 777  pub/static generated/ var/cache
chmod -R 777 pub/static generated/ var/
watch netstat -tulpn
