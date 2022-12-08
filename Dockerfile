FROM php:7.4-cli-buster as composer
WORKDIR /usr/src/myapp

RUN apt update && \
    apt-get install -y inotify-tools git zip build-essential autoconf libssl-dev && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

FROM composer
RUN composer require --dev aerospike/aerospike-client-php:7.4.2 && \
    find vendor/aerospike/aerospike-client-php/ -name "*.sh" -exec chmod +x {} \;
RUN cd vendor/aerospike/aerospike-client-php/ && \
    composer run-script post-install-cmd && \
    cd src && \
    make install && \
    echo "extension=aerospike.so\naerospike.udf.lua_user_path=/usr/local/aerospike/usr-lua" > /usr/local/etc/php/conf.d/aerospike.ini && \
    php -m | grep aerospike && \
    rm -rf vendor

CMD [ "bash" ]