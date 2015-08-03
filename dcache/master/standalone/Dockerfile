FROM dcache/base-master:latest

COPY dcache.conf /etc/dcache/
COPY gplazma.conf /etc/dcache/
COPY storage-authzdb /etc/grid-security/
COPY standalone.conf /etc/dcache/layouts/

RUN apt-get -y install apache2-utils
RUN echo "admin" | htpasswd -i -c /etc/dcache/htpasswd admin
RUN echo "user"  | htpasswd -i -c /etc/dcache/htpasswd user

RUN dcache pool create --size=10000000000 /pools pool1 pools

EXPOSE 22224
EXPOSE 2280

CMD ["dcache", "database update"]
CMD ["dcache", "start"]
