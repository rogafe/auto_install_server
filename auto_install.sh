#!/bin/bash
echo "Auto install of all my need tool for a server"
echo "This script is for debian based distribution"; sleep 1
#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

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


read -p "[...] Installing docker (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo "[...] Installing docker"
        curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh 
    ;;
    * )
        echo "[...] Skiping Docker installing"
    ;;
esac

read -p "[...] Installing spf13-vim vim ide (y/n)?" answer
case ${answer:0:1} in
    y|Y )
        echo "[...] Installing spf13-vim."
        curl http://j.mp/spf13-vim3 -L -o - | sh
    ;;
    * )
        echo "[...] Skiping spf13-vim."
    ;;
esac

