#!/bin/bash
# update apt
yes | sudo apt update && sudo apt upgrade
sudo apt -y install software-properties-common -y

# install git
yes | apt install git

# install docker 
# Add Docker's official GPG key:
yes | sudo apt-get install ca-certificates curl gnupg
yes | sudo install -m 0755 -d /etc/apt/keyrings
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
yes | sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

yes | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



# INSTALL PYTHON
# sudo apt -y install wget build-essential libncursesw5-dev libssl-dev \
# libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
# yes | sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt -y install python3.12
# echo alias py=python3.12 >> ~/.bashrc
# echo alias python=python3.12 >> ~/.bashrc
# echo alias python3=python3.12 >> ~/.bashrc
# sudo apt -y install python3.12-venv
# python3.12 -m ensurepip
# echo alias pip=pip3 >> ~/.bashrc
# yes | python3.12 -m pip install --upgrade pip
# pip install poetry
# remove previos python version if needed
# check installed packages
# apt list --installed
# sudo apt-get remove python3.5
# remove python with dependencies and data files
# sudo apt-get purge --auto-remove python3.5

# UPDATE LOCALE TO UTF-8
sudo apt-get install -y locales
yes | sudo locale-gen en_US.UTF-8
echo export LC_ALL=en_US.UTF-8 >> ~/.bashrc
echo export LANG=en_US.UTF-8 >> ~/.bashrc

# install node and npm
yes | curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt -y install nodejs
sudo apt -y install npm
yes | npm install -g serve


# install nginx
sudo apt -y install nginx
yes | sudo systemctl start nginx
sudo systemctl enable nginx

# install redis
sudo apt -y install redis-server
sudo systemctl restart redis.service
systemctl enable redis-server.service

# install certbot
sudo apt -y install snapd
yes | sudo snap install core
yes | sudo snap refresh core
yes | sudo snap install --classic certbot

# run ~/.bashrc to apply aliases
exec bash
source ~/.bashrc
exec zsh