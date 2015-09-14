FROM dcache/build:master

COPY etc/* /etc/dcache/
COPY etc/layouts/* /etc/dcache/layouts/
COPY etc/grid-security/certificates/* etc/grid-security/certificates/
RUN mkdir -p  etc/grid-security/vomsdir
COPY etc/grid-security/storage-authzdb etc/grid-security/
COPY init-dcache /init-dcache/
COPY run-dcache.sh / 

ENTRYPOINT ["/run-dcache.sh"] 
