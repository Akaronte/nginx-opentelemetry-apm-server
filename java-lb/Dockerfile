FROM nginx:1.24.0
RUN apt-get update ; apt-get install unzip

ADD https://github.com/open-telemetry/opentelemetry-cpp-contrib/releases/download/webserver%2Fv1.0.4/opentelemetry-webserver-sdk-x64-linux.tgz /opt
RUN cd /opt ; unzip -d sdk opentelemetry-webserver-sdk-x64-linux.tgz
RUN cd /opt/sdk; tar -xzvf opentelemetry-webserver-sdk-x64-linux.tgz && mv opentelemetry-webserver-sdk ../


RUN cd /opt/opentelemetry-webserver-sdk; ./install.sh
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/opentelemetry-webserver-sdk/sdk_lib/lib

COPY ./java-lb/opentelemetry_module.conf /etc/nginx/modules-enabled/opentelemetry_module.conf
COPY ./java-lb/nginx.conf /etc/nginx/nginx.conf


#FROM p09392rhel.azurecr.io/ing-rhel9
# FROM redhat/ubi9:9.3-1552-source
 
# ##############################################################
# # Setup repositories
# ##############################################################
# # EPEL repository - libre2.so.9()(64bit)
# RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
 
# # nginx with opentelemetry
# COPY src/config/nginx.repo /etc/yum.repos.d/
 
# # CentOS BaseOS  - libcares.so.2()(64bit)
# COPY src/config/centos-baseos.repo /etc/yum.repos.d/
 
# ##############################################################
# # Update packages and install nginx with Open Telemetry module
# ##############################################################
# RUN yum -y update
# RUN yum -y install nginx nginx-module-otel
