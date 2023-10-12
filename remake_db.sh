#!/usr/bin/env sh
rm -f data/database
echo '' | sqlite3 -init create-db.sql data/database

./add_admin_login.beryl
