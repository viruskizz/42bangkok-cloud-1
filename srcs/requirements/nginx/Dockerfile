FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    nginx

COPY conf/default.conf      /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGQUIT

ENTRYPOINT ["nginx", "-g", "daemon off;"]
