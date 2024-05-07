FROM debian:trixie

RUN apt update && apt install -y mariadb-server gettext-base

RUN mkdir -p /run/mysqld

COPY ./config/init_script.sql /etc/mysql/init_script.sql
COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/install_db.sh /install_db.sh
COPY ./tools/healthcheck.sh /healthcheck.sh

RUN chmod +x install_db.sh
RUN chmod +x healthcheck.sh

CMD ["./install_db.sh"]
