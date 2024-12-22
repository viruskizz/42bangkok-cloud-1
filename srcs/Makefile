# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sharnvon <sharnvon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/13 20:59:35 by sharnvon          #+#    #+#              #
#    Updated: 2024/12/22 05:44:22 by sharnvon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= cloud1
COMPOSE 	= docker compose
NGINX		= nginx
MARIADB		= mariadb
WORDPRESS	= wordpress
YML			= ./docker-compose.yml
DATAV		= database
WEBV		= wordpress
PHPMYADMIN	= phpmyadmin
DATA_DIR	= cloud1_data

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m

$(NAME):
	mkdir -p $(HOME)/$(DATA_DIR)/
	mkdir -p $(HOME)/$(DATA_DIR)/database/
	mkdir -p $(HOME)/$(DATA_DIR)/www/wordpress/
	mkdir -p $(HOME)/$(DATA_DIR)/www/phpmyadmin/

all: $(NAME)
	$(COMPOSE) -f $(YML) up --build -d
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
up: $(NAME)
	$(COMPOSE) -f $(YML) up --build -d
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
.PHONY: all up

console: $(NAME)
	$(COMPOSE) -f $(YML) up --build
.PHONY: console

list:
	@echo "$(GREEN)-----:: list :: all containers ::-----$(NORMAL)"
	@docker ps -a
	@echo
	@echo "$(GREEN)-----:: list :: all images ::-----$(NORMAL)"
	@docker images
	@echo
	@echo "$(GREEN)-----:: list :: all networks ::-----$(NORMAL)"
	@docker network list
	@echo
	@echo "$(GREEN)-----:: list :: all volumes ::-----$(NORMAL)"
	@docker volume list
.PHONY: list

clean:
	$(COMPOSE) -f $(YML) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
down:
	$(COMPOSE) -f $(YML) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
.PHONY: clean down

fclean: clean
	-rm -rf $(HOME)/$(DATA_DIR)/
	-docker volume rm $(DATAV)
	-docker volume rm $(WEBV)
	-docker volume rm $(NGINX)
	-docker volume rm $(PHPMYADMIN)
	@echo "$(ORANGE)-----:: fclean :: all volumes are deleted ::-----$(NORMAL)"
	-docker rmi $(MARIADB)
	-docker rmi $(WORDPRESS)
	-docker rmi $(NGINX)
	-docker rmi $(PHPMYADMIN)
	@echo "$(RED)-----:: fclean :: all images are deleted ::-----$(NORMAL)"
.PHONY: fclean

re: fclean console
.PHONY: re

bonus: all
.PHONY: bonus
