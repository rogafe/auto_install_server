echo "This Script only install my dotfile"


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
