# docker-laravel

Run docker and build:

docker compose up -d --build

Run command line in container:

docker compose run --rm php /bin/sh

Create laravel project via composer:

docker compose run --rm composer create-project laravel/laravel .

If access Forbidden:

docker compose run --rm php /bin/sh

and then - 

chown -R laravel:laravel /var/www/html
