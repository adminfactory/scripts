#!/bin/bash

status=$(/usr/bin/supervisorctl status)

echo "$status" | grep -qv "RUNNING"
if [ $? -eq 0 ]; then
        echo "CRITICAL: Workers not running"
        echo "$status" | awk '!/RUNNING/ {print $1, $2}' | sed "s/:.* / /g"
        exit 2
elif [ $? -eq 1 ]; then
        echo "OK: Workers running"
        exit 0
else
        echo "Uknown error"
        exit 3
fi
