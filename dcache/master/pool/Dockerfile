FROM dcache/base-master:latest

COPY dcache.conf /etc/dcache/
COPY pool.conf /etc/dcache/layouts/
COPY run-dcache.sh /

RUN apt-get -y install ssl-cert

RUN cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/grid-security/hostcert.pem
RUN cp /etc/ssl/private/ssl-cert-snakeoil.key /etc/grid-security/hostkey.pem

RUN mv /etc/grid-security/hostkey.pem /etc/grid-security/hostkey.pem-pk8
RUN openssl rsa -in /etc/grid-security/hostkey.pem-pk8 -out /etc/grid-security/hostkey.pem

VOLUME /pools
VOLUME /var/log/dcache

ENTRYPOINT ["/run-dcache.sh"]

