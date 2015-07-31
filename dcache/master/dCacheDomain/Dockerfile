FROM dcache-base:latest

RUN mkdir -p /etc/grid-security
RUN openssl genrsa 2048 > /etc/grid-security/hostkey.pem
RUN openssl req -new -x509 -nodes -sha -days 3650 -key /etc/grid-security/hostkey.pem > /etc/grid-security/host.cert
RUN openssl x509 -noout -fingerprint -text < /etc/grid-security/host.cert > /etc/grid-security/host.info
RUN cat /etc/grid-security/host.cert /etc/grid-security/hostkey.pem > /etc/grid-security/hostcert.pem
RUN chmod 400 /etc/grid-security/hostkey.pem /etc/grid-security/hostcert.pem
