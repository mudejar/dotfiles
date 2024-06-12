#!/bin/bash

echo "Downloading and installing yay package manager for AUR packages..."
pacman -Sy --needed git base-devel
cd yay
makepkg -si

echo "Downloading and installing packages listed in packages.txt file..."
yay -S --needed - < packages.txt 
