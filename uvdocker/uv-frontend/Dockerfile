FROM tutum/tomcat:7.0
MAINTAINER pma
RUN apt-get update && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim wget curl
RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git
ENV JAVA_OPTS "-Xms4048m -Xmx4048m"
RUN cd Core && JAVA_OPTS="-Xms4048m -Xmx4048m" mvn install
MV Core/frontend/target/unifiedviews.war /tomcat/webapps/
COPY config.frontend.properties /tomcat/webapps/unifiedviews/WEB-INF/config.properties
EXPOSE 28080
