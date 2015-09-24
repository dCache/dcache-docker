FROM ubuntu:15.04
MAINTAINER dCache "https://www.dcache.org"

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install software-properties-common openjdk-8-jdk bash-completion vim openssl ssl-cert build-essential git maven build-essential debhelper quilt fakeroot lintian

RUN ssh-keygen -q -f "/root/.ssh/id_rsa" -N ""

RUN mkdir -p /etc/grid-security

RUN cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/grid-security/hostcert.pem
RUN cp /etc/ssl/private/ssl-cert-snakeoil.key /etc/grid-security/hostkey.pem

RUN mv /etc/grid-security/hostkey.pem /etc/grid-security/hostkey.pem-pk8
RUN openssl rsa -in /etc/grid-security/hostkey.pem-pk8 -out /etc/grid-security/hostkey.pem

COPY vimrc /etc/vim/vimrc
COPY .vim /root/.vim

