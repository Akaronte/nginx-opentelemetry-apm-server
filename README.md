java -jar myapp-0.0.1-SNAPSHOT.jar --spring.config.location=classpath:/application.properties


  -Dotel.javaagent.configuration-file=/otel.properties  -javaagent:/opentelemetry-javaagent.jar

  ENTRYPOINT ["java", "-jar", "Dotel.javaagent.configuration-file=/otel.properties","-javaagent:/opentelemetry-javaagent.jar","/app.jar"]


  openssl pkcs8 -topk8 -inform pem -in tls.key -outform pem -nocrypt -out tls-key.pem

  helm install myapp new-chart/ --values new-chart/values.yaml

oc get sa

oc secrets link serviceaccount/java-lb regcred --for=pull,mount -n myapp-test




oc create secret docker-registry regcred --docker-server=https://registry.piensoluegoinstalo.com:5000 --docker-username=akaronte --docker-password=mondariz10 --docker-email=akaronte@hotmail.com -n myapp-test


oc secrets link serviceaccount/default regcred --for=pull,mount -n myappjava 

oc secrets link serviceaccount/otel regcred --for=pull,mount -n myappjava 

oc secrets link serviceaccount/java-lb regcred --for=pull,mount -n myappjava 



curl -u akaronte:mondariz10 -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
"https://registry.piensoluegoinstalo.com:5000/v2/opentelemetry-collector/manifests/latest" \
| grep Docker-Content-Digest


curl -u akaronte:mondariz10 -X GET https://registry.piensoluegoinstalo.com:5000/v2/_catalog

curl -u akaronte:mondariz10 -X GET https://registry.piensoluegoinstalo.com:5000/v2/javalb/manifests/latest


curl -u akaronte:mondariz10 -X GET https://registry.piensoluegoinstalo.com:5000/v2/java-lb/manifests/latest


curl -u akaronte:mondariz10 -X DELETE "https://registry.piensoluegoinstalo.com:5000/v2/opentelemetry-collector/manifests/<digest>"
