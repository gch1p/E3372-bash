#!/bin/bash

[ -z "$MODEM_IP" ] && MODEM_IP="192.168.8.1"
STATUS_FILE="modem_status.xml"

get_token() {
    curl -s -X GET "http://$MODEM_IP/api/webserver/SesTokInfo" > ses_tok.xml
    COOKIE=$(grep "SessionID=" ses_tok.xml | cut -b 10-147)
    TOKEN=$(grep "TokInfo" ses_tok.xml | cut -b 10-41`)
    rm ses_tok.xml
}

get_xml() {
    local endpoint="$1"

    curl -s -X GET "http://$MODEM_IP/api/$endpoint" \
        -H "Cookie: $COOKIE" \
        -H "__RequestVerificationToken: $TOKEN" \
        -H "Content-Type: text/xml"
}

post_xml() {
    local endpoint="$1"
    local data="$2"

    curl -s -X POST "http://$MODEM_IP/api/$endpoint" \
        -H "Cookie: $COOKIE" \
        -H "__RequestVerificationToken: $TOKEN" \
        -H "Content-Type: text/xml" \
        -d "$data"
}