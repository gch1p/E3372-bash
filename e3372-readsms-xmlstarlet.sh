#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token

post_xml "sms/sms-list" \
    "<request><PageIndex>1</PageIndex><ReadCount>10</ReadCount><BoxType>1</BoxType><SortType>0</SortType><Ascending>0</Ascending><UnreadPreferred>1</UnreadPreferred></request>" > $STATUS_FILE

readarray -t array_phone <<<"$(xmlstarlet sel -t -m "//Phone" -v . -n $STATUS_FILE)"
readarray -t array_content <<<"$(xmlstarlet sel -t -m "//Content" -v . -n $STATUS_FILE)"

for ((i = 0; i < ${#array_content[@]}; i++)); do
    echo -e "------\n${array_phone[$i]}"
    echo -e "------\n${array_content[$i]}"
done
