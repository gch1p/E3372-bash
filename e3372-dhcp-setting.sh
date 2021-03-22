#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token

curl -s -X GET "http://$MODEM_IP/api/dhcp/settings" \
    -H "Cookie: $COOKIE" \
    -H "__RequestVerificationToken: $TOKEN" \
    -H "Content-Type: text/xml" >modem_status.xml

cat modem_status.xml
