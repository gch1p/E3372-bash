#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/config.sh"

get_token

curl -s -X POST "http://$MODEM_IP/api/device/control" \
    -H "Cookie: $COOKIE" \
    -H "__RequestVerificationToken: $TOKEN" \
    -H "Content-Type: text/xml" \
    -d "<?xml version='1.0' encoding='UTF-8'?><request><Control>1</Control></request>"
