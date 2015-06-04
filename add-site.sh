#!/bin/bash
# add a new virtual host as $1.$2 (example.dev) in MAMP
# example usage:  $ sudo sh add-site.sh example dev
# use sudo

if [ "$1" == "" ]; then
    echo "Missing args"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "Missing args"
    exit 1
fi

#make the directory, add a placeholder file

cd /Applications/MAMP/htdocs
mkdir $1
cd $1
touch index.php

#go to apache vhosts file and add the new vhost

cd /Applications/MAMP/conf/apache/extra
cat >> httpd-vhosts.conf <<EOF

<VirtualHost *:80>
	DocumentRoot /Applications/MAMP/htdocs/$1
	ServerName www.$1.$2

    <Directory /Applications/MAMP/htdocs/$1>
		Options Includes FollowSymLinks
		AllowOverride All
		Order allow,deny
		Allow from all
	</Directory>

</VirtualHost>


EOF

#add the new site to the hosts file

sed -i '' '$ a\
127.0.0.1 www.'$1.$2 /etc/hosts

#shout out upon successful completion

echo "You have successfully added $1.$2 as a virtual host.  Restart MAMP to view your new site."
