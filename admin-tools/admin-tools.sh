source ../env.sh

export DB_PATH="$LIGHTTPD_DATA_PATH/database"

if [[ -f "$1.beryl" ]]; then
	sudo --preserve-env=DB_PATH,BERYL_SCRIPT_HOME,BERYL_SCRIPT_INIT -k beryl "$1.beryl"
else
	echo "'$1'; No such admin tool"
fi
