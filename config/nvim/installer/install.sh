#!/bin/bash

echo "Installing all requirements for a working neovim installation..."

echo "Would you like to download requirements for Go related projects? (yes/no)"
read answer

case $answer in
  [Yy]* )
      echo "Downloading Go requirements..."
      # TODO: place code for downloading Golang and all go related tools here
      # go install github.com/go-delve/delve/cmd/dlv@latest
      ;;
  * )
      echo "Skipping requirements download."
      ;;
esac
