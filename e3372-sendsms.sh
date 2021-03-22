#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

SMS_DATA="<?xml version='1.0' encoding='UTF-8'?><request><Index>-1</Index><Phones><Phone>363</Phone></Phones><Sca></Sca><Content>USAGE</Content><Length>5</Length><Reserved>1</Reserved><Date>-1</Date></request>"

get_token
post_xml "sms/send-sms" "$SMS_DATA" > $STATUS_FILE

cat $STATUS_FILE