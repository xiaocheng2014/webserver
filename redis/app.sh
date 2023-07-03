#!/bin/bash

if [ ! -f "/usr/local/etc/redis/redis.conf" ]; then
    mkdir -p  "/usr/local/etc/redis"
    cp /etc/redis.conf /usr/local/etc/redis/redis.conf
fi

exec redis-server /usr/local/etc/redis/redis.conf