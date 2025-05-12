#!/bin/sh

yay -S --needed --noconfirm - < packages.txt

git clone https://www.github.com/harishnkr/.dotfiles
git clone https://www.github.com/harishnkr/newtonrice
git clone https://www.github.com/harishnkr/TermRainbow
git clone https://www.github.com/harishnkr/st
git clone https://github.com/lwndhrst/sddm-rose-pine
git clone https://github.com/harishnkr/nvim-config ~/.config/nvim


# Install own fork of ST terminal
cd ~/st/
make all
sudo make install

cd ~/.dotfiles/
stow zsh tmux lf dunst doom

#To install the tmux plugins first time
cd ~
./.tmux/plugins/tpm/scripts/install_plugins.sh

#Change shell
chsh -s /bin/zsh

cd ~/newtonrice/
stow bspwm sxhkd polybar picom
cp -r wallpaper/ ~/wallpaper
cp -r fonts/ ~/.local/share/fonts
fc-cache

# doom emacs config
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

#Copy sddm greether theme
sudo mv ~/sddm-rose-pine /usr/share/sddm/themes/
sudo cp ~/newtonrice/sddm/theme.conf /usr/share/sddm/themes/sddm-rose-pine/
sudo cp ~/newtonrice/wallpaper/prism.png /usr/share/sddm/themes/sddm-rose-pine/
sudo cp -r ~/newtonrice/sddm/sddm.conf.d /etc/

