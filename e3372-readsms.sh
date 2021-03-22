#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token

curl -s -X POST "http://$MODEM_IP/api/sms/sms-list" \
    -H "Cookie: $COOKIE" \
    -H "__RequestVerificationToken: $TOKEN" \
    -H "Content-Type: text/xml" \
    -d "<request><PageIndex>1</PageIndex><ReadCount>10</ReadCount><BoxType>1</BoxType><SortType>0</SortType><Ascending>0</Ascending><UnreadPreferred>1</UnreadPreferred></request>" >modem_status.xml

#cat modem_status.xml

message=$(grep -r -E 'Phone|Content' modem_status.xml | sed -e 's/<[^>]*>//g' | sed -e 's/^[ \t]*/------\n/g')

echo "$message\n------"
