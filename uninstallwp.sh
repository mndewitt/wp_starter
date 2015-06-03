#!/bin/bash

#drop the db
wp db drop

#delete everything except the shell scripts
shopt -s extglob
rm -rf !(installwp.sh|uninstallwp.sh)

#shout out upon completion
echo 'WordPress uninstalled successfully'
