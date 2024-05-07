FROM debian:trixie

RUN apt update && apt install -y php-fpm php-mysqli default-mysql-client wget php-xml

COPY ./config/www.conf /etc/php/8.2/fpm/pool.d

COPY ./tools/wordpress_installer.sh .
RUN chmod +x wordpress_installer.sh

# CMD ["tail", "-f"]
CMD ["./wordpress_installer.sh"]

