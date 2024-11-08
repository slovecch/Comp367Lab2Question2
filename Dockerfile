FROM tomcat:9.0-jdk11

COPY target/Comp367Lab2Question2-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/Comp367Lab2Question2.war

EXPOSE 8080
