#!/bin/bash
echo "Auto install of all my need tool for a server"
echo "This script is for debian based distribution"; sleep 1
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

echo -n "[?] Docker ? (y/n)"
case &{answare:0:1} in
    y|Y )
        echo "[...] Installing Docker"
    ;;
    * )
    echo [...] Skiping 
        ;;
esac
