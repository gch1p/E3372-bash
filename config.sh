#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
[ -z "$MODEM_IP" ] && MODEM_IP="192.168.9.1"