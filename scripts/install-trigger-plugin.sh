#! /bin/bash

if [[ $(vagrant plugin list | grep -c vagrant-triggers) == "0" ]]; then
  echo "Installing vagrant-triggers plugin on the host machine..." 
  vagrant plugin install vagrant-triggers
  if [ $? == 0 ]; then
    echo "Plugin install completed."
  else
    echo "Failed to install vagrant-triggers plugin!"
    exit 1
  fi 
fi
