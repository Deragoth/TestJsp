FROM tomcat:10-jdk17
# Rimuovi le app predefinite di Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia il file WAR nella directory webapps
COPY target/*.war /usr/local/tomcat/webapps/date-webapp.war

# Opzionale: Configurazione personalizzata di Tomcat
# COPY server.xml /usr/local/tomcat/conf/

EXPOSE 8080
CMD ["catalina.sh", "run"]
