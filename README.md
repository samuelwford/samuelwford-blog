# My Lame Blog

Ultra simple, Heroku-friendly, Rails-based blog thrown together in an afternoon so I don't have to pay for Ghost any more.

Why Rails? Because it's brain dead simple to do what I want that I can host for nothing on Heroku.

## Getting Setup

Install `rbenv` with homebrew.

Install the correct ruby (see `rbenv local`, e.g. `rbenv install 2.2.0`).

Run `bundle install`.

If using Postgress.app, the `pg` will fail; you'll need something like this:

`gem install pg -v '0.18.1' -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config `

Puma may fail as well; you may need something like this:

`gem install puma -v '2.11.1' -- --with-cppflags=-I/usr/local/opt/openssl/include --with-ldflags=-L/usr/local/opt/openssl/lib`

Make sure all gems install correctly and the Postgress.app is running.

You may need to make the database with `rake db:setup`.

Run the app with `rails server`.