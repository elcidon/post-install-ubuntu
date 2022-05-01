#!/bin/bash

# - Reaper
# - Slack
# - Postman
# - Spotify
# - Docker
# - Free Download Manager
# - Lotion
# - Firefox
# - Chrome
# - Sublime

# update the system
sudo apt update && sudo apt upgrade

#installing snap
sudo apt install -y snapd

# Installing CURL
sudo apt install -y curl

# Installing Reaper
curl https://www.reaper.fm/files/6.x/reaper656_linux_x86_64.tar.xz --output reaper.tar.xz 
tar xvzf reaper.tar.xz 
chmod +x reaper_linux_x86_64/install.reaper.sh
./reaper_linux_x86_64/install.reaper.sh

rm -rf reaper_linux_x86_64 reaper.tar.xz

# installing slack
sudo snap install slack --classic

# installing postman
sudo snap install postman

# Installing spotify
sudo snap install spotify --classic

# Installing Docker
 sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world

# installing docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
docker compose version

# Installing Lotion
curl https://raw.githubusercontent.com/puneetsl/lotion/master/setup.sh > setup.sh
chmod +x setup.sh
sudo ./setup.sh native
