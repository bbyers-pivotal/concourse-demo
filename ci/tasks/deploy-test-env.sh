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

cf api $CF_API --skip-ssl-validation

echo "Login....."
cf auth $CF_USER $CF_PASS

echo "Create and Space"
cf target -o $CF_ORG -s $CF_SPACE$dash$version

cf push $CF_APP$dash$version -f git-repo/manifest-test.yml -p artifact-repository/concourse-demo-*.jar
