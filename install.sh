#/bin/bash
echo "Starting package install"
startdir=$(pwd)
echo "Installing pacman pacakges."
yes | pacman -S $(cat package.txt) 2/dev/null
echo "Finished installing pacman packages."
mkdir ~/GitClones 2> /dev/null
cd ~/GitClones
echo "Cloning Repositories"
git clone https://aur.archlinux.org/yay.git 2> /dev/null
git clone https://github.com/DownLyfter/DotFiles.git 2> /dev/null
cd yay 
yes | makepkg -si 2> /dev/null
echo "Installed yay, configurig config files"
cd $startdir
sudo systemctl enable $(cat services.txt)
cd ../DotFiles
cp pacman.conf /etc/pacman.conf
mkdir ~/.config	2> /dev/null
mv * -r ~/.config 2> /dev/null
mv .* ~/.config 2> /dev/null
yes | yay -S shell-color- scripts 2> /dev/null
sudo wget -O /etc/bash.command-not-found https://gitlab.com/dwt1/bash-insulter/-/raw/master/src/bash.command-not-found
echo "Removing orphans."
sudo pacman -R $(pacman -Qqdt)
echo "Finished"
sleep 5
sudo reboot

