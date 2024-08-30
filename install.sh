#!/usr/bin/env bash

#############################################
#     install necessary applications
#############################################

# install git
sudo apt-get install git 

# install wget and curl
sudo apt-get install wget curl

# install emacs
sudo apt-get install emacs

# install vim
sudo apt-get install vim

# install tree
sudo apt-get install tree

#install rofi
sudo apt-get install rofi

# install nitrogen
sudo apt-get install nitrogen

# install zsh
sudo apt-get install zsh
# make zsh default
chsh -s $(which zsh)
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.config/oh-my-zsh/custom}/themes/powerlevel10k

#install Nerd Fonts using getNF
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
# launch getNF
getnf

# install font-manager
sudo apt-get install font-manager

# install calculator 
sudo apt-get install qalculatess

# install screenshort
sudo apt-install screenshot


# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# install  OBS studio
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install ffmpeg obs-studio

#install vs code
sudo snap install --classic code

# install syncthing
sudo apt-get install syncthing
# start syncthing on power up => @kiran = @{user_name}; to find username execute $whoami
sudo systemctl enable syncthing@kiran

# install gnu stow
sudo apt-get install stow
# clone all the dotfiles
git clone https://github.com/24x7fpga/.dotfiles.git 
# link config files
cd ~/.dotfiles
stow emacs
stow qtile
stow rofi
stow zsh

cd ~

# install miscellaneous softwares
sudo apt-get install tkdiff
sudo apt-get install gvimdiff


sudo snap install hugo

sudo apt-get install vlc

sudo apt-get install qalculate-gtk

#############################################
#     install design applications
#############################################

# install all the necessary softwares in the installations location
mkdir installations
# install iVerilog and gtkwave
sudo apt-get install iverilog gtkwave

# install yosys
sudo apt-get install yosys
# install graphviz (dot -V or which dot)
sudo apt-get install graphviz


#############################################
#     install window manager
#############################################

# install qtile and it's dependencies
sudo apt-get install python3-pip
pip install xcffib
pip install qtile

# create a desktop entry
echo "[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
X-GDM-SessionRegisters=true
Keywords=wm;tiling" | sudo tee /usr/share/xsessions/qtile.desktop

# install qtile-extras
git clone https://github.com/elParaguayo/qtile-extras.git ~/installations
cd ~/installations/qtile-extras
sudo python3 setup.py install

cd ~
 
echo  "Qtile Successfully Installed"

echo "Rebooting System"
# reboot
sudo systemctl reboot
