#!/usr/bin/env bash

error() {
	echo $1
	exit 1
}

which beryl > /dev/null || error "Beryl is not installed. Go to https://github.com/KarlAndr1/beryl to install it (make sure to install it globally)"
which lighttpd /dev/null || error "lighttpd is not installed. Check out https://www.lighttpd.net/"

if [ -! -f "$BERYL_SCRIPT_HOME/cgi.beryldl" ]; then
	error "BerylCGI is not installed. Go to https://github.com/KarlAndr1/beryl-cgi to install it"
fi

if [ ! -f "$BERYL_SCRIPT_HOME/sql.beryldl" ]; then
	error "BerylSQL is not installed. Go to https://github.com/KarlAndr1/beryl-sql to install it"
fi

if [ ! -f "$BERYL_SCRIPT_HOME/argon2.beryldl" ]; then
	error "BerylArgon2 is not installed. Go to https://github.com/KarlAndr1/beryl-argon2 to install it"
fi

default_dir=/srv/www/project-pulse
echo "Enter directory for the static server files (html and CGI scripts) to be stored in (leave blank for default: $default_dir)"
read www_dir
if [ "$www_dir" == "" ]; then
	www_dir="$default_dir"
fi

default_usr=lighttpd
echo "Enter user/username for the server (user should not already exist) (default: $default_usr)"
read www_usr
if [ "$www_usr" == "" ]; then
	www_usr="$default_usr"
fi

default_data_dir=/var/www/project-pulse
echo "Enter directory for the server to use for transient data (database, logs) (default: $default_data_dir)"
echo "Note that if this directory already exists the owner of the directory will be changed to '$www_usr'"
read data_dir
if [ "$data_dir" == "" ]; then
	data_dir="$default_data_dir"
fi

echo "Enter path to to HTTPS certificate (.pem)"
read cert_path

echo "Enter SMPT sever to use for automatic emails (example smtps://smtp.gmail.com)"
read email_server

echo "Enter email address/account to use for automatic emails (example example.auto@gmail.com)"
read email_address

default_port=443
echo "Enter port for the webserver to use (default $default_port)"
read www_port
if [ "$www_port" == "" ]; then
	www_port="$default_port"
fi

echo "The following configuration will be used:
Content directory: '$www_dir'
Data directory: '$data_dir'
User: '$www_usr'
Port: '$www_port'
Mail: '$email_address' ($email_server)
Note that the installation will delete and/or overwrite any files that happen to be present in '$www_dir' and '$data_dir'
OK? (y/n)"

read confirm
if [ "$confirm" != y -a "$confirm" != Y -a "$confirm" != yes -a "$confirm" != Yes ]; then
	echo "Installation aborted"
	exit 0
fi

adduser --system --no-create-home "$www_usr"

mkdir -p "$www_dir"
mkdir -p "$data_dir"
chown -R "$www_usr" "$data_dir"

cat <<ENV_SCRIPT > ./env.sh
export LIGHTTPD_CONTENT_PATH="$www_dir"
export LIGHTTPD_DATA_PATH="$data_dir"
export LIGHTTPD_USER="$www_usr"
export LIGHTTPD_CERT_PATH="$cert_path"
export LIGHTTPD_PORT="$www_port"

export BERYL_SCRIPT_HOME="$BERYL_SCRIPT_HOME"
export BERYL_SCRIPT_INIT="$BERYL_SCRIPT_INIT"
export BERYL_INTERPRETER_PATH="$(which beryl)"

export AUTO_EMAIL_DOMAIN="$email_server"
export AUTO_EMAIL_USER="$email_address"
ENV_SCRIPT

source ./env.sh

./remake_db.sh

./load.sh --dont-keep-user-data
