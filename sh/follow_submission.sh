#!/usr/bin/sh
while [ 1 ]; do \
    sleep 2; \
    wget -ca log.txt -o /dev/null http://localhost:4567/submission; \
done
