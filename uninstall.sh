#!/usr/bin/env bash

source ./env.sh

echo "Removing $LIGHTTPD_CONTENT_PATH"
rm -rIv "$LIGHTTPD_CONTENT_PATH"

echo "Removing $LIGHTTPD_DATA_PATH"
rm -rIv "$LIGHTTPD_DATA_PATH"

echo "Removing user $LIGHTTPD_USER"
deluser --system "$LIGHTTPD_USER"
