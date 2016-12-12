rm /usr/src/app/tmp/pids/server.pid
# export SECRET_KEY_BASE=$(bundle exec rake secret)
bundle exec rails server -b 0.0.0.0