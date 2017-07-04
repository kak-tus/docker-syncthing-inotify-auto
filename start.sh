#!/usr/bin/env sh

userdel user 2>/dev/null
groupdel user 2>/dev/null
groupadd -g $USER_GID user
useradd -d /home/user -g user -u $USER_UID user

chown -R user:user /home/user

gosu user consul-template -config /etc/syncthing.hcl -target="http://${SYNC_IP}:8384" &
child=$!

trap "kill $child" TERM INT
wait "$child"
