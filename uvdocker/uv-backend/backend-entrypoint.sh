#!/bin/sh

if [ $1 = 'uv-backend-start' ]; then
    if [ ! -d "/uvdocker/backend/dbxxx" ]; then
	sleep 20;
	echo "setup - mysql -h db -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE";
	cat /init-script.sql
	mysql -hdb -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /init-script.sql
    fi
fi
exec nohup java -DconfigFileLocation=/Core/backend/target/config.properties -jar /Core/backend/target/backend-2.0.3.jar
