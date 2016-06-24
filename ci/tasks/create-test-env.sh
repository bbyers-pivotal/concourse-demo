#!/usr/bin/env bash
set -e

version=`cat version/number | sed -e 's/\./_/g'`
dash="-"

cf api $CF_API --skip-ssl-validation

echo "Login....."
cf auth $CF_USER $CF_PASS

echo "Create and Space"
cf target -o $CF_ORG -s $CF_DEFAULT_SPACE

cf create-space $CF_SPACE$dash$version
