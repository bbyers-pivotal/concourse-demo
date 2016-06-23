#!/usr/bin/env bash
set -e

# get_code="curl -I $CONCOURSE_DEMO_URL 2>/dev/null | head -n 1 | cut -d$' ' -f2"
# status_code=`eval $get_code`
# if [ "$status_code" != "200" ]
# then
#   echo "Expect status code from $CONCOURSE_DEMO_URL as 200, but got $status_code"
#   exit 1
# fi
version=`cat version/number | sed -e 's/\./_/g'`
dash="-"

target="cf api $CF_API --skip-ssl-validation"
#echo $target
eval $target

echo "Login....."
login="cf auth $CF_USER $CF_PASS"
#echo $login
eval $login

echo "Create and Space"
org_space="cf target -o $CF_ORG -s $CF_DEFAULT_TEST_SPACE"
eval $org_space

cf create-space $CF_SPACE$dash$version
