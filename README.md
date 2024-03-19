java -jar myapp-0.0.1-SNAPSHOT.jar --spring.config.location=classpath:/application.properties


  -Dotel.javaagent.configuration-file=/otel.properties  -javaagent:/opentelemetry-javaagent.jar

  ENTRYPOINT ["java", "-jar", "Dotel.javaagent.configuration-file=/otel.properties","-javaagent:/opentelemetry-javaagent.jar","/app.jar"]


  openssl pkcs8 -topk8 -inform pem -in tls.key -outform pem -nocrypt -out tls-key.pem

  helm install myapp new-chart/ --values new-chart/values.yaml

oc get sa

oc secrets link serviceaccount/java-lb regcred --for=pull,mount -n myapp-test
