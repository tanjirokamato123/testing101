#!/usr/bin/env bash
git clone https://github.com/anasty17/mirror-leech-telegram-bot mirrorbot/ && cd mirrorbot
git clone https://${SECRET_TOKEN}@github.com/rushimoto001/files -b main tmp
cd tmp
rm -rf .git
cp -r . ..
cd -
rm -rf tmp
python3 update.py && python3 -m bot && sleep 1m ; git clone https://${SECRET_TOKEN}@github.com/rushimoto001/testdeploy main && cd main && echo $( (( $(cat count.txt) + 1 )) ) > count.txt
&& git add . && git commit --allow-empty -m "Update Count $(date -u +"%D %T%p")" && git push -q
