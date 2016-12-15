#!/bin/bash

# https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/el7/install_passenger.html

curl --fail -sSLo /etc/yum.repos.d/passenger.repo \
  https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
yum install -y mod_passenger
