ARCH ?= amd64
build_java:
	cd java_builder; \
	docker build . -t xiaocheng2014/webserver:openjdk-8u342-jdk-$(ARCH) --no-cache

push_java:
	docker push xiaocheng2014/webserver:openjdk-8u342-jdk-$(ARCH)

build_mariadb:
	cd mariadb_builder; \
	docker build . -t xiaocheng2014/webserver:mariadb-11.0.2-$(ARCH) --no-cache

push_mariadb:
	docker push xiaocheng2014/webserver:mariadb-11.0.2-$(ARCH)

build_openresty:
	cd openresty_builder; \
	docker build . -t xiaocheng2014/webserver:openresty-1.21.4-1-$(ARCH) --no-cache

push_openresty:
	docker push xiaocheng2014/webserver:openresty-1.21.4-1-$(ARCH)

build_php:
	cd php_builder; \
	docker build . -t xiaocheng2014/webserver:php-fpm-8.2.3-$(ARCH) --no-cache

push_php:
	docker push xiaocheng2014/webserver:php-fpm-8.2.3-$(ARCH)

build_redis:
	cd redis_builder; \
	docker build . -t xiaocheng2014/webserver:redis-7.0.11-$(ARCH) --no-cache

push_redis:
	docker push xiaocheng2014/webserver:redis-7.0.11-$(ARCH)

merge_java:
	docker pull xiaocheng2014/webserver:openjdk-8u342-jdk-amd64; \
	docker pull xiaocheng2014/webserver:openjdk-8u342-jdk-arm64; \
	docker manifest create xiaocheng2014/webserver:openjdk-8u342-jdk  \
                           xiaocheng2014/webserver:openjdk-8u342-jdk-amd64 \
                           xiaocheng2014/webserver:openjdk-8u342-jdk-arm64 --amend; \
    docker manifest push xiaocheng2014/webserver:openjdk-8u342-jdk

merge_mariadb:
	docker pull xiaocheng2014/webserver:mariadb-11.0.2; \
	docker pull xiaocheng2014/webserver:mariadb-11.0.2-arm64; \
	docker manifest create xiaocheng2014/webserver:mariadb-11.0.2-jdk  \
                           xiaocheng2014/webserver:mariadb-11.0.2-amd64 \
                           xiaocheng2014/webserver:mariadb-11.0.2-arm64 --amend; \
    docker manifest push xiaocheng2014/webserver:mariadb-11.0.2

merge_openresty:
	docker pull xiaocheng2014/webserver:openresty-1.21.4-1-amd64; \
	docker pull xiaocheng2014/webserver:openresty-1.21.4-1-arm64; \
	docker manifest create xiaocheng2014/webserver:openresty-1.21.4-1  \
                           xiaocheng2014/webserver:openresty-1.21.4-1-amd64 \
                           xiaocheng2014/webserver:openresty-1.21.4-1-arm64 --amend; \
    docker manifest push xiaocheng2014/webserver:openresty-1.21.4-1

merge_php:
	docker pull xiaocheng2014/webserver:php-fpm-8.2.3-amd64; \
	docker pull xiaocheng2014/webserver:php-fpm-8.2.3-arm64; \
	docker manifest create xiaocheng2014/webserver:php-fpm-8.2.3  \
                           xiaocheng2014/webserver:php-fpm-8.2.3-amd64 \
                           xiaocheng2014/webserver:php-fpm-8.2.3-arm64 --amend; \
    docker manifest push xiaocheng2014/webserver:php-fpm-8.2.3

merge_redis:
	docker pull xiaocheng2014/webserver:redis-7.0.11-amd64; \
	docker pull xiaocheng2014/webserver:redis-7.0.11-arm64; \
	docker manifest create xiaocheng2014/webserver:redis-7.0.11  \
                           xiaocheng2014/webserver:redis-7.0.11-amd64 \
                           xiaocheng2014/webserver:redis-7.0.11-arm64 --amend; \
    docker manifest push xiaocheng2014/webserver:redis-7.0.11

