#!/bin/bash

# Check if yay is installed
if! command -v yay &> /dev/null; then
    echo "yay could not be found. Please install yay."
    exit 1
fi

echo "Downloading and installing packages listed in packages.txt file..."
yay -S --needed - < packages.txt 
