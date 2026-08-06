NAME = Inception


all: $(NAME)

$(NAME):
	docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	docker-compose -f srcs/docker-compose.yml down -v
	docker system prune -a --force

re: fclean all

.PHONY: all clean fclean re