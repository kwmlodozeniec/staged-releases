#!/usr/bin/env bash
## This script returns the `build_id` for a specific commit on a resin.io application specified as arg $1.
## usage: ./get-build-id.sh <APP_ID> <FULL_COMMIT_HASH>

./check-configuration.sh || exit 1

APP_ID=$1
COMMIT_HASH=$2
source ./resin.env

curl "https://api.$BASE_URL/v2/build?\$select=id,commit_hash&\$filter=application%20eq%20$APP_ID%20and%20commit_hash%20eq%20'$COMMIT_HASH'" -H "Authorization: Bearer $authToken" | jq '.d[0].id' 
