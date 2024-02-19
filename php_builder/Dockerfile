FROM php:8.2.3-fpm

COPY redis/ /usr/src/php/ext/redis/

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i "s#http://deb.debian.org#https://mirrors.aliyun.com#g" /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get install -y \
		zlib1g-dev \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libxslt1-dev \
		libldap2-dev \
		libssl-dev \
        libzip-dev \
    && docker-php-source extract \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd xsl ldap sockets opcache pdo pdo_mysql mysqli zip redis \
	&& docker-php-source delete \
    && pecl install xdebug && docker-php-ext-enable xdebug

COPY files/php.ini-development /usr/local/etc/php/php.ini-development
COPY files/php.ini-production /usr/local/etc/php/php.ini-production
COPY files/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY files/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY files/app.sh /

WORKDIR /app/web


ENTRYPOINT ["/app.sh"]