Rogue Rails
====
rails app for roguerails.com

## Setup on Heroku
    git remote add heroku git@heroku.com:roguerails.git

## ENV Vars
    heroku config:set MAIL_USER={user name} MAIL_PASSWORD={password}
    keroku config:set SECRET_TOKEN={secure token}

## Deploying to Heroku
    git push heroku master