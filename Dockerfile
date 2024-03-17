FROM openjdk:17-jdk-alpine

COPY target/myapp-0.0.1-SNAPSHOT.jar /app.jar

COPY ca.crt /ca.crt
COPY caapm.crt /caapm.crt
COPY tls.crt /tls.crt
COPY tls-key.pem /tls-key.pem

RUN keytool -import -trustcacerts -alias apmcacert -file /ca.crt -keystore cacerts

COPY opentelemetry-javaagent.jar /opentelemetry-javaagent.jar

COPY otel.properties /otel.properties

EXPOSE 8081
ENTRYPOINT ["java", "-jar", "-Dotel.javaagent.configuration-file=/otel.properties","-javaagent:/opentelemetry-javaagent.jar","/app.jar"]
#ENTRYPOINT ["java", "-jar","/app.jar"]

