FROM debian:trixie

RUN apt update && apt install -y nginx gettext-base openssl

COPY ./config/default /etc/nginx/sites-available/default
COPY ./tools/run_nginx.sh /

CMD ["./run_nginx.sh"]
# CMD ["tail", "-f"]
