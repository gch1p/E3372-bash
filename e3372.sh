#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token
get_xml "device/information" > $STATUS_FILE
get_xml "device/signal" >> $STATUS_FILE

wmode=$(cat $STATUS_FILE | grep workmode | sed -e 's/<[^>]*>//g')
rssi=$(cat $STATUS_FILE | grep rssi | sed -e 's/<[^>]*>//g')

echo "mode: $wmode"
echo "signal: $rssi"
