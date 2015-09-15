FROM ubuntu:latest
MAINTAINER dCache "https://www.dcache.org"

RUN apt-get -y install software-properties-common && add-apt-repository -y ppa:webupd8team/java

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install bash-completion vim openssl ssl-cert build-essential git maven build-essential debhelper quilt fakeroot lintian

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN apt-get -y install oracle-java8-set-default

RUN ssh-keygen -q -f "/root/.ssh/id_rsa" -N ""

RUN mkdir -p /etc/grid-security

RUN cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/grid-security/hostcert.pem
RUN cp /etc/ssl/private/ssl-cert-snakeoil.key /etc/grid-security/hostkey.pem

RUN mv /etc/grid-security/hostkey.pem /etc/grid-security/hostkey.pem-pk8
RUN openssl rsa -in /etc/grid-security/hostkey.pem-pk8 -out /etc/grid-security/hostkey.pem

