#!/usr/bin/env bash
set -e

version=`cat version/number`

mkdir ~/.ssh
echo $SSH_KEY > ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
cat ~/.ssh/id_rsa

SSH_ASKPASS=/opt/resource/askpass.sh DISPLAY= ssh-add ~/.ssh/id_rsa >/dev/null

cat > ~/.ssh/config <<EOF
StrictHostKeyChecking no
LogLevel quiet
EOF

cd ~/

git config --global user.email "bbyers@pivotal.io"
git config --global user.name "Brian Byers (Automated)"

git clone ${GIT_REPO} repo
cd repo

echo ${version} > changeme
git add changeme
git commit -m 'triggering change'
git push
