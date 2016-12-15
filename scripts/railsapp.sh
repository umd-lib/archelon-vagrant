#!/bin/bash

source $HOME/.rvm/bin/rvm
cd /apps/archelon/archelon
gem install bundler
bundle install
bin/rake db:migrate RAILS_ENV=vagrant
bin/rake db:seed RAILS_ENV=vagrant
