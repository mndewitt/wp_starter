#install core and setup database
wp core download
wp core config --dbname=localwp --dbuser=root --dbpass=root
wp db create
wp core install --title=dev --admin_user=admin --admin_password=1 --url=localhost/shellpractice --admin_email=mdewitt07@gmail.com

#install my bones fork
wp theme install https://github.com/mndewitt/bones/archive/master.zip --activate


#install some of my favorite plugins
wp plugin install advanced-custom-fields --activate
wp plugin install bwp-minify --activate
wp plugin install wordpress-seo --activate


#rewrite permalinks for pretty urls
wp rewrite structure '/%postname%'  --hard
wp rewrite flush --hard
