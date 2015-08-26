FROM dcache/base-master:latest

COPY dcache.conf /etc/dcache/
COPY gplazma.conf /etc/dcache/
COPY exports /etc/dcache/
COPY storage-authzdb /etc/grid-security/
COPY standalone.conf /etc/dcache/layouts/
COPY run-dcache.sh /

RUN apt-get -y install apache2-utils
RUN echo "admin" | htpasswd -i -c /etc/dcache/htpasswd admin
RUN echo "user"  | htpasswd -i /etc/dcache/htpasswd user

RUN dcache pool create --size=10000000000 /pools pool1 pools

VOLUME /pools

EXPOSE 111
EXPOSE 2049
EXPOSE 2280
EXPOSE 22125
EXPOSE 22224

CMD ["/run-dcache.sh"]
