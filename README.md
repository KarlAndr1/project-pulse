# Project Pulse

## Dependencies:
- bash
- beryl - 0.X.X
- bery-sql
- beryl-cgi
- beryl-argon2
- lighttpd

The project should run on any Unix-like system (or Windows via WSL). Only tested on Linux Mint.

## Setup
Make sure the current working directory is the directory that contains setup.sh and this README file.
Run
```
sudo ./setup.sh
```
And enter configuration options when prompted for.
Then run
```
sudo ./run_server.sh
```
To run the server. Enter the email password when prompted for. Press CNTRL+C once to stop the server.

## Other utilities
Run
```
./add_adming_login.beryl
```
To add a new admin login.

```
./remake_db.sh
```
To delete all the data in the database located at ./data and remake a new empty one.

NOTE: Use
```
sudo ./load.sh
```
To sync/upload any changes made to the server. This will replace all the server content with the files located in the ./www directory.

To also replace the server's database with the one in ./data, run
```
sudo ./load.sh --dont-keep-data
```
WARNING: This will entirely replace the server's database with the local one located in ./data, which is most likely empty; meaning that the server will
lose all data. Server logs may also be overwritten

## Tests

To run automated tests, change the current working directory to ./testing and then run ./run_tests.sh
```
cd ./testing
./run_tests.sh
```
