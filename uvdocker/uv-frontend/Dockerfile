FROM tutum/tomcat:7.0
MAINTAINER pma
RUN apt-get update && \
    apt-get install -y openjdk-7-jre openjdk-7-jdk git maven bash vim wget curl

ADD ojdbc7.jar /ojdbc7.jar
RUN mvn install:install-file -Dfile=/ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2.0 -Dpackaging=jar

ENV JAVA_OPTS "-Xms4048m -Xmx4048m"
ENV MAVEN_OPTS "-Xmx512m -XX:MaxPermSize=128m"

# Try to Reuse the DPU install script to put the dpus where they should be
RUN git clone https://github.com/UnifiedViews/Packages.git \
    && cp Packages/unifiedviews-plugins/deploy-dpus.sh /deploy-dpus.sh \
    && chmod a+x /deploy-dpus.sh

# Not sure whether this should be here or not
RUN git clone --branch=UV_Plugins_v2.0.1 https://github.com/UnifiedViews/Plugins.git \
    && cd Plugins \
    && mvn -Dmaven.javadoc.skip=true -Dmaven.test.skip=true install \
    && mkdir -p /usr/share/unifiedviews/dist/plugins/ \
    && cp */target/uv-*.jar /usr/share/unifiedviews/dist/plugins/

# Do nothing with Javadocs ...
RUN git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git \
    && cd Core && mvn -Dmaven.javadoc.skip=true -Dmaven.test.skip=true install \
    && cp /Core/frontend/target/unifiedviews.war /tomcat/webapps

ADD config.frontend.properties /tomcat/webapps/unifiedviews/WEB-INF/config.properties
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Start the service and install the dpus
EXPOSE 28080
EXPOSE 8080
EXPOSE 80

CMD ["/run.sh"]