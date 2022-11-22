FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN ps --no-headers -o comm 1
RUN apt update && apt install wget sudo curl gnupg systemd ufw -y
RUN sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get -y install postgresql
RUN sudo service postgresql start
RUN wget https://raw.githubusercontent.com/weebzone/WZML/master/requirements-cli.txt -O requirements-cli.txt
RUN wget https://raw.githubusercontent.com/weebzone/WZML/master/requirements.txt -O requirements.txt
RUN pip3 install --no-cache-dir -r requirements-cli.txt
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install megasdkrestclient
RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing && \
    apt -qq install -y \
    mediainfo
COPY . .

CMD ["bash", "start.sh"]
