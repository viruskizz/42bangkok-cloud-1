NAME	= cloun1_server
NGINX	= nginx
MARIADB = mariadb
WORDPRESS = wordpress
PHPMYADMIN = phpmyadmin
COMPOSE = docker compose

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m

$(NAME):

all: $(NAME)
	$(COMPOSE) up

list:
	@echo "$(GREEN) ------------ containers ------------$(NORMAL)"
	@docker ps -a
	@echo "$(GREEN) -------------- images --------------$(NORMAL)"
	@docker images
	@echo "$(GREEN) -------------- volumes -------------$(NORMAL)"
	@docker volume list
	@echo "$(GREEN) -------------- networks ------------$(NORMAL)"
	@docker network list

up:
	docker compose up -d --build

down:
	docker compose down

clean: down

fclean:



re: fclean all
.PHONY: all list up down clean fclean re