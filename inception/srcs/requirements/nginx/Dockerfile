FROM alpine:3.16

# Install nginx and openssl(for TLS)
RUN apk update && \
	apk upgrade && \
	apk add nginx \
	openssl

# Create certificates and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
	# Fill prompt information
	-subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=42Bangkok/CN=tliangso.42.fr"

# Copy config file
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /var/www/html && \
	chown -R nginx:nginx /var/www/html && \
	mkdir -p /run/nginx

RUN echo "Starting nginx server..."

ENTRYPOINT nginx -g 'daemon off;'
