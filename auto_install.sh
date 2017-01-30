#!/usr/bin/env bash
echo "Auto install of all my need tool for a server"
echo "Le script doit etre en root/sudo"
apt-get update -y
apt-get upgrade -y
apt-get install zsh git curl htop -y
echo"Install antigen .zshrc conf"
cd /tmp
git clone https://github.com/rogafe/server_dotefile.git
mv antigen ~/.antigen
source ~/.antigen/antigen.zsh
mv -r zshrc ~/.zshrc
echo "Install of antigen and .zshrc conf done"
echo "Docker install"
curl -sSL https://get.docker.com/ | sh
