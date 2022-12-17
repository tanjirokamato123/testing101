#!/usr/bin/env bash
while true; do echo 'Alive'; sleep 30s; done &
sleep 115m && git clone https://${SECRET_TOKEN}@github.com/tanjirokamato123/testing101 -b shubham gitpush && cd gitpush && git config --global user.email "tanjirokamato834@gmail.com" && git config --global user.name "tanjirokamato123" && git config --global color.ui true && perl -i -pe '/^ver=/ && s/(\d+)/$&+1/e' count.txt && git add . && git commit --allow-empty -m "Update Software Version Count on $(date -u +"%D %T%p")" && git push -q
