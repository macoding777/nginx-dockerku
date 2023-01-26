# dari alfine  linux
FROM alpine:latest



# install php curl wget git vim unzip zip dan jangan lupa seluruh extension php
RUN apk update && apk add curl wget vim unzip zip php php-fpm

RUN php -v

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone

# copy file config nginx
COPY ./nginx.conf /etc/nginx/nginx.conf


# copy file dari "port" ke nginx
COPY ./port /var/www/html

RUN chmod -R 777 /var/www/html

# start nginx   
CMD [ "nginx", "-g", "daemon off;" ]