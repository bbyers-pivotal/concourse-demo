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

cf login -a $CF_API -u $CF_USER -p $CF_PASS --skip-ssl-validation
cf target -o $CF_ORG

dash="-"

cf create-space $CF_SPACE$dash$version
