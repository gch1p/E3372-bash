#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token
post_xml "dialup/mobile-dataswitch" \
    "<request><dataswitch>0</dataswitch></request>"