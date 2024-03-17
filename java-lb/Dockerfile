FROM nginx:1.24.0
RUN apt-get update ; apt-get install unzip

ADD https://github.com/open-telemetry/opentelemetry-cpp-contrib/releases/download/webserver%2Fv1.0.4/opentelemetry-webserver-sdk-x64-linux.tgz /opt
RUN cd /opt ; unzip -d sdk opentelemetry-webserver-sdk-x64-linux.tgz
RUN cd /opt/sdk; tar -xzvf opentelemetry-webserver-sdk-x64-linux.tgz && mv opentelemetry-webserver-sdk ../


RUN cd /opt/opentelemetry-webserver-sdk; ./install.sh
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/opentelemetry-webserver-sdk/sdk_lib/lib

COPY ./java-lb/opentelemetry_module.conf /etc/nginx/modules-enabled/opentelemetry_module.conf
COPY ./java-lb/nginx.conf /etc/nginx/nginx.conf
