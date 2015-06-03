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

#ask if you need any dummy content
read -p 'Do you want to populate some lorem ipsum posts for this install?' -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl http://loripsum.net/api/5 | wp post generate --post_content --count=25
    echo '25 lorem ipsum posts have been added'
fi

#shout out upon completion
echo 'WordPress successfully installed'
