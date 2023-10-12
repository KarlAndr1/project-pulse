#!/usr/bin/env bash

rm -f data/database
echo '' | sqlite3 -init ../create-db.sql data/database

printf 'admin\n123' | ../add_admin_login.beryl -s
