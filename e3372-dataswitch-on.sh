#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token

curl -s -X POST "http://$MODEM_IP/api/dialup/mobile-dataswitch" \
    -H "Cookie: $COOKIE" \
    -H "__RequestVerificationToken: $TOKEN" \
    -H "Content-Type: text/xml" \
    -d "<request><dataswitch>1</dataswitch></request>" >modem_status.xml

cat modem_status.xml
