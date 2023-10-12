printf 'username=admin&password=12345' |
beryl $www/admin-login-auth.beryl |
beryl wrong_pass.beryl

exit $?
