#!/bin/sh

set -e # fail fast
set -x # print commands

git clone resource-gist updated-gist

cd updated-gist
echo $(date) > bumpme

git config --global user.email "dande@miraclesoft.com"
git config --global user.name "dhaneshande"

pwd

ls -R

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
  
echo $ PACKAGE_VERSION

git add .
git commit -m "Bumped date"
