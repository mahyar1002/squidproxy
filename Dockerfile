# Dockerfile
FROM ubuntu:20.04

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y squid apache2-utils && \
    mkdir -p /var/log/squid && \
    touch /etc/squid/passwd

COPY squid.conf /etc/squid/squid.conf
COPY squid_passwd /etc/squid/passwd

EXPOSE 3128

CMD ["squid", "-N", "-d", "1"]