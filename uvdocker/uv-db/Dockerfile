# https://registry.hub.docker.com/_/mysql/
FROM mysql:5.5
MAINTAINER pma
RUN apt-get update -y && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim
ENV MYSQL_DATABASE unifiedviews
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_USER unifiedviews
ENV MYSQL_PASSWORD unifiedviews
RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git
RUN ( echo "create database unifiedviews; use unifiedviews;" ; cat Core/db/mysql/schema.sql Core/db/mysql/data.sql ) > init-script.sql
EXPOSE 3306
CMD ["mysql","-u","$MYSQL_USER","-p$MYSQL_PASSWORD","$MYSQL_DATABASE","<init-script.sql"]
