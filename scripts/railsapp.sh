#!/bin/bash

sudo cp /vagrant/files/railsapp.conf /etc/httpd/conf.d/
sudo systemctl restart httpd

cd /apps/services/fcrepo-search
bundle install
bin/rake db:migrate