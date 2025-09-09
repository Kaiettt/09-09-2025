# Use Tomcat 9 with JDK 11
FROM tomcat:9.0-jdk11

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR to Tomcat webapps folder (context path will be /email_list)
COPY target/email_list.war /usr/local/tomcat/webapps/email_list.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
