#/bin/bash
echo "Starting package install"
startdir=$(pwd)
echo "Installing pacman pacakges."
yes |sudo pacman -S $(cat package.txt) 
echo "Finished installing pacman packages."
mkdir ~/GitClones
cd ~/GitClones
echo "Cloning Repositories"
git clone https://aur.archlinux.org/yay.git 
git clone https://github.com/DownLyfter/DotFiles.git 
cd yay 
yes | makepkg -si
echo "Installed yay, configurig config files"
cd $startdir
sudo systemctl enable $(cat services.txt)
cd ../DotFiles
cp pacman.conf /etc/pacman.conf
mkdir ~/.config	
mv * -r ~/.config
mv .* ~/.config 
yes | yay -S shell-color- scripts 
sudo wget -O /etc/bash.command-not-found https://gitlab.com/dwt1/bash-insulter/-/raw/master/src/bash.command-not-found
echo "Removing orphans."
sudo pacman -R $(pacman -Qqdt)
echo "Finished"

