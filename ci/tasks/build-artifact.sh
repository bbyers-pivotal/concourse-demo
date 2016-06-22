#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
echo $version
cd git-repo
gradle assemble -Pversion=$version
cp build/libs/*.jar ../artifact-dir/
