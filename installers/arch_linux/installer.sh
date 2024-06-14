#!/usr/bin/zsh

# Check if yay is installed
if! [ command -v yay &> /dev/null ] then
    echo "yay could not be found. Please install yay."
    exit 1
fi

echo "Downloading and installing packages listed in packages.txt file..."
yay -S --needed - < packages.txt 

echo "Installing polybar themes..."
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
