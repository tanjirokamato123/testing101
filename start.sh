#!/usr/bin/env bash
git clone https://github.com/anasty17/mirror-leech-telegram-bot mirrorbot && cd mirrorbot
git clone https://${SECRET_TOKEN}@github.com/tanjirokamato123/accountsfile -b main accountsfile
# wget $accountsfile
# unzip accountsfile.zip -d accountsfile
cd accountsfile
rm -rf .git
cp -r . ..
cd -
rm -rf accountsfile
while true; do echo 'alive'; sleep 30s; done &
python3 update.py && python3 -m bot & sleep 115m && kill $!
