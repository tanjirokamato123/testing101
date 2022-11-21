#!/usr/bin/env bash
git clone https://github.com/anasty17/mirror-leech-telegram-bot mirrorbot/ && cd mirrorbot
git clone https://${SECRET_TOKEN}@github.com/rushimoto001/files -b main tmp
cd tmp
rm -rf .git
cp -r . ..
cd -
rm -rf tmp
python3 update.py && python3 -m bot
