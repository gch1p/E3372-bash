#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token
post_xml "sms/sms-list" "<request><PageIndex>1</PageIndex><ReadCount>10</ReadCount><BoxType>1</BoxType><SortType>0</SortType><Ascending>0</Ascending><UnreadPreferred>1</UnreadPreferred></request>"

#cat $STATUS_FILE

message=$(grep -r -E 'Phone|Content' $STATUS_FILE | sed -e 's/<[^>]*>//g' | sed -e 's/^[ \t]*/------\n/g')

echo "$message\n------"
