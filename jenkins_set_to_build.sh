#!/usr/bin/env bash

###############################################################################
#
# This shell script simplies the deployment to a balena/resin device
# It uses the "set-device-to-a-release.sh" script and evaluates its output.
#
###############################################################################

# First script parameter - Balena/Resin Application ID)
APP_ID=$1

# Second script parameter - Device UUID
DEVICE_UUID=$2

# Third script parameter - Github Build Hash
HASH=$3

echo "Deploying build \"$HASH\" to device \"$DEVICE_UUID\" (App ID: \"$APP_ID\") ..."

# Run the deployment script
OUTPUT=$(./set-device-to-a-release.sh $APP_ID $DEVICE_UUID $HASH)
echo "Output: $OUTPUT"

# Evaluate/Parse the deployment result
RESULT=$(echo $OUTPUT | awk '{print $NF}')
echo "Result: $RESULT"
echo

if [ "$RESULT" == "OK" ]
then
    # Successfully Deployed
    echo "Successfully deployed to device"
else
    # Failed to Deploy
    echo "Failed to deploy to device"
    exit 1
fi

exit 0
