FROM dcache/dcache:master
MAINTAINER dCache "https://www.dcache.org"

RUN apt-get -y install supervisor postgresql-9.4

RUN mkdir -p  etc/grid-security/vomsdir
COPY etc/grid-security/storage-authzdb etc/grid-security/

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH
ENV PGDATA /var/lib/postgresql/data

COPY pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

VOLUME /var/lib/postgresql/data
VOLUME /var/pools

COPY supervisord.conf /etc/supervisor/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

