#!/usr/bin/env bash

source ./env.sh

echo "Removing $LIGHTTPD_CONTENT_PATH"
rm -rI "$LIGHTTPD_CONTENT_PATH"

echo "Removing $LIGHTTPD_DATA_PATH"
rm -rI "$LIGHTTPD_DATA_PATH"

echo "Removing user $LIGHTTPD_USER"
deluser --system "$LIGHTTPD_USER"
