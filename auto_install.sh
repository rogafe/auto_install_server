#!/bin/bash
echo "Auto install of all my need tool for a server"
# echo "ad augusta per angusta"
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
echo "[updating]"; sleep 1
apt-get update
echo "[upgrading]"; sleep 1
apt-get upgrade -y
echo 'Install of needed package "zsh git curl htop byobu vim"';sleep 01
apt-get install zsh git curl htop byobu vim -y
echo "setting up antigen and zsh "
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh
chsh -s /bin/zsh
cd /tmp
wget https://raw.githubusercontent.com/rogafe/server_dotefile/master/zshrc
mv zshrc ~/.zshrc
echo "install of antigen done"
cd /tmp
echo "[installing docker]"
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
echo "[docker installed]"
sleep 2
echo "[installing spf13-vim]"
curl http://j.mp/spf13-vim3 -L -o - | sh
echo "[all done closing the ssh shell]"
sleep 2
exit
fi
