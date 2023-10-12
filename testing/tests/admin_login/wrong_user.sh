printf 'username=foobar&password=123' |
beryl $www/admin-login-auth.beryl |
beryl wrong_pass.beryl

exit $?
