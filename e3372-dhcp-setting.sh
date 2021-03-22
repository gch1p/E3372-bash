#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
. "$DIR/config.sh"

curl -s -X GET "http://$MODEM_IP/api/webserver/SesTokInfo" > ses_tok.xml
COOKIE=`grep "SessionID=" ses_tok.xml | cut -b 10-147`
TOKEN=`grep "TokInfo" ses_tok.xml | cut -b 10-41` 

curl -s -X GET "http://$MODEM_IP/api/dhcp/settings" -H "Cookie: $COOKIE" -H "__RequestVerificationToken: $TOKEN" -H "Content-Type: text/xml" > modem_status.xml

cat modem_status.xml
