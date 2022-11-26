FROM ubuntu:latest
RUN apt update && apt install wget sudo curl gnupg systemd ufw python3 python3-pip apt-utils git postgresql -y
RUN sudo apt-get update -y
RUN sudo apt-get install ca-certificates curl gnupg lsb-release -y
RUN sudo mkdir -p /etc/apt/keyrings
RUN sudo rm -rf /etc/apt/keyrings/docker.gpg
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN sudo apt-get update -y
RUN sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

RUN apt-cache madison docker-ce
RUN apt-cache madison docker-ce-cli

RUN sudo apt-get install docker-ce=5:20.10.18~3-0~ubuntu-focal docker-ce-cli=5:20.10.18~3-0~ubuntu-focal containerd.io docker-compose-plugin -y

CMD ["bash", "start.sh"]
