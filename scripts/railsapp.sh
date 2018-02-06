#!/bin/bash

source $HOME/.rvm/bin/rvm
cd /apps/archelon/src
gem install bundler
bundle install
bin/rake db:migrate RAILS_ENV=vagrant
bin/rake db:seed RAILS_ENV=vagrant

mkdir -p /apps/archelon/ssl

# get self-signed cert from solrlocal
echo -n \
    | openssl s_client -connect solrlocal:8984 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    >> /apps/archelon/ssl/localcerts.pem

# get self-signed cert from fcrepolocal
echo -n \
    | openssl s_client -connect fcrepolocal:443 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    >> /apps/archelon/ssl/localcerts.pem
