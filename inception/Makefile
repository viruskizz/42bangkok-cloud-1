all: up

up: create_mount_dir
	cd srcs && docker compose up -d

debug: create_mount_dir
	cd srcs && docker compose up

down:
	docker-compose -f srcs/docker-compose.yml down

create_mount_dir:
	mkdir -p $(HOME)/data
	mkdir -p $(HOME)/data/wordpress && mkdir -p $(HOME)/data/mariadb && mkdir -p $(HOME)/data/redis

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);

fclean: clean
	sudo rm -rf $(HOME)/data/wordpress;
	sudo rm -rf $(HOME)/data/mariadb;

build: create_mount_dir
	cd srcs && docker compose build --no-cache

console:
	docker exec -it $1 sh

re: fclean build up

.PHONY: all up debug down create_mount_dir clean fclean build re console
