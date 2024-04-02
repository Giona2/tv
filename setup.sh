#!/bin/bash

echo ""
echo "This setup bash script will install:"
echo "- nala"
echo "- python3"
echo "- python3-tk"
echo "- openbox"
echo ""
echo -n "Continue? [Y/n] "
read confirmed_install

cd ~/

if [ "$confirmed_install" != "y" ] && [ "$confirmed_install" != "Y" ]; then
    echo "Cancelling..."
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt install -y nala

sudo nala install -y python3
sudo nala install -y python3-tk
sudo nala install -y openbox

sudo mv tv/main.py ..
sudo rm -r tv/
