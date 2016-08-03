#! /bin/bash

# Ensure fcrepo-search exists at /apps/git/fcrepo-search
# if not checkout the fcrepo-search git repository onto that location

GIT_URL=git@github.com:umd-lib/fcrepo-search.git
BRANCH=develop
LOCAL_LOCATION=/apps/git/fcrepo-search
SOLR_STATUS_URL="http://192.168.40.11:8983/solr/admin/cores?action=STATUS&core=fedora4"

echo "Setting up the prerequisites on the host machine"

echo "1. Ensure fcrepo-search app exists."
if [ -d $LOCAL_LOCATION ]; then
  echo "$LOCAL_LOCATION already exists!"
else
  git clone $GIT_URL $LOCAL_LOCATION -b $BRANCH 
  if [ $? == 0 ]; then
    echo "Cloned $GIT_URL to $LOCAL_LOCATION"
  else
    echo "Failed to clone $GIT_URL to $LOCAL_LOCATION"
    exit 1
  fi
fi

echo "2. Ensure solr is running"
status=$(curl -k $SOLR_STATUS_URL -s -w "%{http_code}" -o /dev/null)

if [ $status == 200 ]; then
  echo "Got success status for $SOLR_STATUS_URL"
else
  echo "Got HTTP $status for $SOLR_STATUS_URL"
  echo "Ensure you have fcrepo-vagrant running and you can access solr."
  exit 1
fi 
