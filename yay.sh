sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R  cloudcone:users yay
cp -r yay/ ~/
cd ~/
cd yay/
makepkg -si
cd ..
rm -rf yay/
