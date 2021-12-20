FROM atlassian/confluence-server:7.4.14

USER root

COPY "atlassian-agent.jar" /opt/atlassian/confluence/
COPY "mysql-connector-java-5.1.49.jar"  /opt/atlassian/confluence/confluence/WEB-INF/lib/
COPY "mysql-connector-java-5.1.49-bin.jar"  /opt/atlassian/confluence/confluence/WEB-INF/lib/

RUN echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/confluence/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/confluence/bin/setenv.sh
