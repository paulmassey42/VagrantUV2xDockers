FROM debian:8.0
MAINTAINER pma
RUN apt-get update -y && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim mysql-client-5.5
RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git
# Do nothing with Javadocs ...
RUN cd Core && mvn -Dmaven.javadoc.skip=true install
COPY config.backend.properties backend/target/config.properties
EXPOSE 5010
CMD "nohup java -DconfigFileLocation=/Core/backend/target/config.properties -jar Core/backend/target/backend-11.jar"
