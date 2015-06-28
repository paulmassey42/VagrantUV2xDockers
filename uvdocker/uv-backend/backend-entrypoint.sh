#!/bin/sh

until nc -z db 3306; do
    echo "$(date) - waiting for db"
    sleep 1;
done

if [ $1 = 'uv-backend-start' ]; then
    if [ ! -d "/uvdocker/backend/db" ]; then
	echo "setup - mysql -h db -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE";
	cat /init-script.sql
        echo "do mysql"
	mysql -hdb -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /init-script.sql
	mkdir -p /uvdocker/backend/db
    fi
fi
nohup java -DconfigFileLocation=/Core/backend/target/config.properties -jar /Core/backend/target/backend-2.0.3.jar

