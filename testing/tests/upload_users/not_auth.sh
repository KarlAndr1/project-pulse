export HTTP_COOKIE="admin-login=admin:44tierja9we9iw8u43q" # Some incorrect login

printf 'x----------------------------30428063825360894072016294269\r
Content-Disposition: form-data; name="new_users_csv"; filename="test2.csv"\r
Content-Type: text/csv\r
\r
123, Some Name, some@email.com, 0123456789
42, Some Other Name, someother@email.uk, 123123
\r
x----------------------------30428063825360894072016294269--\r\n' |
beryl "$www/add-users-post.beryl" > /dev/null

beryl not_auth.beryl


