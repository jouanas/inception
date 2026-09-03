NAME = Inception

all: $(NAME)

$(NAME):
	mkdir -p /home/doffy/data/wordpress
	mkdir -p /home/doffy/data/mariadb
	docker compose -f srcs/docker-compose.yml up -d --build

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	sudo rm -rf /home/doffy/data/wordpress
	sudo rm -rf /home/doffy/data/mariadb
	docker compose -f srcs/docker-compose.yml down -v
	docker system prune -a --force

re: fclean all

.PHONY: all clean fclean re