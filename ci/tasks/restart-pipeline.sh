#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`

# cp -r git-repo/* modified-git-repo/
echo ${version} > git-repo/changeme
git add git-repo/changeme
git commit -m 'triggering change'
