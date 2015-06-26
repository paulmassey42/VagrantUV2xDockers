#!/bin/sh
set -e
# echo mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
# cat /init-script.sql
mysqld_safe
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /init-script.sql
