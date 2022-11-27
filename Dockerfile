FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt update && apt install mediainfo wget sudo curl python3 python3-pip apt-utils git zip unzip curl tar aria2 qbittorrent-nox -y
RUN wget https://raw.githubusercontent.com/weebzone/WZML/master/requirements-cli.txt -O requirements-cli.txt
RUN wget https://raw.githubusercontent.com/weebzone/WZML/master/requirements.txt -O requirements.txt
RUN pip3 install --no-cache-dir -r requirements-cli.txt
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install megasdkrestclient

COPY . .
