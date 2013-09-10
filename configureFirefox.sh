#!/bin/bash

############################ template.sh ###########################
# Author Name | author@email.com
# Copyright 2003 Author Name
# Use Loginwindow Manager (http://www.bombich.com/software/lwm.html)
# to make this shell script run each time a user logs in or out.
####################################################################


### Description ###
#
# This script clears out User directories, except the current user 
# which must be the first argument fed to the script.
# Local administrative users must begin with local or they too
# will be deleted
#


### Properties ###
#
# These items must be modified to suit your environment before
# implementing this script! You do not need to make any other
# modifications to this file than these properties.
#



## The end users of this script should not have to read past this line
## to safely and correctly implement this script. Make sure you explain
## very well what appropriate values are for the properties.


### Debug/testing sanity check ###


####################################################
###
### Configure firefox to use a Firefox CCK payload
### 
###
####################################################


directory="/Library/Application Support/Firefox CCK/"
ffdir="/Applications/Firefox.app/Contents/MacOS/distribution"

if [ -d "$directory" ] ; then
    echo "$directory"  'exists'
else
    mkdir -p "$directory"
fi

if [ -d "$ffdir" ] ; then
echo "$ffdir"  'exists'
else
mkdir -p "$ffdir"
ln -s "$directory" "$ffdir/bundles"
fi


####################################################
###
### Configure firefox to use a Firefox CCK payload
###
###
####################################################
applicationIni="/Applications/Firefox.app/Contents/MacOS/application.ini"
overrideIni="/Applications/Firefox.app/Contents/MacOS/override.ini"

/bin/cp $applicationIni $overrideIni
sed -i -e 's/EnableProfileMigrator=1/EnableProfileMigrator=false/g' "$overrideIni"
sed -i -e 's/EnableExtensionManager=1/EnableExtensionManager=false/g' "$overrideIni"


## Create override.ini file and overwrite the file if it already exists
#echo "[XRE]" > $overrideIni
#echo "EnableProfileMigrator=false" >> $overrideIni
#echo "[/align]" >> $overrideIni
chmod 755 $overrideIni


### Always exit with 0 status
exit 0
