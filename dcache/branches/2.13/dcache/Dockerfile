FROM dcache/build:2.13
MAINTAINER dCache "https://www.dcache.org"

COPY etc/dcache /etc/dcache/
COPY etc/grid-security/certificates /etc/grid-security/certificates
COPY init-dcache /init-dcache/
COPY run-dcache.sh /

ONBUILD COPY etc/dcache /etc/dcache
ONBUILD COPY init-dcache /init-dcache/

ONBUILD VOLUME /var/log/dcache
ONBUILD VOLUME /var/lib/dcache

ONBUILD ENTRYPOINT ["/run-dcache.sh"]
