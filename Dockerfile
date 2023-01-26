# dari alfine  linux
FROM alpine:latest



# install php curl wget git vim unzip zip dan jangan lupa seluruh extension php
RUN apk update && apk add curl wget vim unzip zip php php-fpm nginx

RUN php -v

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone

# copy file config nginx
# COPY ./nginx.conf /etc/nginx/sites-available/us.alfine.me

COPY ./nginx.conf /etc/nginx/nginx.conf

# check config nginx
RUN nginx -t

# copy file dari "port" ke nginx
COPY ./port /var/www/html

RUN chmod -R 777 /var/www/html

RUN echo $PORT


# start php -S localhost:8080 -t /var/www/html
# CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]

# start nginx   
CMD ["nginx", "-g", "daemon off;"]