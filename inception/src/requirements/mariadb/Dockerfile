FROM debian:buster-slim

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update \
    && apt-get install -y \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    mariadb-server \
    mariadb-client

COPY ./tools/ /root/tools/
RUN chmod +x /root/tools/*.sh
# RUN /root/tools/dbsetup.sh

EXPOSE 3306

WORKDIR /root

ENTRYPOINT ["mysqld"]

