#!/usr/bin/env bash

source ./env.sh

rm -fr -v "$LIGHTTPD_CONTENT_PATH/*"

cp -rt "$LIGHTTPD_CONTENT_PATH" www/*


if [ "$1" = "--dont-keep-data" ]; then
	cp -rt "$LIGHTTPD_DATA_PATH" data/*
	chown "$LIGHTTPD_USER" "$LIGHTTPD_DATA_PATH"/*
fi
