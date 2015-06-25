FROM debian:8.0
MAINTAINER pma
RUN apt-get update -y && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim mysql-client-5.5

ADD ojdbc7.jar /ojdbc7.jar
RUN mvn install:install-file -Dfile=/ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2.0 -Dpackaging=jar

RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git
RUN git clone --branch=UV_Plugin-DevEnv_v2.0.1 https://github.com/UnifiedViews/Plugin-DevEnv.git
# Do nothing with Javadocs ...
RUN cd Core && mvn -Dmaven.javadoc.skip=true install
RUN cd Plugin-DevEnv && mvn -Dmaven.javadoc.skip=true install
ADD config.backend.properties /Core/backend/target/config.properties
RUN (echo "create database unifiedviews; use unifiedviews;" ; cat Core/db/mysql/schema.sql Core/db/mysql/data.sql ) > /init-script.sql
COPY backend-entrypoint.sh /backend-entrypoint.sh
RUN chmod 755 /*.sh
ENTRYPOINT ["/backend-entrypoint.sh"]
CMD ["uv-backend-start"]
EXPOSE 5010
