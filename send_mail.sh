#!/usr/bin/env bash
read -s password
body=$(cat)

curl --url "$1" --no-progress-meter --ssl-reqd --netrc-file <(
	cat <<< "default"
	cat <<< "login $2"
	cat <<< "password $password"
) --mail-rcpt $3 --mail-from $2 --upload-file - <<< "$body"
