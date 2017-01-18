#!/bin/sh

# Bashscript which is executed by bash *AFTER* complete installation is done
# (but *BEFORE* postupdate). Use with caution and remember, that all systems
# may be different! Better to do this in your own Pluginscript if possible.
#
# Exit code must be 0 if executed successfull.
#
# Will be executed as user "loxberry".
#
# We add 5 arguments when executing the script:
# command <TEMPFOLDER> <NAME> <FOLDER> <VERSION> <BASEFOLDER>
#
# For logging, print to STDOUT. You can use the following tags for showing
# different colorized information during plugin installation:
#
# <OK> This was ok!"
# <INFO> This is just for your information."
# <WARNING> This is a warning!"
# <ERROR> This is an error!"
# <FAIL> This is a fail!"

# To use important variables from command line use the following code:
ARGV0=$0 # Zero argument is shell command
ARGV1=$1 # First argument is temp folder during install
ARGV2=$2 # Second argument is Plugin-Name for scipts etc.
ARGV3=$3 # Third argument is Plugin installation folder
ARGV4=$4 # Forth argument is Plugin version
ARGV5=$5 # Fifth argument is Base folder of LoxBerry

/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/daemons/plugins/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/daemons/plugins/$ARGV2

/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.01min/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.01min/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.03min/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.03min/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.05min/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.05min/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.10min/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.10min/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.15min/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.15min/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.30min/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.30min/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.hourly/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.hourly/$ARGV2
/bin/sed -i "s:REPLACEFOLDERNAME:$ARGV3:g" $ARGV5/system/cron/cron.daily/$ARGV2
/bin/sed -i "s:REPLACEINSTALLFOLDER:$ARGV5:g" $ARGV5/system/cron/cron.daily/$ARGV2

if [ ! -d "$ARGV5/data/plugins/$ARGV3/databases" ]; then
  mkdir "$ARGV5/data/plugins/$ARGV3/databases"
fi
# Link databases to HTML directory to have access from Client JavaScript
ln -s "$ARGV5/data/plugins/$ARGV3/databases" "$ARGV5/webfrontend/html/plugins/$ARGV3/databases"
  
if [ ! -f REPLACEINSTALLFOLDER/log/plugins/REPLACEFOLDERNAME/stats4lox.log ]; then
  ln -s /run/shm/$ARGV3/stats4lox.log $ARGV5/log/plugins/$ARGV3/stats4lox.log
fi

echo "**********************************************************"
echo "*     Please reboot your LoxBerry after installation     *"
echo "* Bitte starte Deinen LoxBerry neu nach der Installation *"
echo "**********************************************************"


# Exit with Status 0
exit 0
