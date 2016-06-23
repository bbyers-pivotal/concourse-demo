#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
cd git-repo
# cp -r git-repo/* modified-git-repo/
echo ${version} > changeme
git add changeme
git commit -m 'triggering change'
