#!/usr/bin/zsh

if [[ $EUID == 0 ]] then
  echo "Do not run this script as root."
  exit 1
fi

# Check if yay is installed
cd $HOME
if! [ command -v yay &> /dev/null ] then
  pacman -Sy --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

echo "Downloading and installing packages listed in packages.txt file..."
yay -S --needed - < packages.txt 

echo "Installing polybar themes..."
cd $HOME
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh

echo "Installing rofi themes..."
cd $HOME
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
