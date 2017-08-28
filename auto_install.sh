#!/usr/bin/env bash
echo "Auto install of all my need tool for a server"
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
apt-get update -y
apt-get upgrade -y
apt-get install zsh git curl htop byobu -y
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh
chsh -s /bin/zsh
cd /tmp
wget https://raw.githubusercontent.com/rogafe/server_dotefile/master/zshrc
mv zshrc ~/.zshrc
cd
echo "Install dotfile done, need restart the shell"
fi
