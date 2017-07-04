#!/usr/bin/env sh

userdel user 2>/dev/null
groupdel user 2>/dev/null
groupadd -g $USER_GID user
useradd -d /home/user -g user -u $USER_UID user

gosu user consul-template -config /etc/syncthing.hcl &
child=$!

trap "kill $child" SIGTERM SIGINT
wait "$child"
