up: dirs
	cd srcs && ./tools/secret_tool.sh -d $(SECRETS_PW) && docker-compose up -d

hostname:
	echo "127.0.0.1 ***REMOVED***.42.fr" >> /etc/hosts

dirs:
	mkdir -p $(HOME)/data/db
	mkdir -p $(HOME)/data/web

build: dirs
	cd srcs && ./tools/secret_tool.sh -d $(SECRETS_PW) && docker-compose up --build -d

down:
	cd srcs && docker-compose down && ./tools/secret_tool.sh -e $(SECRETS_PW)

clean:
	cd srcs && docker-compose down -v --rmi all && ./tools/secret_tool.sh -e $(SECRETS_PW)
	rm -rf $(HOME)/data

re: clean up

attach_db:
	docker exec -it mariadb mysql -p -u $$(cat ./srcs/secrets/db_username.txt) -D $$(cat ./srcs/secrets/db_name.txt)

# SHOW TABLES;
# SELECT * FROM wp_users;
