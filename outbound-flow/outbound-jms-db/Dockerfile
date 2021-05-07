FROM openjdk:11

COPY target/outbound-jms-db-1.0-SNAPSHOT.jar /opt/app.jar

RUN chown -R 1001:0 /opt && chmod -R 775 /opt
USER 1001

EXPOSE 8080

CMD java -jar /opt/app.jar