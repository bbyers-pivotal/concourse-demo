#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
cd git-repo
# cp -r git-repo/* modified-git-repo/

git config --global user.email "bbyers@pivotal.io"
git config --global user.name "Brian Byers (Automated)"

echo ${version} > changeme
git add changeme
git commit -m 'triggering change'

cp -r * ../another-repo
ls ../another-repo
