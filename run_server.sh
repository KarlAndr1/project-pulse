#!/usr/bin/env bash

source ./env.sh

echo "Server configuration: www='$LIGHTTPD_CONTENT_PATH' data='$LIGHTTPD_DATA_PATH' user='$LIGHTTPD_USER' port='$LIGHTTPD_PORT' email_user='$AUTO_EMAIL_USER' email_url='$AUTO_EMAIL_DOMAIN'"

echo -n "Enter email password:"
read -s mail_password
echo ""

sudo -u $LIGHTTPD_USER \
--preserve-env=LIGHTTPD_DATA_PATH,BERYL_SCRIPT_HOME,BERYL_SCRIPT_INIT,AUTO_EMAIL_DOMAIN,AUTO_EMAIL_USER \
./email_script.sh <<< "$mail_password" &

trap "killall --user lighttpd; echo Stopped" EXIT

lighttpd -D -f ./lighttpd.conf
