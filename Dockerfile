FROM openjdk:8-jre-alpine
RUN mkdir -p /home/mcommandes
ADD ./target/mcommandes-*.jar app.jar
EXPOSE 8080
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=test", "/app.jar"]