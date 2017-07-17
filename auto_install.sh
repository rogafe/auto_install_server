#!/usr/bin/env bash
echo "Auto install of all my need tool for a server"
echo "Le script doit etre en root/sudo"
apt-get update -y
apt-get upgrade -y
apt-get install zsh git curl htop -y
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh
chsh -s /bin/zsh
cd /tmp
wget https://raw.githubusercontent.com/rogafe/server_dotefile/master/zshrc
mv zshrc ~/.zshrc
cd 
echo "Install dotfile done, need restart the shell"
