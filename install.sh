echo "Starting package install"
yes | pacman -S $(cat package.txt) 2/dev/null
mkdir ~/GitClones 2> /dev/null
cd ~/GitClones
echo "Cloning Repositories"
git clone https://aur.archlinux.org/yay.git 2> /dev/null
git clone https://github.com/DownLyfter/DotFiles.git 2> /dev/null
cd yay 
yes | makepkg -si 2> /dev/null
echo "Installed yay, configurig config files"
cd ../DotFiles
mkdir ~/.config	2> /dev/null
mv * -r ~/.config 2> /dev/null
mv .* ~/.config 2> /dev/null
echo "done"
