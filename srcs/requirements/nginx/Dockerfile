FROM	debian:bullseye

ARG		DOMAIN_NAME

WORKDIR /app

RUN		apt update && apt -y upgrade; \
		apt -y install nginx openssl ufw \
		vim telnet curl;
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=$DOMAIN_NAME" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;
COPY	./conf/defualt.conf /etc/nginx/conf.d/
RUN		sed -i "s/###server_name###/$DOMAIN_NAME/g" /etc/nginx/conf.d/defualt.conf

EXPOSE	80
EXPOSE	443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]