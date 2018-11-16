#!/usr/bin/env bash

APP=$1
DEVICE=$2
HASH=$3

OUTPUT=$(./set-device-to-a-release.sh $APP $DEVICE $HASH)
echo "out: $OUTPUT"

RESULT=$(echo $OUTPUT | awk '{print $NF}')
echo "res: $RESULT"

if [ "$RESULT" == "OK" ]
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

exit 0
