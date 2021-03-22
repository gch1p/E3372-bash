#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token
post_xml "monitoring/clear-traffic" \
    "<request><ClearTraffic>1</ClearTraffic></request>"
