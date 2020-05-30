#!/bin/bash
function debug() {
echo "start capture the program failure log"
cnt=-1
ret=1
while [[ $ret -eq 1 ]]; do
        sh "$1" 2>&1
        ret=$?
        cnt=$((cnt+1))
# let cnt++
if [[ $# -eq 2 ]];then
    sleep "$2"
fi
done
echo "succeed after ${cnt} times"
}
