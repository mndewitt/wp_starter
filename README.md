# wp_starter
bash script to install WordPress locally in one step, using WP-CLI.

Install WP-CLI using the instructions here: http://wp-cli.org/

Tailor it to your needs, with the appropriate creds...

If you are using MAMP, add the following lines to your .bash_profile, 
to add mysql and MAMP PHP to your path:

```
export PATH=$PATH:/Applications/MAMP/Library/bin
export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.2/bin
export PATH="$MAMP_PHP:$PATH"
```
