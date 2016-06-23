#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`

cp -r git-repo modified-git-repo
echo ${version} > modified-git-repo/changeme
