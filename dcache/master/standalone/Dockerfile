FROM ubuntu:latest

COPY etc/dcache /etc/dcache
COPY etc/grid-security /etc/grid-security

COPY init-dcache /

VOLUME /etc/dcache
VOLUME /var/log/dcache
VOLUME /var/lib/dcache
VOLUME /var/lib/postgresql/data
VOLUME /pools

