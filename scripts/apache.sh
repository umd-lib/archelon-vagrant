#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

# runtime environment
mkdir -p /apps/archelon/apache/{bin,logs,run}
chown -R "$SERVICE_USER_GROUP" /apps/archelon/apache

# symlink to system modules
ln -sf /usr/lib64/httpd/modules /apps/archelon/apache/modules

# compile the helper setuid program
cd /apps/archelon/apache/src
make SERVICE_USER=vagrant SERVICE_GROUP=vagrant install clean
