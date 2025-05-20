#!/bin/sh

yay -S --needed --noconfirm - < ~/archinstall/packages.txt

git clone https://www.github.com/harishnkr/.dotfiles ~/.dotfiles
git clone https://www.github.com/harishnkr/newtonrice ~/newtonrice
git clone https://www.github.com/harishnkr/TermRainbow ~/TermRainbow
git clone https://www.github.com/harishnkr/st ~/st
git clone https://github.com/lwndhrst/sddm-rose-pine ~/sddm-rose-pine
git clone https://github.com/harishnkr/nvim-config ~/.config/nvim


# Install own fork of ST terminal
cd ~/st/
make all
sudo make install

cd ~/.dotfiles/
stow zsh tmux lf dunst doom X betterlockscreen

# TODO To install the tmux plugins first time
cd ~
./.tmux/plugins/tpm/scripts/install_plugins.sh

#Change shell
chsh -s /bin/zsh


cd ~/newtonrice/
stow bspwm sxhkd polybar picom gtk rofi
cp -r wallpaper/ ~/wallpaper
mkdir -p ~/.local/share
cp -r ~/newtonrice/fonts/ ~/.local/share/fonts
fc-cache

# update wallpaper for betterlockscreen
betterlockscreen -u ~/wallpaper/pexels-sohi-807598.jpg

# doom emacs config
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

#fix libinput issues
sudo cp ~/archinstall/40-libinput.conf /etc/X11/xorg.conf.d/

#Copy sddm greether theme
sudo mv ~/sddm-rose-pine /usr/share/sddm/themes/
sudo cp ~/newtonrice/sddm/theme.conf /usr/share/sddm/themes/sddm-rose-pine/
sudo cp ~/newtonrice/wallpaper/prism.png /usr/share/sddm/themes/sddm-rose-pine/
sudo cp -r ~/newtonrice/sddm/sddm.conf.d /etc/

