#!/bin/sh
# sciągnięcie pluginu
##ruby script/plugin install -r 3072 http://svn.technoweenie.net/projects/plugins/restful_authentication/
git clone git://github.com/technoweenie/restful-authentication.git restful_authentication

# utworzenie użytkowników
##ruby script/generate authenticated user sessions
ruby script/generate authenticated user sessions

