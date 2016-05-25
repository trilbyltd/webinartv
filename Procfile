web: bundle exec puma -p $PORT -C ./config/puma.rb
resque: env TERM_CHILD=1 bundle exec rake jobs:work
