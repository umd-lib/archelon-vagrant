#!/bin/bash

source $HOME/.rvm/bin/rvm
cd /apps/archelon/src
gem install bundler
bundle install
bin/rake db:migrate RAILS_ENV=vagrant
bin/rake db:seed RAILS_ENV=vagrant

# get self-signed cert from solrlocal
mkdir -p /apps/archelon/ssl
echo -n \
    | openssl s_client -connect solrlocal:8984 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    > /apps/archelon/ssl/solrlocal.pem
