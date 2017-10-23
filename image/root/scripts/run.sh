#!/bin/sh

apk update &&
    apk upgrade &&
    apk add --no-cache sudo &&
    adduser -D user &&
    cp /opt/docker/etc/sudo.txt /etc/sudoers.d/user &&
    chmod 0444 /etc/sudoers.d/user &&
    rm -rf /var/cache/apk/*