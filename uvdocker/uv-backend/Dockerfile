FROM debian:8.0
MAINTAINER pma
ADD ojdbc7.jar /ojdbc7.jar

RUN apt-get update -y && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim mysql-client-5.5

RUN mvn install:install-file -Dfile=/ojdbc7.jar \
        -DgroupId=com.oracle -DartifactId=ojdbc7 \
	-Dversion=12.1.0.2.0 -Dpackaging=jar

RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git \
    && cd Core \
    && mvn -Dmaven.javadoc.skip=true -Dmaven.test.skip=true install

RUN (echo "create database unifiedviews; use unifiedviews;" ; cat Core/db/mysql/schema.sql Core/db/mysql/data.sql ) > /init-script.sql
COPY backend-entrypoint.sh /backend-entrypoint.sh
RUN chmod 755 /backend-entrypoint.sh
ENTRYPOINT ["/backend-entrypoint.sh"]
CMD ["uv-backend-start"]
EXPOSE 5010
