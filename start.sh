#!/usr/bin/env bash
git clone https://github.com/weebzone/WZML/ && cd WZML
#git clone https://${SECRET_TOKEN}@github.com/rushimoto001/files -b weeb tmp
wget $accountsfile
unzip accountsfile.zip -d accountsfile
cd accountsfile
rm -rf .git
cp -r . ..
cd -
rm -rf accountsfile
while true; do echo 'Jinda Hu'; sleep 30s; done &
python3 update.py && python3 -m bot & sleep 115m && kill $!
