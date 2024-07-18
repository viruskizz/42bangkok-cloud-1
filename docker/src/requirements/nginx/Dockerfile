FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    nginx \
    openssl

COPY conf/tsomsa.42.fr.conf /etc/nginx/conf.d
COPY conf/default.conf      /etc/nginx/sites-available/default
COPY conf/ssl-signed.conf   /etc/nginx/snippets/
COPY conf/ssl-params.conf   /etc/nginx/snippets/
COPY ./tools                /root/tools

RUN chmod +x /root/tools/*.sh && /root/tools/generate-ssl.sh

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGQUIT

ENTRYPOINT ["nginx", "-g", "daemon off;"]

