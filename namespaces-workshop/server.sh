#!/usr/bin/env bash
RESPONSE="HTTP/1.1 200 OK\r\nConnection: close\r\n\r\nhello-world\r\n"
while { echo -en "$RESPONSE"; } | nc -q 1 -l "${1:-8080}"; do
    echo "================================================"
done
