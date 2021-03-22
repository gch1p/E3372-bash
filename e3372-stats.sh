#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
. "$DIR/include.sh"

get_token
get_xml "monitoring/traffic-statistics" > $STATUS_FILE

CurConnTime=$(cat $STATUS_FILE | grep CurrentConnectTime | sed -e 's/<[^>]*>//g')
CurrUpload=$(cat $STATUS_FILE | grep "<CurrentUpload>" | sed -e 's/<[^>]*>//g')
CurrDownload=$(cat $STATUS_FILE | grep "<CurrentDownload>" | sed -e 's/<[^>]*>//g')
TotalUpload=$(cat $STATUS_FILE | grep "<TotalUpload>" | sed -e 's/<[^>]*>//g')
TotalDownload=$(cat $STATUS_FILE | grep "<TotalDownload>" | sed -e 's/<[^>]*>//g')
TotalConnectTime=$(cat $STATUS_FILE | grep "<TotalConnectTime>" | sed -e 's/<[^>]*>//g')

#------------------------------
# Current Connect Time
#------------------------------
cct_secs=$CurConnTime
printf 'Current Connect Time : %d days: %02d hours: %02d minutes: %02d sseconds\n' $((cct_secs / 86400)) $((cct_secs % 86400 / 3600)) $((cct_secs % 3600 / 60)) $((cct_secs % 60))

#------------------------------
# Total Connect Time
#------------------------------
tct_secs=$TotalConnectTime
printf 'Total Connect Time : %d days: %02d hours: %02d minutes: %02d sseconds\n' $((tct_secs / 86400)) $((tct_secs % 86400 / 3600)) $((tct_secs % 3600 / 60)) $((tct_secs % 60))

#cat $STATUS_FILE
#------------------------------
# Current Upload
#------------------------------
if [ $CurrUpload -lt 1024 ]; then
    echo "Current Upload : ${CurrUpload}B"
elif [ $CurrUpload -lt 1048576 ]; then
    echo "Current Upload : $((CurrUpload / 1024))KiB"
elif [ $CurrUpload -lt 1073741824 ]; then
    echo "Current Upload : $((CurrUpload / 1048576))MiB"
else
    echo "Current Upload : $((CurrUpload / 1073741824))GiB"
fi

#------------------------------
# Current Download
#------------------------------
if [ $CurrDownload -lt 1024 ]; then
    echo "Current Download : ${CurrDownload}B"
elif [ $CurrDownload -lt 1048576 ]; then
    echo "Current Download : $((CurrDownload / 1024))KiB"
elif [ $CurrDownload -lt 1073741824 ]; then
    echo "Current Download : $((CurrDownload / 1048576))MiB"
else
    echo "Current Dowbload : $((CurrDownload / 1073741824))GiB"
fi

#------------------------------
# Total Upload
#------------------------------
if [ $TotalUpload -lt 1024 ]; then
    echo "Total Upload : ${TotalUpload}B"
elif [ $TotalUpload -lt 1048576 ]; then
    echo "Total Upload : $((TotalUpload / 1024))KiB"
elif [ $TotalUpload -lt 1073741824 ]; then
    echo "Total Upload : $((TotalUpload / 1048576))MiB"
else
    echo "Total Upload : $((TotalUpload / 1073741824))GiB"
fi

#------------------------------
# Total Download
#------------------------------
if [ $TotalDownload -lt 1024 ]; then
    echo "Total Download : ${TotalDownload}B"
elif [ $TotalDownload -lt 1048576 ]; then
    echo "Total Download : $((TotalDownload / 1024))KiB"
elif [ $TotalDownload -lt 1073741824 ]; then
    echo "Total Download : $((TotalDownload / 1048576))MiB"
else
    echo "Total Doenload : $((TotalDownload / 1073741824))GiB"
fi
