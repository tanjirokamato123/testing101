#!/usr/bin/env bash
#git clone https://github.com/weebzone/WZML/ && cd WZML
#git clone https://${SECRET_TOKEN}@github.com/rushimoto001/files -b weeb tmp
#cd tmp
#rm -rf .git
#cp -r . ..
#cd -
#rm -rf tmp
#python3 update.py && python3 -m bot & sleep 115m && git clone https://${SECRET_TOKEN}@github.com/rushimoto001/testdeploy -b weeb main && cd main && git config --global user.email "rushimoto001@gmail.com" && git config --global user.name "rushimoto001" && git config --global color.ui true && perl -i -pe '/^ver=/ && s/(\d+)/$&+1/e' count.txt && git add . && git commit --allow-empty -m "Upgrade Count on $(date -u +"%D %T%p")" && git push -q

#test docker
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin docker docker-engine docker.io containerd runc ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
sudo rm -rf /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

apt-cache madison docker-ce
apt-cache madison docker-ce-cli

sudo apt-get install docker-ce=5:20.10.18~3-0~ubuntu-focal docker-ce-cli=5:20.10.18~3-0~ubuntu-focal containerd.io docker-compose-plugin

git clone https://github.com/weebzone/WZML mirrorbot/ && cd mirrorbot
git clone https://${SECRET_TOKEN}@github.com/rushimoto001/files -b weeb tmp
cd tmp
rm -rf .git
cp -r . ..
cd -
rm -rf tmp
sudo service docker start
sudo docker ps
sudo dockerd
sudo docker build . -t mirror-bot
sudo docker run -p 80:80 mirror-bot
