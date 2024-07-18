NAME = inception

SRC = ./src
NGINX = nginx

all: $(NAME)

$(NAME): mkdir_data up

mkdir_data:
	sudo mkdir -p $(HOME)/data
	sudo mkdir -p $(HOME)/data/wordpress
	sudo mkdir -p $(HOME)/data/database

up:
	cd $(SRC) && docker compose up
down: stop
	cd $(SRC) && docker compose down
stop:
	cd $(SRC) && docker compose stop

clean: down
	-docker rmi -f $$(docker images "src*" | awk 'NR!=1 {print}' | awk '{print $$1}')

fclean: clean
	-docker volume rm $$(docker volume ls --filter "Name = src*" | awk 'NR!=1 {print}' | awk '{print $$2}')
	sudo rm -rf $(HOME)/data/wordpress
	sudo rm -rf $(HOME)/data/database

re: fclean all

bonus: all

up-redis:
	cd $(SRC) && docker compose up redis

.PHONY: mkdir_data up down stop clean fclean re
