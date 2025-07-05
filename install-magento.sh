#!/bin/bash

docker exec -it magento-app bash -c "
cd /var/www/html && \
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.7 . && \
bin/magento setup:install \
--base-url=https://localhost:8080 \
--db-host=mysql \
--db-name=magento \
--db-user=root \
--db-password=root \
--admin-firstname=admin \
--admin-lastname=user \
--admin-email=admin@example.com \
--admin-user=admin \
--admin-password=Admin123@ \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--search-engine=elasticsearch8 \
--elasticsearch-host=elasticsearch \
--elasticsearch-port=9200 \
--session-save=redis \
--redis-host=redis
"
