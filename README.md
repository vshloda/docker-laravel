## Environment Setup for the Latest Version of Laravel (PHP, Nginx, Laravel, MySql) Using Docker

### Project Structure

- `docker` - Folder for all configuration files for docker and other services
    - `nginx` - Folder for nginx configuration files
    - `php` - Folder for php configuration files
- `src` - Folder where the project code will be stored
- `docker-compose.yml` - Docker compose configuration file

### Step-by-Step Guide

#### 1. Environment Setup

- Remove empty files from src and mysql dirs.

  ```
  rm src/empty
  rm mysql/empty
  ```

- In docker-compose.yml, change the data to access the database

  ```
  MYSQL_DATABASE: laraveldb
  MYSQL_USER: laravel
  MYSQL_PASSWORD: secret
  MYSQL_ROOT_PASSWORD: secret
  ```

#### 2. Build the Project Using Docker Compose

- Run this command
  
  ```
  docker compose build
  ```

#### 3. Create a Laravel Project

-  Run this command:

  ```
  docker compose run --rm composer create-project laravel/laravel .
  ```

- After running this command, the project code should appear in the src folder.

- Start docker containers

  ```
  docker compose up -d
  ```

- You can verify if the project is working by opening the browser. For example, if it’s set to 80:

  ```
  http://localhost
  ```

#### 4. Configure Laravel project 
 
- Configure Mysql in /src/.env . Uncomment and change:

  ```
  DB_CONNECTION=mysql       # connection name, we use mysql
  DB_HOST=mysql             # name of mysql service in docker-compose.yml
  DB_PORT=3306              # mysql standart port 
  DB_DATABASE=laraveldb     # database name from MYSQL_DATABASE in docker-compose.yml
  DB_USERNAME=laravel       # username from MYSQL_USER in docker-compose.yml
  DB_PASSWORD=secret        # user password from MYSQL_PASSWORD in docker-compose.yml
  ```
- Restart all services
  
  ```
  docker compose down
  docker compose up -d
  ```

#### 5. Run Migrations

  ```
  docker compose run --rm artisan migrate
  ```

#### Some useful commands

- Enter the php container (php is the name of the service from docker-compose.yml)

  ```
  docker compose run --rm php /bin/sh
  ```

- If access Forbidden

  ```
  docker compose run --rm php /bin/sh
  chown -R laravel:laravel /var/www/html
  ```