printf 'username=admin&password=123' |
beryl $www/admin-login-auth.beryl | 
beryl ok_login.beryl

exit $?
