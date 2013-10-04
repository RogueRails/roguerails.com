[![Code Climate](https://codeclimate.com/github/RogueRails/roguerails.com.png)](https://codeclimate.com/github/RogueRails/roguerails.com)
Rogue Rails
====
rails app for roguerails.com

## Setup on Heroku
    git remote add heroku git@heroku.com:roguerails.git

## ENV Vars
    heroku config:set MAIL_USER={user name} MAIL_PASSWORD={password}
    heroku config:set SECRET_TOKEN={secure token}

## Deploying to Heroku
    git push heroku master
