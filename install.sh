wp core download
wp core config --dbname=localwp --dbuser=root --dbpass=root
wp db create
wp core install --title=dev --admin_user=admin --admin_password=1 --url=localhost/shellpractice --admin_email=mdewitt07@gmail.com


#rewrite permalinks for pretty urls
wp rewrite structure '/%postname%'  --hard
wp rewrite flush --hard
