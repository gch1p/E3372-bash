#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token

curl -s -X GET "http://$MODEM_IP/api/device/information" \
    -H "Cookie: $COOKIE" \
    -H "__RequestVerificationToken: $TOKEN" \
    -H "Content-Type: text/xml" >modem_status.xml

curl -s -X GET "http://$MODEM_IP/api/device/signal" \
    -H "Cookie: $COOKIE" \
    -H "__RequestVerificationToken: $TOKEN" \
    -H "Content-Type: text/xml" >>modem_status.xml

wmode=$(cat modem_status.xml | grep workmode | sed -e 's/<[^>]*>//g')
rssi=$(cat modem_status.xml | grep rssi | sed -e 's/<[^>]*>//g')

echo "mode: $wmode"
echo "signal: $rssi"
