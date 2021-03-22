#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
[ -z "$MODEM_IP" ] && MODEM_IP="192.168.9.1"

get_token() {
    curl -s -X GET "http://$MODEM_IP/api/webserver/SesTokInfo" > ses_tok.xml
    COOKIE=$(grep "SessionID=" ses_tok.xml | cut -b 10-147)
    TOKEN=$(grep "TokInfo" ses_tok.xml | cut -b 10-41`)
    rm ses_tok.xml
}