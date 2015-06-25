# https://registry.hub.docker.com/_/mysql/
FROM mysql:5.5
MAINTAINER pma
RUN apt-get update -y && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim
ENV MYSQL_DATABASE unifiedviews
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_USER unifiedviews
ENV MYSQL_PASSWORD unifiedviews
