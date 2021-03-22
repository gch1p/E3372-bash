#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token

post_xml "device/control" \
    "<?xml version='1.0' encoding='UTF-8'?><request><Control>1</Control></request>"