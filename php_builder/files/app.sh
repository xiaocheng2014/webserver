#!/bin/bash

# 软链正式环境配置
ln -sf /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

while true; do
    case $1 in
        -d|--debug)
            # 软链配置改为development
            ln -sf /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini; shift; continue
        ;;
        --|"")
            break;
        ;;
        *)
            printf "Unknown option '%s'\n" "$1"
            exit 1
        ;;
    esac
done

# -R 用root运行
exec php-fpm -R
