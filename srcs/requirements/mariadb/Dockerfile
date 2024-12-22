FROM	debian:bullseye

ARG		MYSQL_NAME
ARG		MYSQL_ROOTPASS
ARG		MYSQL_USERNAME_ADMIN
ARG		MYSQL_PASSWORD_ADMIN
ARG		MYSQL_USERNAME
ARG		MYSQL_PASSWORD

WORKDIR	/app

COPY	./tools/mariadb_script.sh .

RUN		chmod 777 mariadb_script.sh;
RUN		bash mariadb_script.sh && rm mariadb_script.sh
EXPOSE	3306

ENTRYPOINT	[ "mysqld" ]
