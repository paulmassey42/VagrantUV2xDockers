FROM tutum/tomcat:7.0
MAINTAINER pma
RUN apt-get update && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim wget curl
RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git
ENV JAVA_OPTS "-Xms4048m -Xmx4048m"
ENV MAVEN_OPTS "-Xmx512m -XX:MaxPermSize=128m"
# Do nothing with Javadocs ...
RUN cd Core && JAVA_OPTS="-Xms3048m -Xmx3048m -XX:MaxPermSize=500M -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled" mvn -Dmaven.javadoc.skip=true install
RUN cp /Core/frontend/target/unifiedviews.war /tomcat/webapps
ADD config.frontend.properties /tomcat/webapps/unifiedviews/WEB-INF/config.properties
EXPOSE 28080
EXPOSE 8080
EXPOSE 80