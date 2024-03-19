FROM redhat/ubi9:9.2
 
##############################################################
# Setup repositories
##############################################################
# EPEL repository - libre2.so.9()(64bit)
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
 
# nginx with opentelemetry
RUN echo -e '\
[nginx-stable]\n\
name=nginx stable repo\n\
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://nginx.org/keys/nginx_signing.key\n\
module_hotfixes=true\n\
[nginx-mainline]\n\
name=nginx mainline repo\n\
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://nginx.org/keys/nginx_signing.key\n\
module_hotfixes=true\
' > /etc/yum.repos.d/nginx.repo
 
# CentOS BaseOS  - libcares.so.2()(64bit)
RUN echo -e '\
[centos-baseos]\n\
name=CentOS Stream $releasever - BaseOS\n\
baseurl=https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/os/\n\
gpgcheck=0\n\
enabled=1\n\
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial\
' > /etc/yum.repos.d/centos-baseos.repo

 
##############################################################
# Update packages and install nginx with Open Telemetry module
################################################
##############
RUN yum -y update
RUN yum -y install nginx nginx-module-otel

RUN unlink /var/log/nginx/access.log
RUN unlink /var/log/nginx/error.log

RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx
RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx
RUN chmod -R 770 /var/cache/nginx /var/run /var/log/nginx


RUN ln -sf /dev/stdout /var/log/nginx/access.log 
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
