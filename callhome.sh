#!/bin/sh
USER="revssh"
HOST="1.2.3.4"
PORT="2022"
SSHKEY="/home/alfred/.ssh/callhome_id_rsa"

if [ "$(ps waux | grep "$USER" | grep "$HOST" | grep "$PORT" | grep "$SSHKEY")" = "" ]; then
  ssh -NC -o ServerAliveInterval=5 \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -R "*:$PORT:127.0.0.1:22" \
    -i "$SSHKEY" \
    "$USER@$HOST" &
fi
