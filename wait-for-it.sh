#!/usr/bin/env bash

# wait-for-it.sh is a script to wait for another service to become available

HOST=$1
PORT=$2
TIMEOUT=${3:-30}

echo "Waiting for $HOST:$PORT..."

for i in $(seq $TIMEOUT); do
    nc -z $HOST $PORT > /dev/null 2>&1
    result=$?
    if [ $result -eq 0 ]; then
        echo "Service $HOST:$PORT is available!"
        exit 0
    fi
    sleep 1
done

echo "Timeout after $TIMEOUT seconds waiting for $HOST:$PORT"
exit 1