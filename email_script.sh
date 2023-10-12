#!/usr/bin/env bash

read -s password

echo "Email system started"
trap "echo Email system closed" EXIT

while true; do
	beryl auto_email.beryl <<< "$password"
	sleep 1s
done
