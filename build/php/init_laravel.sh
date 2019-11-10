#!/bin/bash

# sed -i -e "s/DB_HOST=.*/DB_HOST=mysql/g" /var/www/html/.env
# sed -i -e "s/DB_DATABASE=.*/DB_DATABASE=laravel/g" /var/www/html/.env
# sed -i -e "s/DB_USERNAME=.*/DB_USERNAME=user/g" /var/www/html/.env
# sed -i -e "s/DB_PASSWORD=.*/DB_PASSWORD=user_password/g" /var/www/html/.env

sed -i -e "s/'timezone' => 'UTC'/'timezone' => 'Asia\/Tokyo'/g" /var/www/html/config/app.php
sed -i -e "s/'locale' => 'en'/'locale' => 'ja'/g" /var/www/html/config/app.php
