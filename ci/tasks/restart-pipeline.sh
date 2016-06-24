#!/usr/bin/env bash
set -e

version=`cat version/number`

mkdir ~/.ssh
echo $SSH_KEY > ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
cat ~/.ssh/id_rsa

cd ~/

git config --global user.email "bbyers@pivotal.io"
git config --global user.name "Brian Byers (Automated)"

git clone ${GIT_REPO} repo
cd repo

echo ${version} > changeme
git add changeme
git commit -m 'triggering change'
git push
