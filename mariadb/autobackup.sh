#!/bin/bash

mariadb-backup --host=${MARIADB_ROOT_HOST} --user=root --password=${MARIADB_ROOT_PASSWORD} --target-dir=/backup/backup_$(date +%Y%m%d_%H%M%S) --backup --compress