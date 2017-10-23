#!/bin/sh

apk update &&
    apk upgrade &&
    apk add --no-cache sudo &&
    rm -rf /var/cache/apk/*