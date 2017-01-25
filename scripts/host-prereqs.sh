#! /bin/bash

function ensure_git_repo {
  LOCAL_LOCATION=$1
  GIT_URL=$2
  BRANCH=${3:-develop}

  if [ -d "$LOCAL_LOCATION" ]; then
    echo "$LOCAL_LOCATION already exists!"
  else
    git clone "$GIT_URL" "$LOCAL_LOCATION" -b "$BRANCH"
    if [ $? == 0 ]; then
      echo "Cloned $GIT_URL to $LOCAL_LOCATION"
    else
      echo "Failed to clone $GIT_URL to $LOCAL_LOCATION"
      exit 1
    fi
  fi
}

echo "Setting up the prerequisites on the host machine"

echo "1. Ensure archelon-env exists."
ensure_git_repo /apps/git/archelon-env git@bitbucket.org:umd-lib/archelon-env.git || exit 1

echo "2. Ensure archelon app exists."
ensure_git_repo /apps/git/archelon git@github.com:umd-lib/archelon.git || exit 1

echo "3. Ensure solr is running"
SOLR_STATUS_URL="https://192.168.40.11:8984/solr/admin/cores?action=STATUS&core=fedora4"

status=$(curl -k $SOLR_STATUS_URL -s -w "%{http_code}" -o /dev/null)

if [ $status == 200 ]; then
  echo "Got success status for $SOLR_STATUS_URL"
else
  echo "Got HTTP $status for $SOLR_STATUS_URL"
  echo "Ensure you have fcrepo-vagrant running and you can access solr."
  exit 1
fi 
