#!/bin/bash

#declare some variables for easy customization
DB_NAME=localwp

SITE_TITLE=dev

URL=localhost/shellpractice

ADMIN_EMAIL=mdewitt07@gmail.com


#install core and database
wp core download
wp core config --dbname=${DB_NAME} --dbuser=root --dbpass=root
wp db create
wp core install --title=${SITE_TITLE} --admin_user=admin --admin_password=1 --url=${URL} --admin_email=${ADMIN_EMAIL}

#install my bones fork
wp theme install https://github.com/mndewitt/bones/archive/master.zip --activate


#install some of my favorite plugins
wp plugin install advanced-custom-fields --activate
wp plugin install bwp-minify --activate
wp plugin install wordpress-seo --activate


#rewrite permalinks for pretty urls
wp rewrite structure '/%postname%'  --hard
wp rewrite flush --hard

#shout out upon completion
echo 'WordPress successfully installed'
