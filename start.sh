#!/usr/bin/env bash
export TZ=Asia/Kolkata
sudo timedatectl set-timezone Asia/Kolkata
git clone https://github.com/anasty17/mirror-leech-telegram-bot mirrorbot/ && cd mirrorbot
git clone https://${SECRET_TOKEN}@github.com/rushimoto001/files -b main tmp
cd tmp
rm -rf .git
cp -r . ..
cd -
rm -rf tmp
python3 update.py && python3 -m bot & sleep 115m && git clone https://${SECRET_TOKEN}@github.com/rushimoto001/testdeploy main && cd main && git config --global user.email "rushimoto001@gmail.com" && git config --global user.name "rushimoto001" && git config --global color.ui true && perl -i -pe '/^ver=/ && s/(\d+)/$&+1/e' count.txt && git add . && git commit --allow-empty -m "Upgrade Count on $(date -u +"%D %T%p")" && git push -q
