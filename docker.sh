#! /bin/bash

docker create --name datacontainer_2 -v /var/lib/mysql -v /var/www/html  busybox

docker run --name db -p 3315:3315 -d -e MYSQL_ROOT_PASSWORD=dual -e MYSQL_DATABASE1=wordpress -e MYSQL_USER1=wpuser1 -e MYSQL_PASSWORD1=wpdual --volumes-from datacontainer_2 orboan/dcsss-mariadb

docker run --name Wordpress  -it -d -p 8080:80 --volumes-from datacontainer_1 1luis1/httpd-php

